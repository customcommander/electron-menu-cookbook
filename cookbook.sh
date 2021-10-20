#!/bin/bash

cat <<EOS >README.md
# Electron Menu Cookbook

A repository of examples using [Electron's Menu API](https://www.electronjs.org/docs/latest/api/menu) to do various things with native application menus. All examples work with Electron v15, \`nodeIntegration\` off and \`contextIsolation\` on.

To run any of these examples just clone and \`npm install\` this repository and run the corresponding recipe script.

EOS

# cat recipes/$recipe/index.html | sed -n '/<pre>/,/<\/pre>/p' | sed '1d' | sed '$d' >>README.md
for recipe in $(ls recipes); do
  cat <<EOS >>README.md

$(cat recipes/$recipe/index.html | sed -n '/<pre>/,/<\/pre>/p' | sed '1d' | sed '$d')

\`\`\`shell
\$ npm run reciple -- $recipe
\`\`\`

\`\`\`javascript
/*** main.js ***/

$(cat recipes/$recipe/main.js)
\`\`\`

EOS
done

