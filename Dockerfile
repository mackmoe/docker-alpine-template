FROM alpine:latest AS base

# Install required packages
RUN apk add --update --no-cache bash dos2unix apache2 apache2-utils curl jq

# Install python/pip
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip --upgrade
ENV PYTHONUNBUFFERED=1
# install any Python requirements used by the jobs
RUN pip3 install colorama

WORKDIR /usr/convertftw

# Copy files
COPY jobs/*.* ./jobs/
COPY crontab.* ./
COPY *.sh .

# Fix line endings && execute permissions
RUN dos2unix crontab.* *.sh jobs/*.* && \
    find . -type f -iname "*.sh" -exec chmod +x '{}' \; && \
    find . -type f -iname "*.py" -exec chmod +x '{}' \;  

# create cron.log file
RUN touch /var/log/cron.log

# Run cron on container startup
CMD ["./start.sh"]
