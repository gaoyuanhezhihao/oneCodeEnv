function cdls(){ 
    cd $@
    ls
    #ls | more
    #IFS=$'\n' a=($(ls))
    #echo ${a[*]} | more
    #len=${#a[@]}
    #echo $len
    #if [ $len -ge 1024 ];then
        #echo "more than 2"
    #else
        #echo "less or equal to 2"
    #fi
}
