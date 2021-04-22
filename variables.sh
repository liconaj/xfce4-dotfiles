#!/bin/bash

echo "Configuring ~/.profile ..."
cp -r -b src/profile $HOME/.profile

echo "Adding scripts..."
[ ! -d $HOME/.local/bin ] && mkdir $HOME/.local/bin
cp -r src/bin/* $HOME/.local/bin

