pull:
	docker pull emby/embyserver:latest
	docker pull diginc/pi-hole:latest
run:
	-docker network create --subnet=172.18.0.0/16 dockernet

	docker run --net dockernet --ip 172.18.0.10 -d  \
		--volume /opt/emby/config:/config \
		--volume /mnt/media:/mnt/share1 \
		--publish 8096:8096 \
		--publish 8920:8920 \
		--env UID=1000 \
		--env GID=100 \
		emby/embyserver:latest

	docker run --net dockernet --ip 172.18.0.50 -d \
		--name pihole \
		-p 53:53/tcp -p 53:53/udp \
		-p 67:67/udp \
		-p 80:80 \
		-p 443:443 \
		-v "/opt/pihole/:/etc/pihole/" \
		-v "/opt/pihole/dnsmasq.d/:/etc/dnsmasq.d/" \
		-e ServerIP="192.168.0.50" \
		--restart=unless-stopped \
		--cap-add=NET_ADMIN \
		diginc/pi-hole:latest
