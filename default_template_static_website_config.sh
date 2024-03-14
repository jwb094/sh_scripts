#!/bin/bash

#Define project name
createProjectDirectory(){
  echo "Enter project name: e.g. CompanyName Site , ToDo App"
  read PROJECT_NAME

  # Create project directory
  mkdir $PROJECT_NAME && cd $PROJECT_NAME


  # Check the exit status
  if [ $? -eq 0 ]; then
      echo "Command was successful - Project $PROJECT_NAME Directory was created"
  else
    echo "Command failed - Project Directory was not created"
      exit 1
  fi

}
createProjectDirectories(){# Create project Structure directory
  mkdir  assets  assets/src assets/dist  assets/src/sass  assets/src/sass/config assets/src/sass/components assets/src/js  assets/src/fonts assets/src/imgs  



  # Check the exit status
  if [ $? -eq 0 ]; then
      echo "Command was successful - These Directories were created \nassets\nassets/src\nassets/dist\nassets/src/sass\nassets/src/sass/config\nassets/src/sass/components\nassets/src/js\nassets/src/fonts\nassets/src/imgs"
  else
    echo "Command failed - Project Directories were not created"
      exit 1
  fi
}
createProjectFiles(){
  touch index.html about.html  contact.html  work.html  webpack.mix.js  assets/src/sass/app.scss  assets/src/sass/components/_partials1.scss  assets/src/js/app.js .gitignore

  # Check the exit status
  if [ $? -eq 0 ]; then
      echo "Command was successful - These files were created\nindex.html\nabout.html\ncontact.html\nwork.html\nwebpack.mix.js\nassets/src/sass/app.scss\nassets/src/js/app.js"
  else
    echo "Command failed - Project Directories files were not created"
      exit 1
  fi
}
initializeNpmProjectAndInstallNpmPackage(){ 
  #install depenedcies for SASS
  npm init -y
  npm install -D sass
  npm instal laravel-mix --save-dev
  npm install laravel-mix-purgecss --save-dev
  npm install uniformcss --save-dev
  npm install webpack-livereload-plugin --save-dev
  npm install flexboxgrid --save-dev


    # Check the exit status
  if [ $? -eq 0 ]; then
      echo "Command was successful - npm was initialize and these packages were installed Sass\nlaravel-mix\nlaravel-mix-purgecss\nuniformcss\nwebpack-livereload-plugin\nflexboxgrid"
  else
    echo "Command failed - npm was not initialize and no packages were not installed"
      exit 1
  fi
}


assetsConfigSetup(){ 
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
//Compile JS

mix.js('assets/src/js/app.js', 'dist').version();

//COPY DIRS
mix.copyDirectory('assets/src/fonts', 'assets/dist/fonts');
mix.copyDirectory('assets/src/imgs', 'assets/dist/imgs');


mix.webpackConfig({
        plugins: [new LiveReloadPlugin({port:8080  || 8081 ,delay:600})]
    });

EOF


    # Check the exit status
  if [ $? -eq 0 ]; then
      echo "Command was successful - webpack.mix.js was updated"
  else
    echo "Command failed - webpack.mix.js was not updated"
      exit 1
  fi
}

updateProjectStylesheets(){

  # insert logic into  public/css/main.scss
cat <<EOF > assets/src/sass/app.scss
/* 
*Config Setup Grid System and framework
*/
@use "../../node_modules/normalize.css/normalize.css";
@use "../../node_modules/flexboxgrid/css/flexboxgrid.min.css";

@use "uniform" as * with (
  \$config: (
    important: true,
    colors: (
      custom-color-1: red,
      custom-color-2: blue
    )
  )
);

  .l-container{
    max-width:1200px;
    margin:0 auto;
    padding-left:2rem;
    padding-right:2rem;
  }
@import "config/project_mixin";
@import "components/partials1";


EOF

# insert logic into  public/css/main.scss
cat <<EOF > public/src/css/components/_partials1.scss


EOF

cat <<EOF > public/src/css/config/_project_mixin.scss
    //template
    @mixin corner-icon(\$name, \$top-or-bottom, \$lefåt-or-right) {
    .icon-#{$name} {
        background-image: url("/icons/#{$name}.svg");
        position: absolute;
        #{$top-or-bottom}: 0;
        #{$left-or-right}: 0;
    }
    }

EOF



    # Check the exit status
  if [ $? -eq 0 ]; then
      echo "Command was successful - files  assets/src/sass/app.scss\npublic/src/css/components/_partials1.scss\npublic/src/css/config/_project_mixin.scss\n was updated with default config setup logic"
  else
    echo "Command failed - webpack.mix.js was not updated"
      exit 1
  fi
}

updateHtmlFiles(){
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
        <section data-component-name class="" id="">
                <div class="l-container">
                <div class="row">
                    <div class="col-xs-12 col-md-6"></div>
                    <div class="col-xs-12 col-md-6"></div>
                </div>
                </div>
            </section>
                  <section data-component-name class="" id="">
                <div class="l-container">
                <div class="row">
                    <div class="col-xs-12 col-md-6"></div>
                    <div class="col-xs-12 col-md-6"></div>
                </div>
                </div>
            </section>

  <script type="text/javascript" src="js/main.js"></script>
  <script src="http://localhost:8080/livereload.js"></script>

  <footer>
    
  </footer>
</body>

</html>
EOF

cat <<EOF > work.html
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
        <section data-component-name class="" id="">
                <div class="l-container">
                <div class="row">
                    <div class="col-xs-12 col-md-6"></div>
                    <div class="col-xs-12 col-md-6"></div>
                </div>
                </div>
            </section>
                  <section data-component-name class="" id="">
                <div class="l-container">
                <div class="row">
                    <div class="col-xs-12 col-md-6"></div>
                    <div class="col-xs-12 col-md-6"></div>
                </div>
                </div>
            </section>

  <script type="text/javascript" src="js/main.js"></script>
  <script src="http://localhost:8080/livereload.js"></script>

  <footer>
    
  </footer>
</body>

</html>
EOF

cat <<EOF > about.html
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
        <section data-component-name class="" id="">
                <div class="l-container">
                <div class="row">
                    <div class="col-xs-12 col-md-6"></div>
                    <div class="col-xs-12 col-md-6"></div>
                </div>
                </div>
            </section>
                  <section data-component-name class="" id="">
                <div class="l-container">
                <div class="row">
                    <div class="col-xs-12 col-md-6"></div>
                    <div class="col-xs-12 col-md-6"></div>
                </div>
                </div>
            </section>

  <script type="text/javascript" src="js/main.js"></script>
  <script src="http://localhost:8080/livereload.js"></script>

  <footer>
    
  </footer>
</body>

</html>
EOF


cat <<EOF > contact.html
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
        <section data-component-name class="" id="">
                <div class="l-container">
                <div class="row">
                    <div class="col-xs-12 col-md-6"></div>
                    <div class="col-xs-12 col-md-6"></div>
                </div>
                </div>
            </section>
                  <section data-component-name class="" id="">
                <div class="l-container">
                <div class="row">
                    <div class="col-xs-12 col-md-6"></div>
                    <div class="col-xs-12 col-md-6"></div>
                </div>
                </div>
            </section>

  <script type="text/javascript" src="js/main.js"></script>
  <script src="http://localhost:8080/livereload.js"></script>

  <footer>
    
  </footer>
</body>

</html>
EOF

    # Check the exit status
  if [ $? -eq 0 ]; then
      echo "Command was successful - All html files was populate with html5 boilerplate content "
  else
    echo "Command failed"
      exit 1
  fi
}

createProjectReadMe(){
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

    # Check the exit status
  if [ $? -eq 0 ]; then
      echo "Command was successful - Readme.md created successfully!"
  else
    echo "Command failed - webpack.mix.js was not updated"
      exit 1
  fi
}

updateGitIgnore(){

cat <<EOF > .gitignore
/node_modules
EOF

  if [ $? -eq 0 ]; then
      echo "Command was successful - .gitignore was updated"
  else
    echo "Command failed - webpack.mix.js was not updated"
      exit 1
  fi
}

createNvmrc(){

  #get the latest node version
  node -v > .nvmrc


  if [ $? -eq 0 ]; then
      echo "Command was successful - .nvmrc was created and was updated with latest node version"
  else
    echo "Command failed - .nvrmc was not created"
      exit 1
  fi
}

runNpmScripts(){

  npm run development
  npm run production


    if [ $? -eq 0 ]; then
      echo "Command was successful - both npm run scripts were successful"
  else
    echo "Command failed - both npm run scripts were not successful"
      exit 1
  fi
}
createGitRepo(){
  
  # git repo setup  
  git init 

  git add .
  git commit -m "$PROJECT_NAME structure setup and initial commit"
  git branch layout 
  git branch style
  git branch layout_factor 
  git branch style_refactor


}

OutputsuccessMessage(){

    echo "$PROJECT_NAME  Directory was created successfully!"
  	
}


createProjectDirectory
createProjectDirectories
createProjectFiles
initializeNpmProjectAndInstallNpmPackage
assetsConfigSetup
updateIndexHtml
createProjectReadMe
updateGitIgnore
createNvmrc
runNpmScripts
createGitRepo
OutputsuccessMessage