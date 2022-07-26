URL="https://www.youtube.com/watch?v=2-aK25lBzvI&list=PLdPQZLMHRjDIzO99aE7yAtdOHSVHMXfYH&index=1"
#yt-dlp --list-subs $URL 
#yt-dlp --write-subs en --sub-format json3 -N 5 $URL
#yt-dlp --proxy socks5://127.0.0.1:10081 --write-subs en --sub-format json3 -N 5 --playlist-items 4,5,7,8,10,11,12,14,15,17,18,20,22,25 $URL
yt-dlp --write-subs en --sub-format json3 -N 20 --playlist-items 5,7,12,14,15,17,18,20,22,25 $URL

#yt-dlp -N 5 $URL
#yt-dlp --flat-playlist $URL
#yt-dlp --flat-playlist --get-title $URL > temp.txt

