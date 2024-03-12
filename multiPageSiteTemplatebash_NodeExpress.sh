#!/bin/bash

createProjectDirectory(){

  # Prompt user for project name
  echo "Enter project name:"
  read PROJECT_NAME
  mkdir $PROJECT_NAME && cd $PROJECT_NAME

}

initializeNpmProjectAndInstallNpmPackage(){
  
  # create new node project
  npm init -y
  npm install sass -g
  npm install express -g
  npm install ejs express express-ejs-layouts 
  npm install uniformcss laravel-mix@latest 
  npm install --save normalize.css
  npm install flexboxgrid --save-dev
  npm install sass-loader@^12.1.0 sass resolve-url-loader@^5.0.0 --save-dev --legacy-peer-deps

}



createProjectDirectories(){
  
  # create new node project
  mkdir public public/src/ public/src/css public/src/css/pages public/src/css/components  public/src/imgs public/src/js public/src/assets views views/layouts views/partials

}

createProjectFiles(){
  
  # create new node project
  touch index.js webpack.mix.js .gitignore  README.md
  touch views/index.ejs views/about.ejs views/layouts/full-width.ejs views/layouts/sidebar.ejs views/partials/header.ejs views/partials/footer.ejs
  touch public/src/css/projectstyle.scss public/src/js/app.js public/src/js/nav.js public/src/css/components/_partials1.scss public/src/css/components/_project_mixin.scss public/src/css/pages/_index.scss public/src/css/pages/_about.scss

}

updateNpmScript() {
  cat package.json | jq '. + {"scripts": {"start": "node index.js","development": "mix", "watch": "mix watch", "watch-poll": "mix watch -- --watch-options-poll=1000", "hot": "mix watch --hot", "production": "mix --production"}}' > temp.json && mv temp.json package.json
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
.js('[public/src/js/app.js,public/src/js/nav.js]', 'public/dist/js')
.copyDirectory('public/src/imgs', 'public/dist/imgs')
.copyDirectory('public/src/assets', 'public/dist/assets');
    



EOF

}

updateProjectStylesheets(){

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

@import "components/project_mixin";
@import "pages/index";
@import "pages/about";
@import "components/partials1";


EOF

# insert logic into  public/css/main.scss
cat <<EOF > public/src/css/components/_partials1.scss


EOF




# insert logic into  public/css/main.scss
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

# insert logic into  public/css/main.scss
cat <<EOF > public/src/css/components/_partials1.scss


EOF

# insert logic into  public/css/main.scss
cat <<EOF > public/src/css/pages/_index.scss


EOF

cat <<EOF > public/src/css/pages/_about.scss


EOF
}


updatesIndexJs(){
cat <<EOF > index.js
// Imports
const express = require('express')
const expressLayouts = require('express-ejs-layouts')

const app = express()
const port = 5000

// Static Files
app.use(express.static('public'))
// Example for other folders - not required
// app.use('/css', express.static(__dirname + 'public/css'))

// Set Templating Engine
app.use(expressLayouts)
app.set('layout', './layouts/full-width')
app.set('view engine', 'ejs')

// Routes
app.get('', (req, res) => {
    res.render('index', { title: 'Home Page'})
})

app.get('/about', (req, res) => {
    res.render('about', { title: 'About Page', layout: './layouts/sidebar' })
})

// Listen on Port 5000
app.listen(port, () => console.info('App listening on port \${port}'))

EOF
}


updateViewsPagesLayoutsPartialsFiles(){
cat <<EOF > views/index.ejs 
<p>This is the home page and it takes the full width of the layout</p>
<a href="/about">About</a>
<section data-component-name class="" id="">
    <div class="l-container">
      <div class="row">
        <div class="col-xs-12 col-md-6"></div>
        <div class="col-xs-12 col-md-6"></div>
      </div>
    </div>
</section>
<section data-component-name class="" id="">
</section>
EOF

cat <<EOF > views/about.ejs 
<p>This is the about page. Look it has two columns.</p>
<p>This is a second paragraph and we can use normal html</p>
<a href="/">Home</a>
<section data-component-name class="" id="">
    <div class="l-container">
      <div class="row">
        <div class="col-xs-12 col-md-6"></div>
        <div class="col-xs-12 col-md-6"></div>
      </div>
    </div>
</section>
<section data-component-name class="" id="">
</section>
EOF

cat <<EOF > views/layouts/full-width.ejs 
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">
  <meta property="og:image:alt" content="">

  <link rel="icon" href="/favicon.ico" sizes="any">
  <link rel="icon" href="/icon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="icon.png">
      <title><%- title %></title>
          <link rel="stylesheet" href="dist/css/projectstyle.css">
  </head>
  <body>

      <div class="wrapper">
          <%- include('../partials/header.ejs') %>
          <main><%- body %></main>
          <%- include('../partials/footer.ejs') %>
      </div>
  </body>
  </html>
EOF


cat <<EOF > views/layouts/sidebar.ejs 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta property="og:title" content="">
  <meta property="og:type" content="">
  <meta property="og:url" content="">
  <meta property="og:image" content="">
  <meta property="og:image:alt" content="">

  <link rel="icon" href="/favicon.ico" sizes="any">
  <link rel="icon" href="/icon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" href="icon.png">
    <title><%- title %></title>
      <link rel="stylesheet" href="/dist/css/projectstyle.css">
</head>
<body>

<%- include('../partials/header.ejs') %>
    <div class="wrapper">
        <div class="layout-sidebar">
            <main><%- body %></main>
            <side>Sidebar</side>
        </div>
        <%- include('../partials/footer.ejs') %>
    </div>

</body>
</html>
EOF

cat <<EOF > views/partials/header.ejs 
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
EOF

cat <<EOF > views/partials/footer.ejs
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
EOF
}


updateGitIgnore(){
  
cat <<EOF > .gitignore
/node_modules
EOF

}

createNvmrc(){
  
    #get the latest node version and insert into .nvrmc file
    node -v > .nvmrc

}



runNpmScripts(){
  
  npm run development
  npm run production

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

echo "  NodeJS Express Dynamic Pages Application Created "

}



createProjectDirectory
initializeNpmProjectAndInstallNpmPackage
createProjectDirectories
createProjectFiles
updateNpmScript
assetsConfigSetup
updateProjectStylesheets
updatesIndexJs
updateViewsLayoutsPartialsFiles
updateGitIgnore
createNvmrc
runNpmScripts
createGitRepo
OutputsuccessMessage