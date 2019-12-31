#!/usr/bin/env sh

set -e
bold=$(tput bold)
normal=$(tput sgr0)

# When Docker's build of wordpress:cli is having problems, set this variable
# Currently corresponds to wordpress:cli-2.0.0-php7.2
# Issue: https://github.com/docker-library/official-images/issues/3835
#PINNED_IMAGE='@sha256:6719c1a21007b9c5f33045d7552ff5df5a85bb0eacecf3ac23134c158e9cadb1'

# TODO: Using --user xfs is a hack, we need to ensure we share the correct UID across both cli and wordpress containers
cli()
{
	docker run -it --rm --user xfs --volumes-from wordpress --network container:wordpress "wordpress:cli${PINNED_IMAGE}" "$@" > /dev/null
}

echo "${bold}Hello!${normal} Let's get this thing set up for you"
echo

echo "Pulling the WordPress CLI docker image…"
docker pull "wordpress:cli${PINNED_IMAGE}" > /dev/null

echo "Setting up WordPress…"
cli wp core install --path=/var/www/html --url=localhost:8000 --title='WP Docker' --admin_name=admin --admin_password=password --admin_email=admin@example.com --skip-email

echo "Updating WordPress…"
cli wp core update --path=/var/www/html --url=localhost:8000
