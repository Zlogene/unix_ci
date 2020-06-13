#!/usr/bin/env bash

backup_func() {
	echo "Runing backup..."
	for i in \
	 $(docker images --format="{{.Repository}} {{.ID}}" "unix_ci_*" | cut -d " " -f 1); do docker save ${i} -o ${i}-$(date +"%m-%d-%Y").tar; \
	done
}

backup_func;
