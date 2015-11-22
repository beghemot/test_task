FROM ansible/centos7-ansible
#RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
#RUN yum -y install ansible
RUN yum -y install sudo
RUN mkdir /data
COPY ./provision/apache.yml /tmp/
COPY ./provision/docker/inventory /tmp/
COPY ./provision/docker/ansible.cfg /tmp/
COPY ./provision/files/ /tmp/files/
#RUN echo "yopeso ansible_ssh_host=127.0.0.1 ansible_ssh_port=22" > /tmp/inventory
WORKDIR /tmp/
RUN ansible-playbook /tmp/apache.yml -c local
EXPOSE 22 80
ENTRYPOINT ["/usr/sbin/apachectl", "-DFOREGROUND"]
