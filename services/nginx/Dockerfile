
FROM	nginx:1.25.3-alpine
RUN	apk add --no-cache \
	fcgiwrap \
	spawn-fcgi
COPY	services/nginx/05-spawn-fcgi.sh	/docker-entrypoint.d/05-spawn-fcgi.sh
