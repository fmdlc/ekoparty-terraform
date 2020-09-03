# Dockerfile for containerize_app
FROM python:3.7.1-alpine

LABEL Author="Facu de la Cruz"
LABEL Email="fmdlc.unix@gmail.com"

WORKDIR /src
COPY ./src /src

# * In order to use meinheld later, we need to build it.
# 	For this porpuse we install gcc and build-base.
#
# *	To decrease container image size, we don't want to store cache.
#
# *	We have pinned versions in order to follow Linting practices
# 	- https://github.com/hadolint/hadolint/wiki/DL3008
RUN apk add --update --no-cache \
		gcc=6.4.0-r9 \
		build-base=0.5-r1  && \
	  pip install --no-cache-dir --upgrade pip==20.2.2 && \
	  pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

# Meinheld is a high-performance WSGI-compliant web server that
# takes advantage of greenlet and picoev to enable asynchronous
# network I/O in a light-weight manner.
ENTRYPOINT ["gunicorn", "-w 4", "-k meinheld.gmeinheld.MeinheldWorker", "-b 0.0.0.0:8000", "server:app"]

# We want to handle SIGINT to stop the container
STOPSIGNAL SIGINT
