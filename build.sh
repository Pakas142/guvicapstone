if [ "$GIT_BRANCH" = "origin/dev" ]; then
	docker stop $(docker ps -aq)
    docker image prune -af
    docker build -t $IMAGE_NAME .
    docker login -u pakas142 -p Pakas@142
    docker tag $IMAGE_NAME pakas142/dev:latest
    docker push pakas142/dev:latest
elif [ "$GIT_BRANCH" = "origin/master" ]; then
	docker stop $(docker ps -aq)
    docker image prune -af
    docker build -t $IMAGE_NAME .
    docker login -u pakas142 -p Pakas@142
    docker tag $IMAGE_NAME pakas142/prod:latest
    docker push pakas142/prod:latest
else echo "either git pull not available in dev or master "
fi
