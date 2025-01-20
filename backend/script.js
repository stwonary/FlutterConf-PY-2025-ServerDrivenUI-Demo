try {

    var count = payload.context.count;
    if (!count) {
        count = 1;
    }

    let bannerConfig = {
        "tag": "home",
        "body": {
            "type": "container",
            "color": "#E5E5E5",
            "width": 100000,
            "padding": {
                "top": 32,
                "left": 24,
                "right": 24,
                "bottom": 32,
            },
            "child": {
                "type": "text",
                "data": "Este banner se ha mostrado " + count + " veces",
                "style": {
                    "fontSize": 24,
                    "fontWeight": "w600",
                    "color": "#000000",
                    "height": 1.3
                }
            }
        }
    };

    let bottomSheetConfig = {
        "backgroundColor": "ffffffff",
        "shape": {
            "side": {
                "color": "ff000000",
                "width": 1.2,
                "style": 1
            },
            "borderRadius": "40.0:40.0,40.0:40.0,0.0:0.0,0.0:0.0"
        },
        "body": {
            "type": "padding",
            "padding": {
                "top": 32,
                "left": 24,
                "right": 24,
                "bottom": 24
            },
            "child": {
                "type": "column",
                "crossAxisAlignment": "start",
                "mainAxisSize": "min",
                "children": [{
                    "type": "container",
                    "width": 56,
                    "height": 56,
                    "decoration": {
                        "borderRadius": 12
                    },
                    "clipBehavior": "hardEdge",
                    "child": {
                        "type": "image",
                        "src": "https://pbs.twimg.com/profile_images/1865970614873509888/g_uvwPhq_400x400.jpg"
                    }
                },
                    {
                        "type": "sizedBox",
                        "height": 40
                    },
                    {
                        "type": "image",
                        "src": "https://raw.githubusercontent.com/BuildMirai/mirai/refs/heads/dev/assets/Welcome to.png"
                    },
                    {
                        "type": "text",
                        "data": "Mirai Playground",
                        "style": {
                            "fontSize": 36,
                            "fontWeight": "w600",
                            "height": 1.3
                        }
                    },
                    {
                        "type": "sizedBox",
                        "height": 32
                    },
                    {
                        "type": "text",
                        "data": "Mirai is a Server-Driven UI (SDUI) framework for Flutter. Mirai allows you to build beautiful cross-platform applications with JSON in real time.",
                        "style": {
                            "fontSize": 18,
                            "fontWeight": "w400",
                            "height": 1.5
                        }
                    },
                    {
                        "type": "container",
                        "height": 1,
                        "widht": 1000,
                        "color": "#20010810"
                    },
                    {
                        "type": "sizedBox",
                        "height": 24
                    },
                    {
                        "type": "text",
                        "data": "Follow us for more updates:",
                        "style": {
                            "fontSize": 18,
                            "fontWeight": "w400",
                            "height": 1.5,
                            "color": "#80010810"
                        }
                    },
                    {
                        "type": "sizedBox",
                        "height": 20
                    },
                    {
                        "type": "column",
                        "spacing": 20,
                        "children": [{
                            "type": "row",
                            "spacing": 20,
                            "children": [{
                                "type": "container",
                                "width": 44,
                                "height": 44,
                                "decoration": {
                                    "borderRadius": 12
                                },
                                "clipBehavior": "hardEdge",
                                "child": {
                                    "type": "image",
                                    "src": "https://raw.githubusercontent.com/BuildMirai/mirai/refs/heads/dev/assets/github.png"
                                }
                            },
                                {
                                    "type": "text",
                                    "data": "github.com/BuildMirai",
                                    "style": {
                                        "fontSize": 18,
                                        "fontWeight": "w500",
                                        "height": 1.5
                                    }
                                }
                            ]
                        },
                            {
                                "type": "row",
                                "spacing": 20,
                                "children": [{
                                    "type": "container",
                                    "width": 44,
                                    "height": 44,
                                    "decoration": {
                                        "borderRadius": 12
                                    },
                                    "clipBehavior": "hardEdge",
                                    "child": {
                                        "type": "image",
                                        "src": "https://raw.githubusercontent.com/BuildMirai/mirai/refs/heads/dev/assets/x.png"
                                    }
                                },
                                    {
                                        "type": "text",
                                        "data": "x.com/buildmirai",
                                        "style": {
                                            "fontSize": 18,
                                            "fontWeight": "w500",
                                            "height": 1.5
                                        }
                                    }
                                ]
                            },
                            {
                                "type": "row",
                                "spacing": 20,
                                "children": [{
                                    "type": "container",
                                    "width": 44,
                                    "height": 44,
                                    "decoration": {
                                        "borderRadius": 12
                                    },
                                    "clipBehavior": "hardEdge",
                                    "child": {
                                        "type": "image",
                                        "src": "https://raw.githubusercontent.com/BuildMirai/mirai/refs/heads/dev/assets/linkedin.png"
                                    }
                                },
                                    {
                                        "type": "text",
                                        "data": "/company/buildmirai",
                                        "style": {
                                            "fontSize": 18,
                                            "fontWeight": "w500",
                                            "height": 1.5
                                        }
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }
        }
    };

    let dialogConfig = {
        "backgroundColor": "ffffffff",
        "clipBehavior": "none",
        "body": {
            "type": "form",
            "child": {
                "type": "padding",
                "padding": {
                    "top": 32,
                    "left": 24,
                    "right": 24,
                    "bottom": 32,
                },
                "child": {
                    "type": "column",
                    "crossAxisAlignment": "start",
                    "mainAxisSize": "min",
                    "children": [{
                        "type": "text",
                        "data": "BettrDo Sign in",
                        "style": {
                            "fontSize": 24,
                            "fontWeight": "w900",
                            "height": 1.3
                        }
                    },
                        {
                            "type": "sizedBox",
                            "height": 24
                        },
                        {
                            "type": "textFormField",
                            "id": "email",
                            "autovalidateMode": "onUserInteraction",
                            "validatorRules": [{
                                "rule": "isEmail",
                                "message": "Please enter a valid email"
                            }],
                            "style": {
                                "fontSize": 16,
                                "fontWeight": "w400",
                                "height": 1.5
                            },
                            "decoration": {
                                "hintText": "Email",
                                "filled": true,
                                "fillColor": "#FFFFFF",
                                "border": {
                                    "type": "outlineInputBorder",
                                    "borderRadius": 8,
                                }
                            }
                        },
                        {
                            "type": "sizedBox",
                            "height": 16
                        },
                        {
                            "type": "textFormField",
                            "autovalidateMode": "onUserInteraction",
                            "validatorRules": [{
                                "rule": "isPassword",
                                "message": "Please enter a valid password"
                            }],
                            "obscureText": true,
                            "maxLines": 1,
                            "style": {
                                "fontSize": 16,
                                "fontWeight": "w400",
                                "height": 1.5
                            },
                            "decoration": {
                                "hintText": "Password",
                                "filled": true,
                                "fillColor": "#FFFFFF",
                                "border": {
                                    "type": "outlineInputBorder",
                                    "borderRadius": 8,
                                }
                            }
                        },
                        {
                            "type": "sizedBox",
                            "height": 32
                        },
                        {
                            "type": "filledButton",
                            "style": {
                                "backgroundColor": "#151D29",
                                "shape": {
                                    "borderRadius": 8
                                }
                            },
                            "onPressed": {},
                            "child": {
                                "type": "padding",
                                "padding": {
                                    "top": 14,
                                    "bottom": 14,
                                    "left": 16,
                                    "right": 16
                                },
                                "child": {
                                    "type": "row",
                                    "mainAxisAlignment": "spaceBetween",
                                    "children": [{
                                        "type": "text",
                                        "data": "Proceed"
                                    },
                                        {
                                            "type": "icon",
                                            "iconType": "material",
                                            "icon": "arrow_forward"
                                        }
                                    ]
                                }
                            }
                        },
                        {
                            "type": "sizedBox",
                            "height": 16
                        },
                        {
                            "type": "align",
                            "alignment": "center",
                            "child": {
                                "type": "textButton",
                                "onPressed": {},
                                "child": {
                                    "type": "text",
                                    "data": "Forgot password?",
                                    "style": {
                                        "fontSize": 15,
                                        "fontWeight": "w500",
                                        "color": "#4745B4"
                                    }
                                }
                            }
                        },
                        {
                            "type": "sizedBox",
                            "height": 8
                        },
                        {
                            "type": "align",
                            "alignment": "center",
                            "child": {
                                "type": "text",
                                "data": "Don't have an account? ",
                                "style": {
                                    "fontSize": 15,
                                    "fontWeight": "w400",
                                    "color": "#000000"
                                },
                                "children": [{
                                    "data": "Sign Up for BettrDo",
                                    "style": {
                                        "fontSize": 15,
                                        "fontWeight": "w500",
                                        "color": "#4745B4"
                                    }
                                }]
                            }
                        }
                    ]
                }
            }
        }
    };

    if (payload.event.index === 0) {

        payload.message = {
            type: "Banner",
            config: bannerConfig
        };
        payload.context = {
            count: count + 1
        }

    } else if (payload.event.index === 1) {

        payload.message = {
            type: "BottomSheet",
            config: bottomSheetConfig
        };

    } else if (payload.event.index === 2) {

        payload.message = {
            type: "Dialog",
            config: dialogConfig
        };

    }

    sendMessage('onSuccess', JSON.stringify(payload));
} catch (e) {
    sendMessage('onFailure', e.message);
}
