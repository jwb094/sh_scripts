#Define project name
echo "Enter project name: e.g. CompanyName Site , ToDo App"
read PROJECT_NAME

# Create project directory
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

" > README.md

# Create project Structure directory
mkdir src   assets 

mkdir src/_includes  

mkdir src/_includes/components src/_includes/layouts  src/_includes/system  

mkdir src/_includes/components/button 

mkdir assets/src   assets/dist  assets/src/sass assets/src/js  assets/src/fonts assets/src/imgs  
# Create project files
touch src/_includes/system/component.njk    

touch   .eleventy.js src/about.njk    src/index.njk   src/modules.njk   src/_includes/footer.njk src/_includes/header.njk     src/_includes/layouts/base.njk src/_includes/layouts/component_hubpage.njk  src/_includes/components/button/button.njk      src/_includes/components/button/marco.njk  


touch assets/src/sass/app.scss assets/src/js/app.js


#install depenedcies for project
npm init -y
npm install @11ty/eleventy --save-dev
npm install @11ty/eleventy-plugin-bundle --save-dev
npm install laravel-mix --save-dev
npm install sass-loader@^12.1.0 sass resolve-url-loader@^5.0.0 --save-dev --legacy-peer-deps
npm install laravel-mix-purgecss --save-dev
npm install webpack-livereload-plugin --save-dev
npm install uniformcss --save-dev



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
     content: ['_site/*.html,_site/*/*.html,_site/index.html'],
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

cat <<EOF > .eleventy.js
const bundlerPlugin = require("@11ty/eleventy-plugin-bundle");
const { EleventyRenderPlugin } = require("@11ty/eleventy");


module.exports = function(eleventyConfig) {
  // Copy the contents of the public folder to the output folder
  eleventyConfig.addPassthroughCopy("assets/dist");
  eleventyConfig.addPlugin(bundlerPlugin);
    return {
      dir: {
        input: 'src',
        includes: '_includes',
        output: '_site',
      },
      templateFormats: ['md', 'njk', 'html'],
      markdownTemplateEngine: 'njk',
      htmlTemplateEngine: 'njk',
      dataTemplateEngine: 'njk',
    };
    
  }
EOF


cat <<EOF > src/index.njk
---
layout: layouts/base.njk
title: "$PROJECT_NAME - Home"
---

    <h1>Hi I am {{ title }} Page</h1>

    <p>Hi from home Page</p>
EOF


cat <<EOF > src/modules.njk
---
title: "Global Component Macro"
---

{% extends "layouts/component_hubpage.njk" %}

{% block content %}

  {{ component('button', {
    primary: 'Hello'
  }) }}
{%- endblock -%}
EOF




cat <<EOF > src/_includes/system/component.njk
{% macro component(name, params) %}
  {% include "../components/" + name + "/" + name + ".njk" ignore missing %}
{% endmacro %}
EOF

cat <<EOF > src/_includes/components/button/button.njk
<button type="button">{{ params.primary }} {{ params.secondary }}</button>
EOF

cat <<EOF > src/_includes/components/button/marco.njk
{% macro button(params) %}
  {% include "./button.njk" %}
{% endmacro %}
EOF


cat <<EOF > src/_includes/layouts/component_hubpage.njk
{% from "system/component.njk" import component %}
<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <title>Components</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">

  <link rel="icon" href="/favicon.ico" sizes="any">
  <link rel="icon" href="/icon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="icon.png">
 <link rel="stylesheet" href="assets/dist/app.css"> 
  <link rel="stylesheet" href="/bundle.css">

  <meta name="theme-color" content="#fafafa">
  
</head>

<body>
<h1>Modules</h1>




<div class="l-container">

  <h1 class="sg-title f-size--32">UI</h1>

</div>

  {% block content %}{% endblock %}




</body>

</html>
EOF

cat <<EOF > assets/src/sass/app.scss
/*
 |--------------------------------------------------------------------------
 | TABLE OF CONTENT
 |--------------------------------------------------------------------------
 |
 | TOC
 | ----------------
 |  1. Tools and Base
 |  2. Config
 |  3. Styles
 |  4. Utilities  
 */
#//replace myProject with $PROJECT_NAME 
#//create a variable called config for uniform array 
 @use "uniform" as * with (
$config: (
    important: true,
    prefix: myProject,
    colors: (
      custom-color-1: red,
      custom-color-2: blue
    ),
  )
);
EOF

cat <<EOF > src/_includes/layouts/base.njk
<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <title> $PROJECT_NAME </title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">

  <link rel="icon" href="/favicon.ico" sizes="any">
  <link rel="icon" href="/icon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="icon.png">


 {#- Add the contents of a file to the bundle #}
 	{% css %}{% include "../assets/dist/app.css" %}{% endcss %}
  <link rel="manifest" href="site.webmanifest">
  <meta name="theme-color" content="#fafafa">
</head>

<body>

    {% include "header.njk" %}

    {{  content | safe }}

    {% include "footer.njk" %}
  <p>Hello world! This is HTML5 Boilerplate.</p>
  <script src="js/vendor/modernizr-{{MODERNIZR_VERSION}}.min.js"></script>
  <script src="assets/js/app.js"></script>
<script src="http://localhost:8080/livereload.js"></script>
</body>

</html>
EOF




  echo "$PROJECT_NAME   was created successfully!"
	echo "Update app.scss in assets/src/sass DIR "
	echo "after app.scss update please npx mix"
  echo "Please npx @11ty/eleventy - to check the correct folders have been copied over into _Site DIR "
    echo "Please npx @11ty/eleventy --serve to view the site locally"
