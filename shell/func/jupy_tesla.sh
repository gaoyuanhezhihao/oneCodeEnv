function jupy(){
    echo "connect jupyter server..."
    IP="" 
    Remote_Port=8889
    This_Port=8889

    case $# in
        3)
            #echo 3
            IP=$1
            Remote_Port=$2
            This_Port=$3
            ;;
        2)
            #echo 2
            IP=$1
            Remote_Port=$2
            ;;
        1)
            #echo 1
            IP=$1
            ;;
        *)
            echo "wrong format of parameters.\nexample: jupy 114.214.123.23 8889 8558"
            return 1
            ;;
    esac
    #source ~/oneCodeEnv/network/jupy_tesla.sh
    echo $IP":"$Remote_Port "--> 127.0.0.1:"$This_Port
    ssh -N -f -L 127.0.0.1:$This_Port:127.0.0.1:$Remote_Port hzh@$IP
}
