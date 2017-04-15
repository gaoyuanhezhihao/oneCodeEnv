#!/bin/bash
function leet(){
    echo "creating c++ project for leetcode..."
    mkdir bin src build data include 
    cp ~/.ycm_extra_conf.py ./
    cp ~/oneCodeEnv/tmpl/leetcode/makefile.leetcode ./makefile
    cp ~/oneCodeEnv/tmpl/leetcode/main.cpp ./src/main.cpp
    cp ~/oneCodeEnv/tmpl/leetcode/solution.hpp ./include/solution.hpp

    cp -r ~/oneCodeEnv/tmpl/leetcode/test ./
}
