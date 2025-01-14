# Server-Driven UI Demo

This project demonstrates a simple backend for a server-driven UI approach using:

- **FastAPI** for the web framework and automatic Swagger/OpenAPI docs  
- **Jinja2** for JSON templating  
- **JSON files** for user data  

The backend returns JSON screens (`home_screen` and `offer_list_screen`) that can be interpreted by a Flutter app using the `json_dynamic_widget` package.

---

## Project Structure

```txt
backend/
├─ app.py                   # Main FastAPI app
├─ data/
│  ├─ simon.json
│  ├─ ruben.json
│  └─ guest.json
├─ screens/
│  ├─ home_screen.json.j2
│  └─ offer_list_screen.json.j2
├─ requirements.txt
└─ README.md

Features
	1.	User Endpoints
	•	GET /users/{user_id}
Returns user data from a JSON file (simon.json, ruben.json, or guest.json).
	2.	Screen Endpoints
	•	GET /screen/{screen_name}/{user_id}
Renders a Jinja2 template (.json.j2) with user data, returning JSON that can be used by the Flutter json_dynamic_widget package.
	3.	Swagger/OpenAPI Documentation
FastAPI automatically generates API documentation at [BASE_URL]/docs.

Setup and Usage with Docker

	2.	Build the Docker Image
From inside the server_driven_ui_demo folder (where the Dockerfile is located), run:

docker build -t server_driven_ui_demo .


	3.	Run the Container
Once the image is built, run it:

docker run -d -p 8000:8000 --name server_driven_ui_demo_container server_driven_ui_demo

	•	The API will be accessible at http://127.0.0.1:8000.

	4.	Check Swagger UI
Navigate to http://127.0.0.1:8000/docs to see the automatically generated API documentation.
	5.	Stop & Remove the Container
To stop and remove it:

docker stop server_driven_ui_demo_container
docker rm server_driven_ui_demo_container

Testing the Endpoints
	•	Get user data:
GET /users/{user_id}
(Examples: simon, ruben, guest)
	•	Get a screen:
GET /screen/{screen_name}/{user_id}
(Example screens: home_screen, offer_list_screen)

Flutter Integration
	•	Flutter dependency: json_dynamic_widget
	•	Fetch the JSON screen from the /screen/{screen_name}/{user_id} endpoint.
	•	Parse with JsonWidgetData.fromDynamic(screenJson) and render in your Flutter widget tree.

License

MIT License

Contributions

Feel free to open an issue or pull request.

