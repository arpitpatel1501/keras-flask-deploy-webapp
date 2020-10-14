#FROM python:3.6-slim-stretch

FROM ubuntu:18.04
RUN apt update && apt -y install python3.6 python3.6-dev wget
 
#RUN wget https://bootstrap.pypa.io/get-pip.py
#RUN  python3.6 get-pip.py
RUN apt -y install python3-pip
RUN ln -s /usr/bin/python3.6 /usr/local/bin/python3
RUN ln -s /usr/local/bin/pip /usr/local/bin/pip3

ADD requirements.txt /
RUN pip3 install -r /requirements.txt

ADD . /app
WORKDIR /app

EXPOSE 5000
CMD [ "python3" , "app.py"]
