current_path=/home/hzh/oneCodeEnv/shell/func
for f in $current_path/*.sh
do
    if [ "$f" != $current_path/sourceAll.sh ];then
        source $f
    fi
done
