build:
	docker build -t keithieopia ./keithieopia
	docker build -t haproxy ./haproxy
run:
	docker network create --subnet=172.18.0.0/16 dockernet
	docker run --net dockernet --ip 172.18.0.10 -d keithieopia
	docker run --net dockernet -p 80:80 -d haproxy
pull:
	if [ -d "./keithieopia.com" ]; then \
		cd keithieopia.com && git pull; \
	else \
		git clone "http://github.com/keithieopia/keithieopia.com.git"; \
        cd keithieopia.com && yarn add install-peerdeps; \
	fi
	cd keithieopia.com && make build
