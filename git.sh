#!/bin/bash

echo `date` >> git-push.log
git add .

git commit -a -m "`date`"

git push
