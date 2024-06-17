#!/bin/bash


createProjectDirectory(){
    echo "Enter project name:"
    read PROJECT_NAME
    mkdir $PROJECT_NAME && cd $PROJECT_NAME

    mkdir var 
    cd var
    mkdir www 
    cd www
    mkdir html 
    cd  html

      # Check the exit status
    if [ $? -eq 0 ]; then
        echo "Command was successful"
    else
        echo "Command failed"
        exit;
    fi
}  

projectReadMeUpdate(){
echo "# $PROJECT_NAME

One Paragraph of project description goes her
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

- Bash Script
- HTML
- PHP
- JS
- CSS
- SCSS
- Node
    Packages
    
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

# Scripts Mostly Use
- php -S localhost:2222
- npm run production
- npm run development

" > $PROJECT_NAME.md

    # Check the exit status
    if [ $? -eq 0 ]; then
        echo "Command was successful"
    else
        echo "Command failed"
        exit;
    fi
}

initializeNpmProjectAndInstallNpmPackage(){
  
  # create new node project
  npm init -y
  npm install sass -g
  npm install uniformcss laravel-mix@latest 
  npm install --save normalize.css
  npm install flexboxgrid --save-dev
  npm install sass-loader@^12.1.0 sass resolve-url-loader@^5.0.0 --save-dev --legacy-peer-deps


         # Check the exit status
    if [ $? -eq 0 ]; then
        echo "Commands was successful"
    else
        echo "Command failed"
        exit;
    fi
}



createProjectDirectories(){
    # create new node project
    mkdir public/src/ public/src/css public/src/css/pages public/src/css/components  public/src/imgs public/src/js public/src/assets
          # Check the exit status
    if [ $? -eq 0 ]; then
        echo "Command was successful"
    else
        echo "Command failed"
        exit;
    fi
}


createProjectFiles(){
      #
 # create new node project
  touch  work.php about.php contact.php index.php 
  touch  public/src/css/projectstyle.scss public/src/js/app.js public/src/css/components/_partials1.scss public/src/css/pages/_index.scss webpack.mix.js 
  touch .gitignore
  touch .nvmrc

      # Check the exit status
    if [ $? -eq 0 ]; then
        echo "Command was successful"
    else
        echo "Command failed"
        exit;
    fi
}



updateNpmScript(){
  
  # Update package.json with Laravel Mix scripts
  cat package.json | jq '. + {"scripts": {"development": "mix", "watch": "mix watch", "watch-poll": "mix watch -- --watch-options-poll=1000", "hot": "mix watch --hot", "production": "mix --production"}}' > temp.json && mv temp.json package.json

}


updateAssetsConfig(){
  
  # insert logic into webpack.mix.js
  cat <<EOF > webpack.mix.js
      let mix = require('laravel-mix');
      mix.sass('public/src/css/projectstyle.scss', 'public/dist/css', {
        sassOptions: {
          includePaths: [
            './node_modules/uniformcss'
          ]
        }})
      .js('public/src/js/app.js', 'public/dist/js')
      .copyDirectory('public/src/imgs', 'public/dist/imgs')
      .copyDirectory('public/src/assets', 'public/dist/assets');
EOF

      # Check the exit status
    if [ $? -eq 0 ]; then
        echo "Command was successful"
    else
        echo "Command failed"
        exit;
    fi
}


updateProjectStylesheets(){

  # insert logic into  public/css/main.scss
cat <<EOF > public/src/css/projectstyle.scss
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
@import "components/partials1";
@import "pages/index";


EOF

# insert logic into  public/css/main.scss
cat <<EOF > public/src/css/components/_partials1.scss


EOF

cat <<EOF > public/src/css/pages/_index.scss


EOF

# insert logic into  public/css/main.scss
cat <<EOF > public/src/css/components/_typography.scss
    @font-face {
        font-family: 'Font-Name';
        src: url('..');
        src: url('../ttf') format('truetype'),
        url('../.woff') format('woff'),
        url('../.woff2') format('woff2');

        font-display: swap;

    }

    *{
     //font-family:;   
    }

    p{
     //font-family:;   
    }

    h1,h2,h4,h4,h5,h6{
     //font-family:;   
    }

    h1,.h1{
     //font-family:;   
    }
    h2,.h2{
     //font-family:;   
    }
    h3,.h3{
     //font-family:;   
    }
    h4,.h4{
     //font-family:;   
    }
    h5,.h5{
     //font-size:;   
    }
     h6,.h6{
     //font-family:;   
    }

EOF

# insert logic into  public/css/main.scss
cat <<EOF > public/src/css/components/_project_mixin.scss
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
        echo "Command was successful"
    else
        echo "Command failed"
        exit;
    fi
}

updatesPhpFilesWithHtmlBoilerplateTemplates(){
  


# insert logic into index.php
cat <<EOF > index.php

<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$PROJECT_NAME - Home</title>
  <link rel="stylesheet" href="public/dist/css/projectstyle.css">
  <meta name="description" content="">

  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">
  <meta property="og:image:alt" content="">

  <link rel="icon" href="/favicon.ico" sizes="any">
  <link rel="icon" href="/icon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="icon.png">

  <link rel="manifest" href="site.webmanifest">
  <meta name="theme-color" content="#fafafa">
</head>

<body>
  <nav class="l-container"> 
    <div class="row">
          <div class="col-xs-12">LOGO</div>
          <div class="col-xs-12">
              <ul class="flex flex-col md.flex-row">
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
              </ul>
          </div>
          <div class="col-xs-12">ICONS</div>
    </div>
  </nav>
  <main>
    <section data-component-name class="">
      <div class="l-container">
          <div class="row">
          </div>
    </div>
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
  </main>
  <!-- Add your site or application content here -->
  <p>Welcome to $PROJECT_NAME world! This is HTML5 Boilerplate.</p>
  <script src="public/dist/js/app.js"></script>
  <footer class>
            <div class="l-container">
        <div class="row">
        <div>LOGO</div>
            <div>
                    <ul>

        <?php
                // Loop through colors and create an option for each color
                foreach (\$footerLinks as \$link) {
                    echo "<li class=""> <?=\$link</li>";
                }
            ?>
            </ul>
            </div>
            <div>
                        <ul>

        <?php
                // Loop through colors and create an option for each color
                foreach (\$socialLinks as \$slink) {
                    echo "<li class=""> <?=\$slink</li>";
                }
            ?>
            </ul>
            </div>
                </div>
            </div>
        </footer>
 <script src="public/dist/js/app.js"></script>
</body>

</html>
EOF

cat <<EOF > work.php

<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$PROJECT_NAME - Work</title>
  <link rel="stylesheet" href="public/dist/css/projectstyle.css">
  <meta name="description" content="">

  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">
  <meta property="og:image:alt" content="">

  <link rel="icon" href="/favicon.ico" sizes="any">
  <link rel="icon" href="/icon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="icon.png">

  <link rel="manifest" href="site.webmanifest">
  <meta name="theme-color" content="#fafafa">
</head>

<body>
  <nav class="l-container"> 
    <div class="row">
          <div class="col-xs-12">LOGO</div>
          <div class="col-xs-12">
              <ul class="flex flex-col md.flex-row">
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
              </ul>
          </div>
          <div class="col-xs-12">ICONS</div>
    </div>
  </nav>
  <main>
           <?php
            // Array of colors
            \$colors = ["digital-green", "yellow-light", "blue-light", "turquoise-light", "green-light", "orange-light", "lilac-light"];
        ?>
    <section data-component-name class="">
      <div class="l-container">
          <div class="row">
                              <ul>

        <?php
                // Loop through colors and create an option for each color
                foreach (\$colors as \$color) {
                    echo "<li> <?=\$color</li>";
                }
            ?>
            </ul>
          </div>
    </div>
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
  </main>
  <!-- Add your site or application content here -->
  <p>Welcome to $PROJECT_NAME world! This is HTML5 Boilerplate.</p>
  <script src="public/dist/js/app.js"></script>
  <footer class>
            <div class="l-container">
        <div class="row">
        <div>LOGO</div>
            <div>
                    <ul>

        <?php
                // Loop through colors and create an option for each color
                foreach (\$footerLinks as \$link) {
                    echo "<li class=""> <?=\$link</li>";
                }
            ?>
            </ul>
            </div>
            <div>
                        <ul>

        <?php
                // Loop through colors and create an option for each color
                foreach (\$socialLinks as \$slink) {
                    echo "<li class=""> <?=\$slink</li>";
                }
            ?>
            </ul>
            </div>
                </div>
            </div>
        </footer>
 <script src="public/dist/js/app.js"></script>
</body>

</html>
EOF

cat <<EOF > about.php

<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$PROJECT_NAME - About</title>
  <link rel="stylesheet" href="public/dist/css/projectstyle.css">
  <meta name="description" content="">

  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">
  <meta property="og:image:alt" content="">

  <link rel="icon" href="/favicon.ico" sizes="any">
  <link rel="icon" href="/icon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="icon.png">

  <link rel="manifest" href="site.webmanifest">
  <meta name="theme-color" content="#fafafa">
</head>

<body>
  <nav class="l-container"> 
    <div class="row">
          <div class="col-xs-12">LOGO</div>
          <div class="col-xs-12">
              <ul class="flex flex-col md.flex-row">
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
              </ul>
          </div>
          <div class="col-xs-12">ICONS</div>
    </div>
  </nav>
  <main>
    <section data-component-name class="">
      <div class="l-container">
          <div class="row">
          </div>
    </div>
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
  </main>
  <!-- Add your site or application content here -->
  <p>Welcome to $PROJECT_NAME world! This is HTML5 Boilerplate.</p>
  <footer class>
            <div class="l-container">
        <div class="row">
        <div>LOGO</div>
            <div>
                    <ul>

        <?php
                // Loop through colors and create an option for each color
                foreach (\$footerLinks as \$link) {
                    echo "<li class=""> <?=\$link</li>";
                }
            ?>
            </ul>
            </div>
            <div>
                        <ul>

        <?php
                // Loop through colors and create an option for each color
                foreach (\$socialLinks as \$slink) {
                    echo "<li class=""> <?=\$slink</li>";
                }
            ?>
            </ul>
            </div>
                </div>
            </div>
        </footer>

 <script src="public/dist/js/app.js"></script>
 </body>
 

</html>
EOF

cat <<EOF > contact.php

<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$PROJECT_NAME - Contact</title>
  <link rel="stylesheet" href="public/dist/css/projectstyle.css">
  <meta name="description" content="">

  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">
  <meta property="og:image:alt" content="">

  <link rel="icon" href="/favicon.ico" sizes="any">
  <link rel="icon" href="/icon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="icon.png">

  <link rel="manifest" href="site.webmanifest">
  <meta name="theme-color" content="#fafafa">
</head>

<body>
  <nav class="l-container"> 
    <div class="row">
          <div class="col-xs-12">LOGO</div>
          <div class="col-xs-12">
              <ul class="flex flex-col md.flex-row">
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
                  <li>    </li>
              </ul>
          </div>
          <div class="col-xs-12">ICONS</div>
    </div>
  </nav>
  <main>
    <section data-component-name class="">
      <div class="l-container">
          <div class="row">
          </div>
    </div>
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
    <section data-component-name class="">
    </section>
  </main>
  <!-- Add your site or application content here -->
  <p>Welcome to $PROJECT_NAME world! This is HTML5 Boilerplate.</p>
 
  <footer class>
            <div class="l-container">
        <div class="row">
        <div>LOGO</div>
            <div>
                    <ul>

        <?php
                // Loop through colors and create an option for each color
                foreach (\$footerLinks as \$link) {
                    echo "<li class=""> <?=\$link</li>";
                }
            ?>
            </ul>
            </div>
            <div>
                        <ul>

        <?php
                // Loop through colors and create an option for each color
                foreach (\$socialLinks as \$slink) {
                    echo "<li class=""> <?=\$slink</li>";
                }
            ?>
            </ul>
            </div>
                </div>
            </div>
        </footer>
 <script src="public/dist/js/app.js"></script>
</body>

</html>
EOF


         # Check the exit status
    if [ $? -eq 0 ]; then
        echo "Commands was successful"
    else
        echo "Command failed"
        exit;
    fi
}


updateGitIgnore(){
  

cat <<EOF > .gitignore
/node_modules
EOF

         # Check the exit status
    if [ $? -eq 0 ]; then
        echo "Commands was successful"
    else
        echo "Command failed"
        exit;
    fi
}

createNvmrc(){

  #get the latest node version
  node -v > .nvmrc
  
  # Check the exit status
    if [ $? -eq 0 ]; then
        echo "Commands was successful"
    else
        echo "Command failed"
        exit;
    fi
}

# compile the default stylesheet for the project
runNpmScripts(){
  
  npm run development
  npm run production

  # Check the exit status
    if [ $? -eq 0 ]; then
        echo "Commands was successful"
    else
        echo "Command failed"
        exit;
    fi

}
# git repo setup , the 1st project commit and creation of branches  
createGitRepo(){

  git init 

  git add .
  git commit -m "$PROJECT_NAME structure setup and initial commit"
  git branch layout 
  git branch style
  git branch layout_factor 
  git branch style_refactor


  # Check the exit status
    if [ $? -eq 0 ]; then
        echo "Commands was successful"
    else
        echo "Command failed"
        exit;
    fi
}



SuccessMessage(){

  echo "Linux template static website  setup with 
  Uniform.css, Flexbox Grid, SassLoader, Sass, and Laravel Mix node moduleas created successfully in $PROJECT_NAME directory ."

}


createProjectDirectory
initializeNpmProjectAndInstallNpmPackage
createProjectDirectories
createProjectFiles
updateNpmScript
updateAssetsConfig
updateProjectStylesheets
updatesPhpFilesWithHtmlBoilerplateTemplates
updateGitIgnore
createNvmrc
runNpmScripts
createGitRepo
projectReadMeUpdate
SuccessMessage