FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip mysql-client build-essential libssl-dev libffi-dev python3-dev && \
    apt-get clean

WORKDIR /app
COPY . /app

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["python3"]
CMD ["app.py"]
