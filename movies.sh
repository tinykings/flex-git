cd /home/pi/.flexget
xargs -0 -n 1 flexget movie-list add < <(tr \\n \\0 <movies.txt)
> movies.txt
