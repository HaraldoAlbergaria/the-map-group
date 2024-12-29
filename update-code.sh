#!/bin/bash

echo "Updating code repository..."
cd ../the-map-group.github.io
./update-repos.sh
COMMIT_MESSAGE=`git log -1 --pretty=%B`

echo "Copying data from code repository..."
cd ../The-Map-Group
git checkout -- .
cp ../the-map-group.github.io/countries_bbox.js .
cp ../the-map-group.github.io/countries_info.py .
cp ../the-map-group.github.io/custom.js .
cp ../the-map-group.github.io/generate-map-data.py .
cp ../the-map-group.github.io/index.html .
cp ../the-map-group.github.io/style.css .
cp ../the-map-group.github.io/update-maps.py .
cp ../the-map-group.github.io/countries/custom.js countries/
cp ../the-map-group.github.io/countries/index.html countries/
cp ../the-map-group.github.io/countries/style.css countries/
cp ../the-map-group.github.io/countries/updateHtmlFiles.pl countries/
cp ../the-map-group.github.io/countries/update-html.sh countries/
cp ../the-map-group.github.io/people/config.js people/
cp ../the-map-group.github.io/people/custom.js people/
cp ../the-map-group.github.io/people/index.html people/
cp ../the-map-group.github.io/people/removeMembers.pl people/
cp ../the-map-group.github.io/people/reset-member-map.sh people/
cp ../the-map-group.github.io/people/resetMembers.pl people/
cp ../the-map-group.github.io/people/setup-member.sh people/
cp ../the-map-group.github.io/people/style.css people/
cp ../the-map-group.github.io/people/update-countries-map-data.py people/
cp ../the-map-group.github.io/people/updateHtmlFiles.pl people/
cp ../the-map-group.github.io/people/update-html.sh people/
cp ../the-map-group.github.io/people/update-member-map.sh people/
git status

echo "Changes: \"$COMMIT_MESSAGE\""
read -p "Commit and push the changes? (Yes/No): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

echo "Commiting changes..."
git add *
git commit -m "Updated code [$COMMIT_MESSAGE]"

echo "Pushing changes..."
git push origin main
git push fork main

