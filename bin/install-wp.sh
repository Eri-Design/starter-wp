
#!/usr/bin/env sh

cli()
{
	docker run -it --rm --user xfs --volumes-from wordpress --network container:wordpress "wordpress:cli${PINNED_IMAGE}" "$@" > /dev/null
}

# Install WordPress.
cli wp core install \
 --title="Project" \
 --admin_user="wordpress" \
 --admin_password="wordpress" \
 --admin_email="admin@example.com" \
 --url="http://myproject.test" \
 --skip-email

# Update permalink structure.
cli wp option update permalink_structure "/%postname%/" --skip-themes --skip-plugins
