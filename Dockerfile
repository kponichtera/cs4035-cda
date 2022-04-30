FROM python:3.10
EXPOSE 8888

COPY requirements.txt .
RUN pip install -r requirements.txt

ENTRYPOINT ["jupyter"]
CMD ["notebook", "--allow-root", "--ip=0.0.0.0"]