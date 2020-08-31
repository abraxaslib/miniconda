FROM python:3.7

RUN apt-get update
RUN apt-get install mariadb-server -y
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh \
    && echo PATH="/root/miniconda3/bin":$PATH >> .bashrc \
    && exec bash
RUN /root/miniconda3/bin/conda update conda -y
RUN /root/miniconda3/bin/conda --version
RUN /root/miniconda3/bin/conda create --name ds_env python=3.7 -y
RUN /root/miniconda3/bin/activate /root/miniconda3/envs/ds_env
