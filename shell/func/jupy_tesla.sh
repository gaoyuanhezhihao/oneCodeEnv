function jupy(){
    echo "connect jupyter server..."
    #source ~/oneCodeEnv/network/jupy_tesla.sh
    ssh -N -f -L 127.0.0.1:8889:127.0.0.1:8889 hzh@$*
}
