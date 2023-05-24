# Prompt user for project name
echo "Enter project name:"
read PROJECT_NAME

# Create new ReactJS project
npx create-react-app $PROJECT_NAME

# Output success message
echo "Reactjs app Project  $PROJECT_NAME was created successfully!"

# Navigate to project directory
cd $PROJECT_NAME

# Create project READme 

echo "# $PROJECT_NAME 

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them


### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

And repeat

until finished


End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

Give an example

bash

### And coding style tests

Explain what these tests test and why

Give an example

markdown


## Deployment

Add additional notes about how to deploy this on a live system

## Built With

list of technology / packages used for project

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **John Doe** - *Initial work* - [JohnDoe](https://github.com/JohnDoe)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

" > README.md

echo "README.md for project created successfully!"

# Create Dockerfile
cat <<EOF > Dockerfile
# ==== CONFIGURE =====
FROM node:14.17.6-alpine

WORKDIR /app

COPY package*.json ./
# ==== BUILD =====
RUN npm install

COPY . .
# ==== RUN =====
EXPOSE 3000

CMD ["npm", "start"]
EOF


echo "Dockerfile for project created successfully!"

# Prompt user for deployment name and image
echo "Enter deployment name:"
read DEPLOYMENT_NAME



# Create deployment YAML file
cat <<EOF > deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: $DEPLOYMENT_NAME-react-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: $DEPLOYMENT_NAME-react-app
  template:
    metadata:
      labels:
        app: $DEPLOYMENT_NAME-react-app
    spec:
      containers:
      - name: $DEPLOYMENT_NAME-react-app
        image: e.g. name of docker img used in docker build command
		imagePullPolicy: Never
        ports:
        - containerPort: e.g. 3000
    restartPolicy: Always
---
apiVersion: v1
kind: Service
metadata:
  name: $DEPLOYMENT_NAME-react-app-service
  labels:
    app: $DEPLOYMENT_NAME-react-app--service
spec:
  type: NodePort
  ports:
  - nodePort: 32310
    port: e.g. 5000
    targetPort: e.g. 3000
    protocol: TCP
  selector:
    app: $DEPLOYMENT_NAME-react-app
EOF

# Output success message
echo "K8 Deployment yaml file  for project was created successfully!"
echo " Reminder  Still need to  1. build the Docker image ( e.g. docker build -t $DOCKER_IMG_NAME . make sure to pick a desired port to expose the site to)	 
	2.Run the Docker container - e.g. e.g. docker run  -p 80:80 $DOCKER_IMG_NAME 
	3.Run config file  - e.g. kubectl apply -f deployment.yaml (  make sure that Minikube  +  kubectl cli + docker Desktop are installed)  
	4.Check that Deployment + Service + pods for Container are on the cluster
	-e.g. kubectl get pods  
	kubectl get deployments.app
	 kubectl get services  
     kubectl get all
	minikube service  $DEPLOYMENT_NAME-service" 