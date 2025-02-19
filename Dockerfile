FROM python:3.10-slim-buster

WORKDIR /app

# install required packages for system
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt .

RUN pip install --upgrade pip setuptools wheel

Run pip install mysqlclient

COPY . .

RUN pip install -r requirements.txt

CMD ['python', 'manage.py', 'runserver', '0.0.0.0:8001']