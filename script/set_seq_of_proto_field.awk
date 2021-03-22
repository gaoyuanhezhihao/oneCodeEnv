BEGIN{num=0}
11 <= NR && NR <= 26{
  gsub(/[0-9][0-9]*/, num);
  num+=1
  print $0 }
END{}
