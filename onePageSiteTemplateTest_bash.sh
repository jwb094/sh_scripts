# Prompt user for project name
echo "Enter project name:"
read PROJECT_NAME
mkdir $PROJECT_NAME
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

" > $PROJECT_NAME.md

# create new node project & install required packages
npm init -y
npm install sass -g
npm install uniformcss laravel-mix@latest 
npm install --save normalize.css
npm install flexboxgrid --save-dev
npm install sass-loader@^12.1.0 sass resolve-url-loader@^5.0.0 --save-dev --legacy-peer-deps
# create directories
mkdir public public/src/ public/src/css public/src/css/components  public/src/imgs public/src/js public/src/assets
# create necessary html , js ,css files for the projects
touch  index.html public/src/css/projectstyle.scss public/src/js/app.js public/src/css/components/_partials1.scss webpack.mix.js .gitignore



# Update package.json with Laravel Mix scripts
cat package.json | jq '. + {"scripts": {"development": "mix", "watch": "mix watch", "watch-poll": "mix watch -- --watch-options-poll=1000", "hot": "mix watch --hot", "production": "mix --production"}}' > temp.json && mv temp.json package.json


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

# insert default sass logic into  public/src/css/projectstyle.scss
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


EOF

# insert logic into  public/src/css/components/_partials1.scss
cat <<EOF > public/src/css/components/_partials1.scss


EOF

# insert logic into index.html
cat <<EOF > index.html
<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$PROJECT_NAME</title>
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
    <section data-component-name="" class="">
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
          <li>    </li>
          <li>    </li>
          <li>    </li>
          <li>    </li>
          <li>    </li>
    </ul>
    </div>
      <div>ICONS</div>
          </div>
    </div>
</footer>
</body>

</html>
EOF

#Insert content into .gitignore - this will prevent files/ directories from being logged byt git
cat <<EOF > .gitignore
/node_modules
EOF

# compile the default stylesheet for the project
npm run development
npm run production

# git repo setup , the 1st project commit and creation of branches  
git init 

git add .
git commit -m "$PROJECT_NAME structure setup and initial commit"
git branch layout 
git branch style
git branch layout_factor 
git branch style_refactor

echo "One-page template static website  setup with 
Uniform.css, Flexbox Grid, SassLoader, Sass, and Laravel Mix node moduleas created successfully in $PROJECT_NAME directory .
"