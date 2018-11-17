#!/bin/bash

del_stopped(){
	local name=$1
	local state
	state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

	if [[ "$state" == "false" ]]; then
		docker rm "$name" || true
	fi
}

firefox(){
	# add flags for proxy if passed
	local proxy=
	local map=
	local args=$*
	del_stopped firefox

	docker run \
		-it \
		--memory 3gb \
		-v /etc/localtime:/etc/localtime:ro \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=${DISPLAY} \
		-e NODE_ENV=production \
		-v "${HOME}/.mozilla:/home/dockeruser/.mozilla" \
		-v "${HOME}/.cache/mozilla:/home/dockeruser/.cache/mozilla" \
		-v /dev/shm:/dev/shm \
		-v /etc/hosts:/etc/hosts \
		-u 1000 \
		--device /dev/snd \
		--device /dev/dri \
		--device /dev/bus/usb \
		--group-add audio \
		--group-add video \
		--name firefox \
		orangejulius/firefox:2017-11-28
}

firefox
