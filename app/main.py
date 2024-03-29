from flask import Flask
from flask_httpauth import HTTPBasicAuth
from werkzeug.security import generate_password_hash, check_password_hash
import subprocess
from dotenv import load_dotenv
import os

app = Flask(__name__)
auth = HTTPBasicAuth()

# API tokens and URLs should be read from a .env file
# Make sure you have this file set up before starting the app
load_dotenv()

users = {
    "john": generate_password_hash("hello"),
    "susan": generate_password_hash("bye")
}

@auth.verify_password
def verify_password(username, password):
    if username in users and check_password_hash(users.get(username),
                                                 password):
        return username

@app.route('/')
@auth.login_required
def index():
    print("subprocess has been called")
    subprocess.call("./app/test1.py")
    print("Back to app.py")
    return "Hello, %s!" % (auth.current_user())


@app.route('/bypass')
def bypass():
    return "You've bypassed the authentication! Way to go!"


if __name__ == '__main__':
  app.run(host='0.0.0.0', port=5555)

