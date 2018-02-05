function cmkPrj(){
    echo "creating common cmake c++ project..."
    mkdir -p src build bin
    cp ~/.ycm_extra_conf.py ./
    cp ~/oneCodeEnv/tmpl/CMakeLists.txt ./
    cp ~/oneCodeEnv/tmpl/main.cpp ./src/
}
