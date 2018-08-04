pull:
	docker pull emby/embyserver:latest
run:
	-docker network create --subnet=172.18.0.0/16 dockernet
	
	docker run -net dockernet --ip 172.18.0.10 -d  \
		--volume /opt/emby/config:/config \ # This is mandatory
		--volume /opt/emby/media:/mnt/share1 \ # To mount a first share
		--publish 8096:8096 \ # To expose the HTTP port
		--publish 8920:8920 \ # To expose the HTTPS port
		--env UID=1000 \ # The UID to run emby as (default: 2)
		--env GID=100 \ # The GID to run emby as (default 2)
		emby/embyserver:latest	
