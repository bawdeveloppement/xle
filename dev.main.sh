#!/bin/sh

util=`git config user.name`
mv test/main.lua test/main.temp.lua
mv test/main.$util.lua test/main.lua

ls test
