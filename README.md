# RobotSite

RobotSite Test Runner is a lightweight web-based tool built with Flask that allows users to run Robot Framework test suites directly from their browser. Instead of using the command line, this app provides a simple graphical interface where you can upload .robot files, execute them on the backend, and view the test results instantly in your browser.


----------

# Modules to install

- flask
- werkzeug
- waitress
- and other modules that you are prompted to install

----------

# INSTRUCTIONS

- Open your terminal or command prompt 

- Run **waitress-serve --listen=0.0.0.0:8000 robotrunner:app** Make sure that you are in the project directory when running the command.

- Copy the url and open it in your browser (http://127.0.0.1:8000/)

- Upload a test suite file or .robot file

- Wait for the test to complete

- When is done, test details will appear below.
