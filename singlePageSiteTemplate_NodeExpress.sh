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
  npm install uniformcss laravel-mix@latest 
  npm install --save normalize.css
  npm install flexboxgrid --save-dev
  npm install sass-loader@^12.1.0 sass resolve-url-loader@^5.0.0 --save-dev --legacy-peer-deps

}

updateNpmScript(){
      cat package.json | jq '. + {"scripts": {"start": "node index.js","development": "mix", "watch": "mix watch", "watch-poll": "mix watch -- --watch-options-poll=1000", "hot": "mix watch --hot", "production": "mix --production"}}' > temp.json && mv temp.json package.json


}

createProjectDirectories(){

  # create new node project
  mkdir public public/dist public/src/ public/src/css public/src/css/ public/src/css/config public/src/css/components  public/src/imgs public/src/js public/src/assets

}

createProjectFiles(){

  # create new node project
  touch index.js webpack.mix.js .gitignore  public/index.html    public/src/css/projectstyle.scss public/src/css/components/_partials1.scss  public/src/css/config/_project_mixin.scss public/src/js/app.js public/src/js/nav.js

}

updateAssetsConfig(){
  
  # insert logic into webpack.mix.js
  cat <<EOF >> webpack.mix.js
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

updatesIndexJs(){
    cat <<EOF >> index.js
            const express = require('express');
        const path = require('path');
        const app = express();

        app.use(express.static(path.join(__dirname,'public')));

        app.use((req,res)=>{
            res.status(404);
            res.send("<h1>Error 404 : Page Not Found</h1>");
        });

        app.listen(3000,()=>{
            console.log('App listening on port 3000');
        });

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
@import "config/project_mixin";
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


}


updateIndexHtml(){
cat <<EOF > public/index.html
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

}


updateGitIgnore(){
  

cat <<EOF > .gitignore
/node_modules
EOF
}

createNvmrc(){
  
    #get the latest node version
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


echo " single PAge Application Created with Node & Express JS Completed"
}

createProjectDirectory
initializeNpmProjectAndInstallNpmPackage
updateNpmScript
createProjectDirectories
createProjecFiles
updateAssetsConfig
updatesIndexJs
updateProjectStylesheets
updateIndexHtml
updateGitIgnore
createNvmrc
runNpmScripts
createGitRepo
OutputsuccessMessage