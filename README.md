## Development

### Pre-requisites

* Docker

### Test image

`docker build -t <REPOSITORY_NAME>/<IMAGE_NAME>:<TAG> .`

`docker run -dit --rm -p 8080:8080 <REPOSITORY_NAME>/<IMAGE_NAME>:<TAG>`

`localhost:8080`

### Push image to ECR

`aws ecr get-login-password --region <REGION> | docker login --username AWS --password-stdin <ECR_REGISTRY_URI>`

`docker push <REPOSITORY_NAME>/<IMAGE_NAME>:<TAG>`

## Production

### Image generation and deploy to EKS

### Jenkins

#### Needed Plugins

* Default
* Cloudbees AWS Credentials

Create a new Job and configure it with "GitHub hook trigger for GITScm polling" then download the Jenkins plugin for Github and configure the needed keys.Create a new webhook from Github and link it with the project.

* New commits will trigger this job.
