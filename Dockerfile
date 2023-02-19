FROM python:3.8-slim-buster

RUN pip3 install Flask
RUN pip3 install flask_httpauth
RUN pip3 install werkzeug
COPY app.py .
COPY test1.py .
EXPOSE 5555
ENTRYPOINT ["python3", "app.py"]