#!/bin/sh

container_name='devct'

while :; do
    output=$(docker exec -it $container_name /bin/sh -c 'cat /opt/bootstrap/startup-finished' 2>&1)
    first_line=$(echo "$output" | head -n 1)

    if [ "$first_line" = "cat: /opt/bootstrap/startup-finished: No such file or directory" ]; then
        sleep 1
    elif [ -z "$first_line" ]; then
        break
    fi
done

docker exec -it $container_name /usr/bin/fish