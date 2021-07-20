# NetCoreDockerAPIRD

# Create Docker Image

## Build Docker Image

    Syn: 
    docker build -t <<DockerImageName>>:<<TagName>> .
    Example: 
    docker build -t bhvkrishna/dotnetcorerd:v1 .

## List Docker Images

    docker images

## Run Docker Container

    docker run -p 2021:80 bhvkrishna/dotnetcorerd:v1

## Verify Docker Container

    docker ps

## Verify Docker Container logs

    docker logs <<ContainerID>>
ContainerID - Container ID from docker ps command.

## Verify Application

    http://localhost:2021/WeatherForecast

## Login to Docker Hub

    docker login
Enter username and password for docker hub.

## Push Docker Image to docker Hub.

    docker push bhvkrishna/dotnetcorerd:v1

# Deploy Docker Container to Azure Container Instance

## Create Resource Group:

    az group create --name DotnetLinRDDemo --location westus

## Create Azure Container Instance:

    az container create --image bhvkrishna/dotnetcorerd:v1 --resource-group DotnetLinRDDemo --location westus --name dotnet-weather-container-group --os-type Linux --cpu 2 --memory 1.5 --dns-name-label linrd-weather-mvc --ip-address public --ports 80 --verbose

## Verify Deployment

    az container show --name dotnet-weather-container-group --resource-group DotnetLinRDDemo

## Verify logs

    az container logs --resource-group DotnetLinRDDemo --name dotnet-weather-container-group


## Verify WebSite:

    http://linrd-weather-mvc.westus.azurecontainer.io/weatherforecast