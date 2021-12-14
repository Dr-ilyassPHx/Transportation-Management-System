FROM ubuntu:20.04
ENV PYTHONUNBUFERED = 1
RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y python3.6
RUN apt-get install -y git
RUN apt install -y wget
RUN apt install -y python3-pip
RUN python3 -m pip install --upgrade pip

WORKDIR /app

COPY requirements.txt /app
RUN pip3 install -r requirements.txt
COPY . .

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000"]