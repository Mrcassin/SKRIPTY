
cas=`date +%T" "%D`
ip=`ifconfig | grep Všesměr | awk -F ":" '{print $2}' | awk -F " " '{print $1}'`
rx=`ifconfig eth0 | grep Přijato | awk -F "(" '{print $2}' | awk -F ")" '{print $1}'`
tx=`ifconfig eth0 | grep Přijato | awk -F "(" '{print $3}' | awk -F ")" '{print $1}'`
un=`who | wc -l `
du=`df -h | grep sda | awk -F " " '{print $3}'`
da=`df -h | grep sda | awk -F " " '{printf $4}'`
um=`free -m | grep Mem: | awk -F " " '{print $3}'`
fm=`free -m | grep Mem: | awk -F " " '{print $4}'`

echo "<h2> Aktuální čas: "$cas >>/home/student/Plocha/SKRIPTY/index.html
echo "</h2>" >>/home/student/Plocha/SKRIPTY/index.html
echo "<br>" >>/home/student/Plocha/SKRIPTY/index.html
echo "<h3>" >>/home/student/Plocha/SKRIPTY/index.html
echo "Moje IP: "$ip >>/home/student/Plocha/SKRIPTY/index.html
echo "<br>" >>/home/student/Plocha/SKRIPTY/index.html
echo "Přijatá data: "$rx >>/home/student/Plocha/SKRIPTY/index.html
echo "<br>" >>/home/student/Plocha/SKRIPTY/index.html
echo "Odeslaná data:" $tx >>/home/student/Plocha/SKRIPTY/index.html
echo "<br>" >>/home/student/Plocha/SKRIPTY/index.html
echo "Počet přihlášených uživatelů: "$un >>/home/student/Plocha/SKRIPTY/index.html
echo "<br>" >>/home/student/Plocha/SKRIPTY/index.html
echo "Využité místo na disku: "$du >>/home/student/Plocha/SKRIPTY/index.html
echo "<br>" >>/home/student/Plocha/SKRIPTY/index.html
echo "Volné místo na disku: "$da >>/home/student/Plocha/SKRIPTY/index.html
echo "<br>" >>/home/student/Plocha/SKRIPTY/index.html
echo "Využitá RAM: "$um" MB" >>/home/student/Plocha/SKRIPTY/index.html
echo "<br>" >>/home/student/Plocha/SKRIPTY/index.html
echo "volná RAM: "$fm" MB" >>/home/student/Plocha/SKRIPTY/index.html
echo "</h3>" >>/home/student/Plocha/SKRIPTY/index.html
echo "<br>" >>/home/student/Plocha/SKRIPTY/index.html
