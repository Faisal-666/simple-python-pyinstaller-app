#!/usr/bin/env sh
set -ex

pwd

ls dist

git config --global user.email "faisalakbar661@gmail.com"
git config --global user.name "Faisal"
git config --global http.postBuffer 157286400

git clone --branch gh-pages https://Faisal-666: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@github.com/Faisal-666/simple-python-pyinstaller-app.git gh-pages-temp

cd gh-pages-temp
cp -r /var/jenkins_home/workspace/submission-cicd-pipeline-faisalakbar661/dist/*

git add .
git commit -m "test deploy ke gh-pages"
git push origin gh-pages
 
cd ..
rm -rf gh-pages-temp
