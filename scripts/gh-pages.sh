#!/usr/bin/env sh
set -x

ls dist

git config --global user.email "faisalakbar661@gmail.com"
git config --global user.name "Faisal"
git config --global http.postBuffer 157286400
git remote set-url origin https://Faisal-666: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@github.com/Faisal-666/simple-python-pyinstaller-app.git

npx gh-pages --message 'test deploy' --dist dist --verbose
