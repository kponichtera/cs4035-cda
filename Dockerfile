FROM python:3.10
EXPOSE 8888

RUN apt-get update \
    && apt-get install -y pandoc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

ENTRYPOINT ["jupyter"]
CMD ["lab", "--ip=0.0.0.0"]