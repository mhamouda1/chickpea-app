#get variables
tag=$(cat tag.txt)
image=$(cat image.txt)

#upload to ECR
docker push $image:$tag
docker push $image
