BRANCH=feature/$0
git check out  -b $BRANCH
echo 1 >> README.rdoc && git add . && git commit  -m "add ." && git push origin  $BRANCH
