# Docker Honeypot Project
This project consists of a Docker honeypot that simulates an FTP server on port 21 and logs all activities performed by potential attackers. The honeypot runs in a Docker container, making deployment and execution simple and isolated from the host system.

### Prerequisites:
* Docker installed on your machine. You can download and follow the installation instructions here: [Get-Docker](https://docs.docker.com/get-docker/).

### Usage:
1. Clone the repo- 
`https://github.com/ManoKelpo/Honeypot-Docker.git`
3. Build the image -  
`sudo docker build -t honeypot ./`
4. Run the container - 
`sudo docker run --rm -it -p 2121:21 --name honeypot honeypot`
5. When it shows the "Listening on ..." message, it's time to test
`nc <local IP> 2121`

### Copy log file:
* `docker cp honeypot:/honeypot.log ./honeypot.log`

### Redirect output:
* You can also redirect the honeypot's output to a local file using the >> operator, for example:
`sudo docker run --rm -it -p 2121:21 --name honeypot honeypot >> honeypot.txt`
* Or if you want to see the prompt in real-time while redirecting the output to a file, use the `tee` command:
`sudo docker run --rm -it -p 2121:21 --name honeypot honeypot | tee honeypot.txt`
