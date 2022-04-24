bench:
	now=`date +%Y%m%d-%H%M%S` && sudo mv /var/log/mysql/slow.log /var/log/mysql/slow.log.$now && sudo mysqladmin flush-logs
	echo -n "" > /var/log/nginx/access.log && sudo chmod 777 /var/log/nginx/access.log
