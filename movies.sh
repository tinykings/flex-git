cd /home/pi/.flexget
while read in; do flexget movie-list add < <(tr \\n \\0 <movies.txt) "$in"; done < movies.txt
> movies.txt
