function cvPrj() {
    # create cpp project using opencv3.
    mkdir bin src build data include
    cp ~/.ycm_extra_conf.py ./
    cp ~/Documents/cv_makefile ./makefile
    touch ReadMe.md
    touch ./src/main.cpp
}
