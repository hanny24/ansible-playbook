function docker_cleanup
	docker run -e CLEAN_PERIOD=0 -e DELAY_TIME=0 -v /var/run/docker.sock:/var/run/docker.sock:rw -v /var/lib/docker:/var/lib/docker:rw meltwater/docker-cleanup:latest
end
