#!/bin/bash

if [ ! -d "../_cache" ]; then
	mkdir ../_cache
fi

g++ `pkg-config --cflags opencv` -o preproc preproc.cpp `pkg-config --libs opencv`
