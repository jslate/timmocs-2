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

git log --oneline --decorate

git config --global core.mergeoptions --edit

reset

git branch hair
git checkout -b horns
echo 'left horn' >> face.txt
git add *.txt
git commit -m 'add one horn'
echo 'add right horn' >> face.txt
git add *.txt
git commit -m 'add the other horn'

git log --oneline --decorate


git checkout hair
echo 'hair' >> face_2.txt
git add *.txt
git commit -m 'add hair'
echo 'beard' >> face_2.txt
git add *.txt
git commit -m 'add beard'

git cherry-pick horns~1
git cherry-pick horns~0

git log --oneline --decorate





reset

git branch hair
git checkout -b horns
echo 'left horn' >> face.txt
git add *.txt
git commit -m 'add one horn'
echo 'add right horn' >> face.txt
git add *.txt
git commit -m 'add the other horn'

git log --oneline --decorate


git checkout hair
echo 'hair' >> face_2.txt
git add *.txt
git commit -m 'add hair'
echo 'beard' >> face_2.txt
git add *.txt
git commit -m 'add beard'

git rebase horns

git log --oneline --decorate


git checkout horns

git merge hair

git branch -d hair

git log --oneline --decorate
