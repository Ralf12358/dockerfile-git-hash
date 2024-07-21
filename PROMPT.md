A pip installable module:

docky

A command line tool to containerize an application.
The app creates a two stage docker container.

Stage one clones repositories and copies and/or build the application into the container.
It preapres everything to run the app in a container.

It creates Dockerfile.
build.sh, build.bat, run.sh, run.bat and a docker-compose file.

Input is a simple config yaml file describing the process:

- copy: git repositories to clone from / or local directories (get git repository automatically)
- build: git repositories to clone from / or local directories (get git repository automatically)
- base-image (with version number)
- packages required for runtime
- build steps
- if command-line or service
- exposed ports
