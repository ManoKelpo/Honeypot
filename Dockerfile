FROM ubuntu


## Expose the port in the container
EXPOSE 21

## Container's internal port (not the the user will access)
ENV PORT 21

# Message that will be displayed to someone who connects to the server.
# Default message is "220 ProFTPD 1.3.4a Server (UBUNTU)"
ENV BANNER "220 ProFTPD 1.3.4a Server (UBUNTU)"

# Banner
RUN touch /banner.txt
RUN echo $BANNER > banner.txt

# Honeypot assemble
COPY ./honeypot.sh /honeypot.sh
RUN chmod 775 /honeypot.sh


# Packages installation
RUN apt-get update -y && apt-get install -y net-tools netcat ufw 


# Exec in container initialization
ENTRYPOINT ["/honeypot.sh", "21"]
