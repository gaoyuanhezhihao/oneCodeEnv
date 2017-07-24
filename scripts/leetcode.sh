#!/bin/bash
function leet(){
    echo "creating c++ project for leetcode..."
    mkdir -p bin src build data include 
    cp -n ~/.ycm_extra_conf.py ./
    cp -n ~/oneCodeEnv/tmpl/leetcode/makefile.leetcode ./makefile
    cp -n ~/oneCodeEnv/tmpl/leetcode/main.cpp ./src/main.cpp
    cp -n ~/oneCodeEnv/tmpl/leetcode/solution.hpp ./include/solution.hpp
    cp -n ~/oneCodeEnv/tmpl/leetcode/run.sh  ./run.sh

    cp -nr ~/oneCodeEnv/tmpl/leetcode/test ./
    ln -s ~/oneCodeEnv/tmpl/googleTest/gtest-all.o ./test/gtest-all.o
    ln -s ~/oneCodeEnv/tmpl/googleTest/gtest_main.a ./test/gtest_main.a
    ln -s ~/oneCodeEnv/tmpl/googleTest/gtest_main.o ./test/gtest_main.o
}
