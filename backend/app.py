import json
import os

from fastapi import FastAPI, HTTPException, Path
from fastapi.openapi.utils import get_openapi
from fastapi.responses import JSONResponse
from jinja2 import Environment, FileSystemLoader

app = FastAPI(
    title="Server-Driven UI Demo",
    description="A demo backend for server-driven UI using JSON + Jinja2 + FastAPI",
    version="1.0.0"
)

DATA_FOLDER = os.path.join(os.path.dirname(__file__), 'data')
SCREENS_FOLDER = os.path.join(os.path.dirname(__file__), 'screens')
env = Environment(loader=FileSystemLoader(SCREENS_FOLDER))


# -- Override the openapi schema to set version to 3.1.0 --
def custom_openapi():
    if app.openapi_schema:
        return app.openapi_schema
    openapi_schema = get_openapi(
        title=app.title,
        version=app.version,
        description=app.description,
        routes=app.routes,
    )
    # Force OpenAPI 3.1.0
    openapi_schema["openapi"] = "3.1.0"
    app.openapi_schema = openapi_schema
    return app.openapi_schema


app.openapi = custom_openapi


@app.get("/users/{user_id}", response_class=JSONResponse, tags=["Users"])
def get_user(
        user_id: str = Path(
            ...,
            description="User ID. Example values: simon, ruben, guest.",
        )
):
    json_path = os.path.join(DATA_FOLDER, f"{user_id}.json")
    if not os.path.isfile(json_path):
        raise HTTPException(status_code=404, detail="User not found")

    with open(json_path, 'r') as f:
        user_data = json.load(f)
    return user_data


@app.get("/screen/{screen_name}/{user_id}", response_class=JSONResponse, tags=["Screens"])
def get_screen(
        screen_name: str = Path(
            ...,
            description="Name of the screen template. Example values: home_screen, offer_list_screen.",
        ),
        user_id: str = Path(
            ...,
            description="User ID. Example values: simon, ruben, guest.",
        )
):
    json_path = os.path.join(DATA_FOLDER, f"{user_id}.json")
    if not os.path.isfile(json_path):
        raise HTTPException(status_code=404, detail="User not found")

    with open(json_path, 'r') as f:
        user_data = json.load(f)

    template_file = f"{screen_name}.json.j2"
    template_path = os.path.join(SCREENS_FOLDER, template_file)
    if not os.path.isfile(template_path):
        raise HTTPException(status_code=404, detail="Screen template not found")

    template = env.get_template(template_file)
    rendered = template.render(**user_data)

    try:
        screen_json = json.loads(rendered)
    except json.JSONDecodeError:
        raise HTTPException(status_code=500, detail="Error parsing rendered template")

    return screen_json
