# js minfier shell
 # Purpose
  Often, when I am developing JavaScript projects, I find myself using https://www.toptal.com/developers/javascript-minifier to minify my code. Because minified js code is basically impossible to edit, however, I keep a "source code" copy nearby. This usually ends up in the below structure.

  ```
    ./Code/
    ├── exe
    │   ├── URI-manager.js
    │   ├── format.js
    │   ├── main.js
    │   ├── provider.js
    │   ├── settings.js
    │   └── treeblocks.js
    ├── lib
    │   ├── lzma-min.js
    │   └── pako-min.js
    └── src
        ├── URI-manager.js
        ├── format.js
        ├── main.js
        ├── provider.js
        ├── settings.js
        └── treeblocks.js
  ```
  This shellscript takes in a pathname as a parameter and searches for occurrences of `/[cC]ode/src/.*\.js` and minifies them to `/[cC]ode/exe/.*\.js`, courtesy of the [Toptal JS-Minifier API](https://www.toptal.com/developers/javascript-minifier/documentation/curl)

 # Usage
  Simply provide a path as the parameter during execution
  ```
  minify.sh <pathname>
  ```
  ```
  minify.sh ./../MyRepo
  ```
