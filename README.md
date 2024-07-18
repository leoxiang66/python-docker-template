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

### To export a container to a new image, you can use the `docker commit` command. Here are the steps:

1. Find the container ID of the container you want to export. You can use the `docker ps` command to list running containers and their IDs.

2. Stop the container (if it's running) using the `docker stop` command followed by the container ID or name.

3. Use the `docker commit` command to create a new image from the container. The basic syntax is:
   ```
   docker commit <container-id> <new-image-name>:<tag>
   ```
   - Replace `<container-id>` with the ID of the container you want to export.
   - Replace `<new-image-name>` with the desired name for the new image.
   - Optionally, you can specify a `<tag>` for the image. If not provided, it defaults to `latest`.

   For example:
   ```
   docker commit abc123def456 my-new-image:v1
   ```

4. After running the `docker commit` command, a new image will be created from the container's current state. You can verify the image creation by running `docker images` to list all available images.

5. You can now use the newly created image to start new containers or share it with others.

Note: Keep in mind that the `docker commit` command captures the current state of the container, including any modifications made to the filesystem and configuration. It's often recommended to use Dockerfiles to define and build images in a more reproducible and maintainable way, rather than relying on manual container modifications and commits.

If you want to save the image to a file for sharing or backup purposes, you can use the `docker save` command to export the image to a tar archive:
```
docker save -o <output-file.tar> <image-name>:<tag>
```
- Replace `<output-file.tar>` with the desired filename for the exported image.
- Replace `<image-name>` and `<tag>` with the name and tag of the image you want to save.

The exported tar archive can then be imported on another Docker host using the `docker load` command.
