#!/bin/bash

echo Enter your username for mirrors.liferay
read username
echo $username > liferay/build-resources/.username

echo Enter your password for mirrors.liferay
read -s password
echo $password > liferay/build-resources/.password

echo Thanks, your username and password have been stored locally.
