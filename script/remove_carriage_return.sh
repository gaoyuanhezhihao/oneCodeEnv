for f in `ls`;
do
  sed -i "s/\r/\n/g" $f
done
