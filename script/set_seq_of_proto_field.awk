BEGIN{num=1}
$1 ~ /optional/{
  gsub(/[0-9][0-9]*/, num);
  num+=1
  print $0 }
END{}
