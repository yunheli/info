BRANCH=feature/$0
gco -b $BRANCH
echo 1 >> README.rdoc && ga . && gc -m "add ." && gp origin  $BRANCH
