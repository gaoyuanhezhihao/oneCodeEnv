#!/bin/bash
function nowCoder(){
    echo "creating c++ project for nowcoder..."
    mkdir -p bin src build data include 
    cp -n ~/.ycm_extra_conf.py ./
    cp -n ~/oneCodeEnv/tmpl/nowcoder/makefile.nowcoder ./makefile
    cp -n ~/oneCodeEnv/tmpl/nowcoder/main.cpp ./src/main.cpp
    #cp -n ~/oneCodeEnv/tmpl/nowcoder/solution.hpp ./include/solution.hpp
    cp -n ~/oneCodeEnv/tmpl/nowcoder/run.sh ./run.sh
    cp -n ~/oneCodeEnv/tmpl/nowcoder/input.txt ./input.txt

    cp -nr ~/oneCodeEnv/tmpl/nowcoder/test ./
}
