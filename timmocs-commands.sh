git branch sad

git log --oneline --decorate

git checkout sad

git log --oneline --decorate

git checkout master

echo 'nose' >> face.txt
git add *.txt
git commit -m "add nose"

git log --oneline --decorate


echo 'mouth' >> face.txt
git add *.txt
git commit -m "add mouth"

git log --oneline --decorate

git checkout sad

echo 'nose' >> face.txt
git add *.txt
git commit -m "add nose"

git log --oneline --decorate
echo 'mouth' >> face.txt
git add *.txt
git commit -m "add sad mouth"

git log --oneline --decorate

git log master --oneline --decorate

reset

git checkout -b happy

echo 'nose' >> face.txt
git add *.txt
git commit -m "add nose"
echo 'mouth' >> face.txt
git add *.txt
git commit -m "add mouth"

git log --oneline --decorate

git checkout master

git merge happy

git branch -d happy

git log --oneline --decorate

reset

git config --global core.mergeoptions --no-edit

git branch glasses
git checkout -b curly
echo 'curl' >> face.txt
git add *.txt
git commit -m "add curl"

git checkout glasses
echo 'glasses' >> face_2.txt
git add *.txt
git commit -m "add glasses"

git merge curly

git config --global core.mergeoptions --edit

