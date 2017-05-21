FROM alpine:latest

# Install dependencies
RUN apk add --update \
	git python3 py3-requests py3-lxml

# Install feedgenerator dependency
RUN git clone 'https://github.com/getpelican/feedgenerator.git' && \
	cd feedgenerator && \
	python3 ./setup.py install --optimize=1

# Install feedo from git
RUN git clone 'https://github.com/Roliga/feedo.git'

# Install startup script
COPY "run-feedo.sh" "/run-feedo.sh"

# Service runs on port 80, so expose that
EXPOSE 80

CMD [ "/run-feedo.sh" ]
