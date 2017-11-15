function cppPrj(){
    echo "creating common c++ project in current dir"
    mkdir bin src build data include
    cp ~/.ycm_extra_conf.py ./
    cp ~/Documents/makefile.std ./makefile
    touch ./src/main.cpp
    echo "#include <iostream>" > ./src/main.cpp
    echo "using namespace std;" >> ./src/main.cpp
    echo "int main(int argc, char ** argv) {" >> ./src/main.cpp
    echo "    ">> ./src/main.cpp
    echo "}" >> ./src/main.cpp

}
