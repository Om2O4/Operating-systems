echo "-------------------------"
echo "     DISK USAGE REPORT   "
echo "-------------------------"

disk=$(df / | tail -1)

total=(echo"disk" | awk '{print $2}')
used=(echo"disk" | awk '{print $3}')
avaliable=(echo"disk" | awk '{print $4}')
percent=(echo"disk" | awk '{print $5}')

total_gb=$((total/1024/1024))
used_gb=$((used/1024/1024))
avaliable_gb=$((avaliable/1024/1024))

echo "Total Space :${total_gb} GB"
echo "Used Sapce  :${used_gb} GB"
echo "Avaliable   :${avaliable_gb} Gb"
echo "Dish Usage  :${percent} "

echo "-------------------------"

usage=${percent%%%}

if [ "$usage" -ge 80 ];
then
        echo "WARNING: HIGH DISK USAGE!!!"
else
        echo  "Normal Disk Usage."
fi

echo "-------------------------"

df -h –output=source,size,used,avail,pcent,target

echo "-------------------------"

#practical-1:Write a shell script to display disk space usage of the file system, including the total space, used space, available space, and usage percentage.
