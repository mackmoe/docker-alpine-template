# DOCKER APLINE TEMPLATE
This simple template is for docker build projects using the alpine image.
- Alpine Container Image Tag Used: latest  

### How to use
1. Clone this repo 
2. Run `docker build -t <projectname> .` - To build a custom docker container based on the latest alpine image
3. Run `docker run -it <projectname>` - To start the container

Add any additional jobs/tasks that need to take place on the apline container while it's building. To see what's actively going on in the container, run it with the changes you made. I setup crond to run in the foreground once the container starts so logging into it is possible from another terminal session, to see what's taking place in the container as it's being built out.
