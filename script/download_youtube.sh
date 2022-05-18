URL="https://www.youtube.com/watch?v=2-aK25lBzvI&list=PLdPQZLMHRjDIzO99aE7yAtdOHSVHMXfYH&index=1"
#yt-dlp --list-subs $URL 
#yt-dlp --write-subs en --sub-format json3 -N 5 $URL
yt-dlp -N 5 $URL
