#Define project name
echo "Enter project name: e.g. CompanyName Site , ToDo App"
read PROJECT_NAME

# Create project directory
mkdir $PROJECT_NAME
cd $PROJECT_NAME

mkdir public public/css public/js public/imgs
touch public/index.html public/css/style.css public/js/app.js

npm init -y
npm install express

#Populate index.js
echo "const express = require('express')
const app = express();
const path = require('path');
const public = path.join(__dirname, 'public');

app.use(express.static(path.join(__dirname,'public')));

/*
app.use('/about', function(req, res) {
  res.sendFile(path.join(public, 'about.html'));
});
*/
const port = 3000;
app.listen(port,() =>{
   // console.log(`Express listening at http://localhost:8020`);
});" > index.js




echo "node modules + index.js  created successfully!"

#Create & Populate Dockerfile
cat << EOF > Dockerfile
# Add the base image for the Node.js app
FROM node:18-alpine3.15 
# Create a working folder for running the application inside the Docker container 
WORKDIR /src/app
# Copy dependencies to the above working folder
COPY package.json ./
# Copy dependencies loom file to the working folder
COPY package-lock.json .
# Install the dependencies based on the above json files
RUN npm install
# Copy every code to the Docker working directory
COPY ./ ./
# Tell Docker the container will listen on port 3000
EXPOSE 3000
# Run the the Node.js application
CMD ["node", "index.js"]
EOF

# Populate index.html  
cat <<EOF > public/index.html
<!DOCTYPE html>
	<html>
		<head>
			<title>$PROJECT_NAME</title>
			<link rel="stylesheet" type="text/css" href="css/style.css">
		</head>
			<body>
			<h1>Welcome to $PROJECT_NAME from NodeJS Express +  Docker + K8  </h1>
			<p>This is a skeleton static website project.</p>
			<script type="text/javascript" src="js/main.js"></script>
		</body>
</html>
EOF
# Create project READme 

echo "# Project Title

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

	echo "Readme.md created successfully!"

# Prompt user for deployment name and image
echo "Enter deployment name:"
read DEPLOYMENT_NAME

# Create deployment YAML file
cat <<EOF >$PROJECT_NAME_deployment.yaml
# First, add the API
apiVersion: apps/v1
# This will be the deployment setup
kind: Deployment
metadata:
  # Name your Deployment here
  name: example-$DEPLOYMENT_NAME-app-dep
  labels:
    # label your deployment
    app: example-$DEPLOYMENT_NAME-test-app
spec:
  # The number of pods/replicas to run
  replicas: 1            
  selector:
    matchLabels:
    # selector to match the pod
      app: example-$DEPLOYMENT_NAME-test-app  
  template:
    metadata:
      labels:
      # label your pod
        app: example-$DEPLOYMENT_NAME-test-app  
    spec:
      containers:
      # Add the container name for Kubernetes
      - name: test-app 
      # Add the local image name
        image: name of  docker img of project 
        # never pull the image policy
        imagePullPolicy: Never
        ports:
        # port for running the container
        - containerPort: 3000   
---
# First, add the Service API
apiVersion: v1
# This will be the Service setup
kind: Service
metadata:
  # Your service name
  name: example-$DEPLOYMENT_NAME-app-src 
spec:
  selector:
    # selector that matches the pod
    app: example-$DEPLOYMENT_NAME-test-app 
  # type of service
  type: LoadBalancer     
  ports:
  - protocol: TCP 
    # port for exposing the service        
    port: 5000
    # portfor exposing the pod             
    targetPort: 3000
    # port for exposing the node       
    nodePort: 31110
EOF

echo "K8 deployment + service config created successfully! "
echo " Reminder  Still need to  
1.In package.json change     'test': 'echo \'Error: no test specified\'' && exit 1 >     'start':'node index.js'
2. build the Docker image ( e.g. docker build -t $DOCKER_IMG_NAME . make sure to pick a desired port to expose the site to)	 
3.Run the Docker container - e.g. e.g. docker run  -p 80:80 $DOCKER_IMG_NAME 
4.Run config file  - e.g. kubectl apply -f deployment.yaml (  make sure that Minikube  +  kubectl cli + docker Desktop are installed)  
5.Check that Deployment + Service + pods for Container are on the cluster
    -e.g. kubectl get pods  
	kubectl get deployments.app
	kubectl get services  
	minikube service  $DEPLOYMENT_NAME-service" 