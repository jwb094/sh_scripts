# Define project name
echo "Enter project name:"
read PROJECT_NAME
# Define docker image name
echo "Enter desired docker image name:"
read DOCKER_IMG_NAME

# Create project directory
mkdir $PROJECT_NAME
cd $PROJECT_NAME

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

# Create Dockerfile
cat << EOF > Dockerfile
FROM ubuntu:latest
RUN apt-get update
RUN apt-get install nginx -y
COPY public_html/ /var/www/html/
EXPOSE e.g 80
CMD ["nginx","-g","daemon off;"]
EOF

# Create folder and default files
mkdir public_html
mkdir public_html/css public_html/js public_html/imgs


touch public_html/index.html public_html/css/styles.css public_html/js/main.js 

	# Populate index.html  

	echo "<!DOCTYPE html>
	<html>
		<head>
			<title>$PROJECT_NAME</title>
			<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">
		</head>
			<body>

			<h1>Welcome to $PROJECT_NAME from Nginx +  Docker + K8  </h1>
			<p>This is a skeleton static website project.</p>
			<script type=\"text/javascript\" src=\"js/main.js\"></script>
		</body>
	</html>" > public_html/index.html




	
	# Output success message
	echo "Project created successfully!"
	echo "Dockerfile created successfully!"
	echo "K8 deployment + service config created successfully! "
	echo " Reminder  Still need to  1. build the Docker image ( e.g. docker build -t $DOCKER_IMG_NAME . make sure to pick a desired port to expose the site to)	 
	2.Run the Docker container - e.g. e.g. docker run  -p 80:80 $DOCKER_IMG_NAME " 