import os
from flask import Flask,send_from_directory, request # Add render_template


app = Flask(__name__)

@app.route("/health")
def health():
    return "OK"

app = Flask(__name__)

@app.route("/<path>", methods=['GET'])
def path(path):
    return send_from_directory(f"{os.getcwd()}/static", path)

@app.route("/", methods=['GET'])
def dev():
    if request.args:
        print(request.args)
        key = list(request.args)[0]
        return send_from_directory(f"{os.getcwd()}/static", key)
    else:
        return send_from_directory(f"{os.getcwd()}/static", "index.html")

@app.route("/css/<name>", methods=['GET'])
def css(name):
    return send_from_directory(f"{os.getcwd()}/static/css", name)

@app.route("/js/<name>", methods=['GET'])
def js(name):
    return send_from_directory(f"{os.getcwd()}/static/js", name)    

@app.route("/images/<name>", methods=['GET'])
def images(name):
    return send_from_directory(f"{os.getcwd()}/static/images", name)

@app.route("/media/<name>", methods=['GET'])
def media(name):
    return send_from_directory(f"{os.getcwd()}/static/media", name)    