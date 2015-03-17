FROM node:0.12-slim
MAINTAINER Markus Dulghier <markus@dulghier.com>

COPY run.sh /run.sh
RUN chmod +x /run.sh

ADD https://github.com/hashicorp/envconsul/releases/download/v0.5.0/envconsul_0.5.0_linux_amd64.tar.gz /tmp/envconsul.tar.gz
RUN cd /tmp && \
	gunzip -c /tmp/envconsul.tar.gz | tar -xf - && \
	mv /tmp/envconsul*/envconsul /bin/envconsul && \
	chmod +x /bin/envconsul && \
	rm -rf /tmp/envconsul*

ENTRYPOINT ["/run.sh"]
CMD ["envconsul", "bash"]
