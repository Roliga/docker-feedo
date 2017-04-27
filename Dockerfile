FROM alpine:latest

# Install dependencies
RUN apk add --update \
	git python

# Get feedo from git
RUN git clone 'git@github.com:Roliga/feedo.git'

# Install startup script
COPY "run-feedo.sh" "/run-feedo.sh"

# Service runs on port 80, so expose that
EXPOSE 80

CMD [ "/run-feedo.sh" ]
