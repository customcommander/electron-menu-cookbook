#!/bin/bash

cat <<EOS >README.md
# Electron Menu Cookbook

A repository of examples using [Electron's Menu API](https://www.electronjs.org/docs/latest/api/menu) to do various things with native application menus. All examples work with Electron v15, \`nodeIntegration\` off and \`contextIsolation\` on.

To keep things small and focused we don't show how to load a renderer and setup a preload script from the main process.
We simply assume that you know how to do that. Have look at the `cook.js` file if you're curious.

To run any of these examples just clone and \`npm install\` this repository and run the corresponding recipe script.

EOS

rm -rfv tmp

# cat recipes/$recipe/index.html | sed -n '/<pre>/,/<\/pre>/p' | sed '1d' | sed '$d' >>README.md
for recipe in $(ls recipes); do
  mkdir -p tmp/recipes/$recipe

  # generate question section
  cat recipes/$recipe/index.html | sed -n '/<pre>/,/<\/pre>/p' | sed '1d' | sed '$d' >tmp/recipes/$recipe/how.md

  # generate main section
  cat <<EOS >tmp/recipes/$recipe/main.md
\`\`\`javascript
/*** main.js ***/

$(cat recipes/$recipe/main.js)
\`\`\`
EOS

  # generate page section
  awk 'BEGIN{ask=0} /<body>/{next} /<\/body>/{next} /<pre>/{ask=1;next} /<\/pre>/{ask=0;next} ask==0{print}' recipes/$recipe/index.html >tmp/recipes/$recipe/page.tmp
  touch tmp/recipes/$recipe/page.md
  if [ -s tmp/recipes/$recipe/page.tmp ]; then
    cat <<EOS >tmp/recipes/$recipe/page.md
\`\`\`html
<!-- index.html -->
$(cat tmp/recipes/$recipe/page.tmp)
\`\`\`
EOS
  fi

  # generate preload section
  touch tmp/recipes/$recipe/preload.md
  if [ -s recipes/$recipe/preload.js ]; then
cat <<EOS >tmp/recipes/$recipe/preload.md
\`\`\`javascript
/*** preload.js ***/

$(cat recipes/$recipe/preload.js)
\`\`\`
EOS
  fi

  # generate preview section
  touch tmp/recipes/$recipe/preview.md
  if [ -s recipes/$recipe/screencast.gif ]; then
cat <<EOS >tmp/recipes/$recipe/preview.md
![](recipes/$recipe/screencast.gif)
EOS
  fi

  cat <<EOS >>README.md

$(cat tmp/recipes/$recipe/how.md)

\`\`\`shell
\$ npm run reciple -- $recipe
\`\`\`

$(cat tmp/recipes/$recipe/main.md)

$(cat tmp/recipes/$recipe/preload.md)

$(cat tmp/recipes/$recipe/page.md)

$(cat tmp/recipes/$recipe/preview.md)

EOS
done
