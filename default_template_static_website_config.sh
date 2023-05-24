#Define project name
echo "Enter project name: e.g. CompanyName Site , ToDo App"
read PROJECT_NAME

# Create project directory
mkdir $PROJECT_NAME
cd $PROJECT_NAME

# Create project Structure directory
mkdir  assets 

mkdir assets/src assets/dist  assets/src/sass assets/src/js  assets/src/fonts assets/src/imgs  


touch index.html about.html  contact.html  work.html  webpack.mix.js  assets/src/sass/app.scss assets/src/js/app.js

#install depenedcies for SASS
npm init -y
npm install -D sass
npm instal laravel-mix --save-dev
npm install laravel-mix-purgecss --save-dev
npm install uniformcss --save-dev
npm install webpack-livereload-plugin --save-dev




# Populate Default boilerplate files with content  
cat <<EOF > webpack.mix.js
let mix = require('laravel-mix');
var LiveReloadPlugin = require('webpack-livereload-plugin');
require('laravel-mix-purgecss');
mix.setPublicPath("assets/dist");

    //Compile SASS
mix.sass('assets/src/sass/app.scss', 'dist', {
   sassOptions: {
        includePaths:[
        './node_modules/uniformcss'
    ]
   }
}).purgeCss({
    content: ['_site/*.html,_site/index.html'],
    extensions: ['html','js','svg'],
    safelist: { deep: [/hljs/] },
});
//Compile J

mix.js('assets/src/js/app.js', 'dist').version();

//COPY DIRS
mix.copyDirectory('assets/src/fonts', 'assets/dist/fonts');
mix.copyDirectory('assets/src/imgs', 'assets/dist/imgs');


mix.webpackConfig({
        plugins: [new LiveReloadPlugin({port:8080  || 8081 ,delay:600})]
    });

EOF


# Populate index.html  
cat <<EOF > index.html
<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
	<title>$PROJECT_NAME</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">

  <link rel="icon" href="/favicon.ico" sizes="any">
  <link rel="icon" href="/icon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="icon.png">

  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/style.css">

  <link rel="manifest" href="site.webmanifest">
  <meta name="theme-color" content="#fafafa">
</head>

<body>
  <h1>Welcome to $PROJECT_NAME static site  </h1>
  <p>This is a skeleton static website project.</p>
  <!-- Add your site or application content here -->
  <p>Hello world! This is HTML5 Boilerplate.</p>

  <script type="text/javascript" src="js/main.js"></script>
  <script src="http://localhost:8080/livereload.js"></script>

  <footer>
    
  </footer>
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

    echo "$PROJECT_NAME  Directory was created successfully!"