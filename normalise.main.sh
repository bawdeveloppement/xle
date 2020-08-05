#!/bin/sh

util=`git config user.name`
mv test/main.lua test/main.$util.lua
mv test/main.temp.lua test/main.lua

ls test
