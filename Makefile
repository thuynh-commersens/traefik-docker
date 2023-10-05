#TODO commandes spé pour chaque container

.PHONY: start
start:
	docker-compose up -d

.PHONY: stop
stop:
	docker-compose down