FROM ubuntu

## Container's port
## (Note that this is not the port you'll aim when connecting to the container's server - that one can be set within the command line in the flag "-p 4040:21" - this way you must aim to the host's 4040 port to connect to the container's server.)
ENV PORT 21

## Message that will be displayed to someone who connects to the server.
## Default message is "220 ProFTPD 1.3.4a Server (UBUNTU)"
ENV BANNER "220 ProFTPD 1.3.4a Server (UBUNTU)"


# Packages installation
RUN apt-get update -y && apt-get install -y net-tools netcat

# Files
RUN touch /honeypot_banner.txt
RUN touch /honeypot.log
RUN touch /honeypot_server.sh
RUN touch /honeypot_init.sh

# Banner
RUN echo $BANNER > honeypot_banner.txt

# Honeypot assemble
RUN chmod 775 /honeypot_server.sh
RUN echo "#! usr/bin/bash" >> /honeypot_server.sh

RUN echo "function ctrl_c()" >> /honeypot_server.sh
RUN echo "{" >> /honeypot_server.sh
RUN echo "echo -e '\nQuitting...'" >> /honeypot_server.sh
RUN echo "exit 1" >> /honeypot_server.sh
RUN echo "}" >> /honeypot_server.sh

RUN echo "\ntrap ctrl_c INT\n" >> /honeypot_server.sh
RUN echo "ifconfig\n" >> /honeypot_server.sh
RUN echo "echo -e 'Initializing server...\n'" >> /honeypot_server.sh

RUN echo "while true; do nc -vnlp $PORT < /honeypot_banner.txt 1>> /honeypot.log 2>> /honeypot.log; echo '^--------'$(date)'--------^\n' >> /honeypot.log; done &" >> /honeypot_server.sh

# Script to exec scripts
RUN chmod 775 /honeypot_init.sh
RUN echo "#! usr/bin/bash" >> /honeypot_init.sh

RUN echo "" >> /honeypot_init.sh
RUN echo "/honeypot_server.sh &" >> /honeypot_init.sh
RUN echo "" >> /honeypot_init.sh
RUN echo "tail -f /honeypot.log" >> /honeypot_init.sh

# Exec in container initialization
#CMD ["/honeypot_init.sh"]
ENTRYPOINT ["bash", "/honeypot_init.sh"]
