import os
from flask import Flask, render_template

app = Flask(__name__, template_folder='static')


@app.route('/')
@app.route('/index')
def main():
    """
    Run the flask server
    :return: object
    """
    message = os.getenv("SALUTE") if os.getenv("SALUTE") is not None else "ekoparty 2020"
    header_image = os.getenv("HEADER_IMG") if os.getenv("HEADER_IMG") is not None else "static/img/nyancat.jpg"

    app._static_folder = './static'
    content = {'message': message, 'header_image': header_image}

    return render_template('index.html', **content)
