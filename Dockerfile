FROM python:3.9
EXPOSE 8888

RUN apt-get update \
    && apt-get install -y pandoc texlive-xetex \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

ENTRYPOINT ["jupyter"]
CMD ["lab", "--ip=0.0.0.0"]
