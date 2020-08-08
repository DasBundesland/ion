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
RUN bash -c mkvirtualenv --python=python3 ion
RUN bash -c workon ion
RUN touch .bash_history
RUN apt-get -y install htop glances
RUN if [[ -x which gem ]]; then gem uninstall sass; fi
RUN if [[ -x which gem ]]; then apt-get uninstall ruby-dev; fi
RUN apt-get -y install sass
RUN bash -c "master_pwd='swordfish'"
RUN bash -c "master_pwd_hash='master_pwd_hash=\'pbkdf2_sha256$15000$GrqEVqNcFQmM$V55xZbQkVANeKb9BPaAV3vENYVd6yadJ5fjsbWnFpo0=\'"
RUN bash -c echo -e "\n# \"$master_pwd\"\nMASTER_PASSWORD = \"$master_pwd_hash\"" > /usr/src/intranet/intranet/settings/secret.py
RUN cd intranet
RUN mkdir -p uploads
