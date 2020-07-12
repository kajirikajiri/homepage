#!/bin/sh
rm -rf filenames.js

echo "export const filenames = [" >> temp.js
for file in ./src/assets/md/*; do
  Modify=$(stat ${file}|grep Modify:)
  Change=$(stat ${file}|grep Change:)
  echo "  {name: '${file##*/}', modify: '${Modify}', change: '${Change}'}," >> temp.js
done
echo "]" >> temp.js
sed -e 's/Modify: //g' -e 's/Change: //g' temp.js > filenames.js
rm -rf temp.js