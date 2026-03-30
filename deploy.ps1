param (
    [string]$DockerUser,
    [string]$DockerToken
)
# Connexion Docker Hub
docker login -u $DockerUser -p $DockerToken

# Arrêter et supprimer ancien conteneur
docker stop flask_app -ErrorAction SilentlyContinue
docker rm flask_app -ErrorAction SilentlyContinue

# Pull dernière image Docker
docker pull $DockerUser/flask_devops_demo:latest

# Lancer le conteneur Flask
$container = docker run -d --name flask_app -p 5000:5000 $DockerUser/flask_devops_demo:latest
if (-not $container) {
    Write-Error "Container failed to start!"
    exit 1
} else {
    Write-Host "Container started successfully: $container"
}