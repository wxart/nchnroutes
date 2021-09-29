produce:
	git pull
	curl -o delegated-apnic-latest https://ftp.apnic.net/stats/apnic/delegated-apnic-latest
	curl -o china_ip_list.txt https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt
	python3 produce.py
	sed -r 's#route ([0-9\.\/]+) via .*#/ip/route/add dst-address=\1 gateway=wg-ay routing-table=main distance=1 comment=imports#g;1i /ip/route/remove [find comment=imports]' routes4.conf > static-routes4.rsc
	# sudo mv routes4.conf /etc/bird/routes4.conf
	# sudo mv routes6.conf /etc/bird/routes6.conf
	# sudo birdc configure
	# sudo birdc6 configure
