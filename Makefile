app-restart:
	echo "Restarting app..."
	cd golang && go build -o app app.go && cd ..
	sudo systemctl restart isu-go
	rm /home/isucon/private_isu/webapp/public/images/posts/*

app-log:
	echo "app log..."
	sudo journalctl -u isu-go -f

mysql-restart:
	echo "Restarting mysql..."
	now=`date +%Y%m%d-%H%M%S` && sudo mv /var/log/mysql/slow.log /var/log/mysql/slow.log.$now && sudo mysqladmin flush-logs
	sudo systemctl restart mysql

nginx-restart:
	echo "Restarting nginx..."
	sudo rm /var/log/nginx/access.log && sudo systemctl reload nginx
	sudo systemctl restart nginx

alp:
	echo "alp..."
	alp -f /var/log/nginx/access.log --sum -r > alp.txt
	sudo rm /var/log/nginx/access.log && sudo systemctl reload nginx

pt-query-digest:
	echo "pt-query-digest..."
	sudo pt-query-digest /var/log/mysql/slow.log > query.txt
	now=`date +%Y%m%d-%H%M%S` && sudo mv /var/log/mysql/slow.log /var/log/mysql/slow.log.$now && sudo mysqladmin flush-logs
