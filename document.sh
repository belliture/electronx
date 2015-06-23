#!/bin/sh

haxe build.hxml && haxelib run dox -i output -o document
