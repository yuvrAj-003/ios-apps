#!/bin/bash

rm -rf */.git
git add .
git commit -m $1
git push origin main

