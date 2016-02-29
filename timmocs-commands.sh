# show the initial commit

git log --oneline --decorate

# show child branch

echo 'nose' >> face.txt
git add *.txt
git commit -m "add nose"

git log --oneline --decorate

# many generations

echo 'mouth' >> face.txt
git add *.txt
git commit -m "add mouth"

git log --oneline --decorate


reset

# add to sad branch

git branch sad

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

echo 'mouth' >> face.txt
git add *.txt
git commit -m "add sad mouth"

git log sad --oneline --decorate

git log master --oneline --decorate

# show head pointing to master

git checkout master

git log master --oneline --decorate


reset

# show start of sad branch

git branch sad

git log --oneline --decorate

# show moving head

git checkout sad

git log --oneline --decorate

# move head forward

echo 'nose' >> face.txt
git add *.txt
git commit -m "add nose"

echo 'mouth' >> face.txt
git add *.txt
git commit -m "add sad mouth"

git log sad --oneline --decorate

reset

# fast forward merge


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

# delete branch FF from

git branch -d happy

# post FF clean tree

git log --oneline --decorate

reset

# show merge (no edit)

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

# show cherry pick

git branch hair
git checkout -b horns
echo 'left horn' >> face.txt
git add *.txt
git commit -m 'add one horn'
echo 'add right horn' >> face.txt
git add *.txt
git commit -m 'add the other horn'

git checkout hair
echo 'hair' >> face_2.txt
git add *.txt
git commit -m 'add hair'
echo 'beard' >> face_2.txt
git add *.txt
git commit -m 'add beard'

git checkout horns

git log hair --oneline --decorate

git cherry-pick hair~1

git cherry-pick hair~0

git log --oneline --decorate

reset

# show single cherry pick

git branch hair
git checkout -b horns
ruby -e "lines=File.readlines('foo.txt').map(&:chomp);lines[0]=\"left horn\";File.open('foo.txt', 'w'){|f|f.puts lines.join(\"\n\")}"
git add *.txt
git commit -m 'add one horn'
ruby -e "lines=File.readlines('foo.txt').map(&:chomp);lines[1]=\"right horn\";File.open('foo.txt', 'w'){|f|f.puts lines.join(\"\n\")}"
git add *.txt
git commit -m 'add the other horn'

git checkout hair
ruby -e "lines=File.readlines('foo.txt').map(&:chomp);lines[7]=\"hair\";File.open('foo.txt', 'w'){|f|f.puts lines.join(\"\n\")}"
git add *.txt
git commit -m 'add hair'
ruby -e "lines=File.readlines('foo.txt').map(&:chomp);lines[8]=\"beard\";File.open('foo.txt', 'w'){|f|f.puts lines.join(\"\n\")}"
git add *.txt
git commit -m 'add beard'

git checkout horns

git log hair --oneline --decorate

git cherry-pick hair~0

cat foo.txt

git log --oneline --decorate

reset

#rebase

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

git log --oneline --decorate

git rebase horns

git log --oneline --decorate


git checkout horns

git merge hair

git branch -d hair

git log --oneline --decorate
