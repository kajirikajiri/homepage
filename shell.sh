#!/bin/sh

xstat() {
  for target in "${@}"; do
    inode=$(ls -di "${target}" | cut -d ' ' -f 1)
    fs=$(df "${target}"  | tail -1 | awk '{print $1}')
    crtime=$(sudo debugfs -R 'stat <'"${inode}"'>' "${fs}" 2>/dev/null | 
    grep -oP 'crtime.*--\s*\K.*')
    printf "%s\t%s\n" "${crtime}"
  done
}

rm -rf markdowns.js

echo "export const markdowns = [" >> temp.js
files=$(ls -A1t ./src/assets/md)
for file in $files; do
  Modify=$(stat ./src/assets/md/${file}|grep Modify:)
  Birth=$(xstat ./src/assets/md/${file})
  echo "  {name: '${file##*/}', birth: '${Birth}', modify: '${Modify}'}," >> temp.js
done
echo "]" >> temp.js
sed -e 's/Modify: //g' temp.js > markdowns.js
rm -rf temp.js
