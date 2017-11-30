
BRANCH=feature/$2
echo $BRANCH
git checkout  -b $BRANCH
echo 1 >> README.rdoc && git add . && git commit  -m "add ." && git push $1  $BRANCH
