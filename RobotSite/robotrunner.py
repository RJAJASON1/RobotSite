# IMPORTANT WARNING : Do not run this file directly.
# Follow the README instructions to set up and run the server properly.
# This file is part of the RobotSite application and is intended to be run
# through a WSGI server as described in the documentation.
import os
import time
import threading
import subprocess
import webbrowser
from flask import Flask, render_template, request, redirect, send_from_directory, Response, stream_with_context
from werkzeug.utils import secure_filename

robot_process = None
log_file_path = "RobotSite/results/live_log.txt"

app = Flask(__name__)
UPLOAD_FOLDER = 'RobotSite/uploads'
RESULT_FOLDER = 'RobotSite/results'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['RESULT_FOLDER'] = RESULT_FOLDER

os.makedirs(UPLOAD_FOLDER, exist_ok=True)
os.makedirs(RESULT_FOLDER, exist_ok=True)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/run', methods=['POST'])
def run_test():
    global robot_process

    if 'testfile' not in request.files:
        return "No file uploaded", 400

    file = request.files['testfile']
    if file.filename == '':
        return "No selected file", 400

    filename = secure_filename(file.filename)
    filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
    file.save(filepath)

    with open('RobotSite/results/live_log.txt', 'w') as log_file:
        log_file.write('')

    def run_robot():
        global robot_process
        with open('RobotSite/results/live_log.txt', 'a') as log_file:
            robot_process = subprocess.Popen(
                ["robot", "--outputdir", app.config['RESULT_FOLDER'], filepath],
                stdout=log_file,
                stderr=subprocess.STDOUT
            )
            robot_process.wait()
            log_file.write("\nEND_OF_TEST\n")

    threading.Thread(target=run_robot).start()
    return "Test started", 200


@app.route('/stop', methods=['POST'])
def stop_test():
    global robot_process
    if robot_process and robot_process.poll() is None:
        robot_process.terminate()
        return "Test execution stopped.", 200
    return "No test is currently running.", 400

@app.route('/stream')
def stream_log():
    def generate():
        last_size = 0
        while True:
            if os.path.exists(log_file_path):
                with open(log_file_path, 'r') as f:
                    f.seek(last_size)
                    lines = f.readlines()
                    last_size = f.tell()
                    for line in lines:
                        yield f'data: {line}\n\n'
            time.sleep(1)
    return Response(stream_with_context(generate()), mimetype='text/event-stream')

@app.route('/results')
def show_results():
    return render_template('results.html')

@app.route('/results/<path:filename>')
def download_file(filename):
    return send_from_directory(app.config['RESULT_FOLDER'], filename)

if __name__ == '__main__':
    from waitress import serve
    print("✅ Running production server at http://127.0.0.1:8000")
    serve(app, host='0.0.0.0', port=8000)

