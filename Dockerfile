# Dockerfile

# FROM directive instructing base image to build upon
FROM gcr.io/educative-exec-env/educative:latest


# COPY startup script into known file location in container
COPY start.sh /usr/local/educative/start.sh

# COPY Django Project folder and requirements.txt into our working directory
COPY helloworld  /usr/local/educative/
COPY requirements.txt  /usr/local/educative/

# install python 3 and pip
RUN apt-get install python3
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    python3 -m pip install --upgrade pip 

# make python 3 default python environment
RUN alias python=python3

# install Django and Gunicorn dependencies from our requirements file
RUN cd /usr/local/educative && pip install -r requirements.txt 

# EXPOSE port 8000 to allow communication to/from server
EXPOSE 8000

# CMD specifies the command to execute to start the server running.
CMD ["/start.sh"]
# done! :)
