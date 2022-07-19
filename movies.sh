cd /home/pi/.flexget

while read in; do flexget movie-list add "$in" done < movies.txt

> movies.txt
