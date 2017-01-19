#!/bin/bash

echo `date` >> git-push.log
git add .

date = `date +%Y.%m.%d-%X`

git commit -a -m "$date"

git push
