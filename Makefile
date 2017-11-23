build:
	docker build -t weather-notebook .

run:
	docker run --detach --rm -p 8888:8888 --name weather-notebook \
	    weather-notebook start-notebook.sh

logs:
	docker logs weather-notebook
