build:
	docker build -t localhost/http .
run:
	docker run --rm -it localhost/http

build_podman:
	podman build -t localhost/http .
run_podman:
	podman run --rm -it localhost/http
