FROM python:3.8

USER root

WORKDIR /usr/src/

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir /usr/src/intranet

COPY . /usr/src/intranet/
RUN echo $(ls -a)
#Vagrant Provision

USER root

RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get install sudo
#RUN apt-get install timedatectl

#RUN timedatectl set-timezone America/New_York

RUN cp intranet/config/krb5.conf /etc/krb5.conf

RUN apt-get -y install krb5-user

RUN pip install --no-cache-dir -U virtualenvwrapper

RUN apt-get -y install libjpeg62-turbo-dev libkrb5-dev

RUN apt-get -y install git

RUN git config --global user.name "username" && git config --global user.email "email@gmail.com"

RUN apt-get -y install cups cups-bsd cups-client

RUN echo "ServerName cups2.csl.tjhsst.edu" > /etc/cups/client.conf

RUN cp intranet/config/bash_completion.d/fab /etc/bash_completion.d/fab

RUN export VIRTUALENV_DISTRIBUTE=true && export PIP_VIRTUALENV_BASE=./.virtualenv && export WORKON_HOME=./.virtualenvs && export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
RUN bash -c  "source /usr/local/bin/virtualenvwrapper.sh"



RUN cp intranet/config/ion_env_setup.sh /etc/ion_env_setup.sh
RUN touch .bash_history

RUN apt-get -y install htop glances

RUN if [[ -x which gem ]]; then gem uninstall sass; fi
RUN if [[ -x which gem ]]; then apt-get uninstall ruby-dev; fi

RUN cd intranet

RUN mkdir -p uploads