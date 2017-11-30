
BRANCH=feature/$0
echo $BRANCH
git checkout  -b $BRANCH
echo 1 >> README.rdoc && git add . && git commit  -m "add ." && git push origin  $BRANCH
