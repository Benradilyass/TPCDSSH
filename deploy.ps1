param (
    [string]$DockerUser,
    [string]$DockerToken
)

# Login to Docker without using Windows credentials
$DockerToken | docker login -u $DockerUser --password-stdin

# Stop and remove old container
docker stop flask_app 2>$null
docker rm flask_app 2>$null

# Pull latest image
docker pull $DockerUser/flask_devops_demo:latest

# Run container
docker run -d --name flask_app -p 5000:5000 $DockerUser/flask_devops_demo:latest