# track the build timestamp in Dockerfile.build so the Dockerfile is rebuilt when dependencies change
Dockerfile.build: Dockerfile
	docker build -t hugo-docker .
	touch $@

clean:
	rm Dockerfile.build

RUN_ARGS=--rm -it --volume ./:/src hugo-docker

shell: Dockerfile.build
	@docker run $(RUN_ARGS) /bin/sh

serve: Dockerfile.build
	@docker run --publish 8080:8080 $(RUN_ARGS) /bin/sh -c " \
		hugo --gc --noBuildLock --disableFastRender --cleanDestinationDir server --bind 0.0.0.0 --port 8080 --logLevel=debug --poll 250; \
	"

