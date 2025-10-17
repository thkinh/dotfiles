#!/bin/bash

environment_type="$1"

case "$environment_type" in
    java|Java|JAVA|go|Go|GO)
        environment_type=${environment_type,,}
        echo "Setting up development environment for $environment_type"
        # Check docker ps to see if the container is already started
        if [ "$(docker ps -aq -f name=${environment_type}-environment)" ]; then
            echo "Container is already running. starting bash session..."
            docker start -ai ${environment_type}-environment
        else
            echo "Starting new container for $environment_type development environment..."
            if [[ "$environment_type" =~ ^(java|Java|JAVA)$ ]]; then
                echo "docker run -it --name java-environment ${environment_type}-environment"
                # docker run -it --name java-environment -v "$PWD":/usr/src/app
            else
                echo "docker run -it --name go-environment -v \"$PWD\":/usr/src/app"
                # docker run -it --name go_environment -v "$PWD":/usr/src/app
            fi
        fi
        ;;
    *)
        echo "Unsupported environment type. Please specify 'java' or 'go'."
        exit 1
        ;;
esac

