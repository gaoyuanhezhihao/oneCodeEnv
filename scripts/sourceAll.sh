current_path=/home/hzh/.usrScript
files=`ls $current_path| grep "\.sh"`
for f in $files
do
    if [ "$f" != "sourceAll.sh" ];then
        source $current_path/$f
    fi
done
