# Flask Web Service Template
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](#)

> Example Flask web service for various uses

## Usage

Once you have this repository cloned,
```sh
docker-compose up -d
```
will start the Gunicorn server in detached mode.

If you want to see the server in your terminal, remove `-d`.

## Features

This template app come packages in a Docker container. Additionally, `docker-compose` volume mounting let's the app "hot reload", or reflect changes in the codebase immediately without re-building and re-deploying the container.

## Packages used

### `dotenv`

This project uses `python-dotenv` to read secrets from a `.env` file. As this file is part of the `.gitignore` list, this is a secure method to make sure secrets are not uploaded to GitHub. 

Documentation can be found [here](https://pypi.org/project/python-dotenv/).

### Flask

Flask is a Python microframework that provides the backbone of this web service. It allows the user to generate a Python web app pretty quickly.

Flask documentation can be found [here](https://flask.palletsprojects.com/).

### Gunicorn

Flask comes with a simple server that can be used for development purposes. However, it is not stable nor secure enough for production use.

As such, a production-ready WSGI server such as Gunicorn is needed. This template app comes with Gunicorn from the start.

Documentation for Gunicorn can be found [here](https://gunicorn.org/#docs).

### Flask-HTTPAuth

Sometimes, to add more security, you would want authentication to be part of your app. This template app uses Flask-HTTPAuth, a Flask extension that simplifies the use of HTTP authentication with Flask routes, to provide a simple framework to implement basic, digest, and token authenticaton.

Further documentation can be found [here](https://flask-httpauth.readthedocs.io/en/latest/).

## Author

👤 **Sumon Chattopadhyay**

* Github: [@schatto1](https://github.com/schatto1)