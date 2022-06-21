FROM python:3.9 AS flexfringe_builder

RUN apt-get update \
    && apt-get install -y git g++ make \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/tudelft-cda-lab/FlexFringe.git /flexfringe

WORKDIR /flexfringe
RUN make

FROM python:3.9 AS final
EXPOSE 8888

RUN apt-get update \
    && apt-get install -y pandoc texlive-xetex graphviz \
    && rm -rf /var/lib/apt/lists/*

COPY --from=flexfringe_builder /flexfringe/flexfringe /usr/bin/flexfringe

RUN pip install git+https://github.com/tudelft-cda-lab/FlexFringe-python.git

COPY requirements.txt .
RUN pip install -r requirements.txt

ENTRYPOINT ["jupyter"]
CMD ["lab", "--ip=0.0.0.0"]
