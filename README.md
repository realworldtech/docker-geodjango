# docker-geodjango

This image provides an environment suitable for running Django 1.9.2 with the geodjango extensions under
nginx and uWSGI.

It requires a bit of config to get working - you need to add a uWSGI config to the /etc/uwsgi/vassals
directory and also an nGINX site config to /etc/nginx/sites-enabled. You probably want to do this
either as part of your application launch script or as part of your custom image.

An example Dockerfile might look like:

```
FROM realworld/geodjango

COPY uwsgi-config.ini /etc/uwsgi/vassals/uwsgi-config.ini
COPY mysite.conf /etc/nginx/sites-enabled/mysite.conf
VOLUME /usr/src/app

CMD /usr/bin/launch-nginx.sh
```

You may also want to use manage.py runserver while testing, rather than uWSGI and nGINX.

While you could run a local postgres-gis server by installign the additional packages,
you probably will be using an external postgis server, possibly from another image such as
`kartoza/postgis:9.4-2.1`.

The uWSGI docs are invaluable for working out how to make this work. Have a look at
http://uwsgi-docs.readthedocs.org/en/latest/tutorials/Django_and_nginx.html