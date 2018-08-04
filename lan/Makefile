pull:
	docker pull emby/embyserver:latest
run:
	-docker network create --subnet=172.18.0.0/16 dockernet

	docker run --net dockernet --ip 172.18.0.10 -d  \
		--volume /opt/emby/config:/config \
		--volume /opt/emby/media:/mnt/share1 \
		--publish 8096:8096 \
		--publish 8920:8920 \
		--env UID=1000 \
		--env GID=100 \
		emby/embyserver:latest
