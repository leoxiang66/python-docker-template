# python-docker-template

## install docker
```bash
sudo apt-get install docker.io
```

## build docker image and debug
```bash
# build docker image
sudo docker build -t app_name:0.1.0 .

# run in debug mode
sudo docker run -p 8080:8080 --name container_name app_name:0.1.0

# access app: http://localhost:8080
```

## push image to hub
```bash
# login
sudo docker login -u username

# create a tag
sudo docker tag app_name:0.1.0 username/app_name:0.1.0

# push
sudo docker push username/app_name:0.1.0

# deploy (-d: deamon)
sudo docker run -dp 8080:8080 username/app_name:0.1.0
```

## docker list image, pull and run
```bash
# list images
sudo docker image ls

# pull image
sudo docker pull adapting/test-project:0.1.0 #https://hub.docker.com/r/adapting/test-project 

# run (create a container)
sudo docker run -p 8080:8080 --name container_name adapting/test-project:0.1.0
```

## container
container is a (running/stopped) instance of an image.

```bash
# list all containers
sudo docker container ls -a

# Removes a stopped container
sudo docker container rm <container_id> 

# Forces the removal of a running container (uses SIGKILL)
sudo docker container rm -f <container_id> 

# resume/restart an existing container
sudo docker start -a -i <container_ID/Name>
```
