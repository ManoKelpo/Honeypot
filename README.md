# Honeypot
This project consists of a honeypot that simulates an FTP server on port 21 and logs all activities performed by potential attackers. The honeypot can also be ran in a Docker container, making deployment and execution simple and isolated from the host system.

&nbsp;
### Prerequisites:
* Docker installed on your machine, if you prefer the docker installation. You can download and follow the installation instructions here: [Get-Docker](https://docs.docker.com/get-docker/).
  
&nbsp;
### Installation - METHOD 1:
1. Clone the repo:
   $`https://github.com/ManoKelpo/Honeypot-Docker.git`
2. Inside of it, give the script permission to run:
   $`sudo chmod 775 honeypot.sh`
3. Run:
   $`honeypot.sh`

### Installation - Docker Method (recommended)
1. Pull the image from dockerhub:    
   `docker pull raykelp/honeypot`
2. Run the container:     
  $`sudo docker run --rm -it -p 21:21 --name honeypot raykelp/honeypot`
3. (OPTIONAL) Add the variable to .bashrc to run anywhere using :    
  $`echo "alias honeypot='sudo docker run --rm -it -p 2121:21 --name honeypot raykelp/honeypot:1.0'" >> ~/.bashrc` (or `.zshrc`)
4. Reboot with $`reboot` or run bash again with $`bash`
5. Run $`honeypot`

&nbsp;
### Usage:
5. Run the container
$`honeypot` OR $`sudo docker run --rm -it -p 2121:21 --name honeypot honeypot` - if you installed through docker pull replace the last "honeypot" with `raykelp/honeypot:1.0`
7. When it shows the "Listening on ..." message, it's time to test:  
$`nc <local IP> 2121`
   
&nbsp;

### Copy log file:
1.  $`docker cp honeypot:/honeypot.log ./honeypot.log`

&nbsp;
### Redirecting the output to a file:
You can use `>> file.txt` after the command.
* $`./honeypot.sh >> log.txt`
* * $`honeypot >> log.txt` - Docker method.

If you still want to see the real-time prompt while redirecting the output, use the `Tee` utility from GNU:
* $`./honeypot.sh | tee log.txt`
* $`honeypot | tee log.txt` - Docker method.


&nbsp;
### Some Docker utilities:
* List images: $`sudo docker image ls`
* Remove image: $`sudo docker rmi raykelp/honeypot -f`
* Remove trash: $`sudo docker image prune`
* Stop running container: $`sudo docker stop honeypot`
* Remove container: $`sudo docker rm honeypot -f`
(Remember to differentiate the image from the container - A Docker image is a static, standalone package with application code and dependencies, while a Docker container is a running instance of the image, including the executable environment.)
  
&nbsp;
### Can't quit, what to do?
It can happen sometimes that will not be able to quit the container with ´ctrl-c´, due to docker not handling correctly the SIGNIT command.
If this happens, there are some alternatives you can use to close the container:   
* Send to background, foreground, then ctrl-c:   
    `ctrl-z` > $`fg` > `ctrl-c`
  
* Send to background and kill it:   
    `ctrl-z` > $`jobs -a` > $`kill -9 <service_pid_number>`

* Stop the container:   
    Open another terminal > $`sudo docker stop honeypot` > wait a few seconds.

* Stop Docker service:   
    Open another terminal > $`sudo service stop docker` > wait a few seconds.

* KILL Docker:   
    Open another terminal > $`ps -a` > find com.docker.cli PID number > `sudo kill -a <pid_number>` > wait a few seconds.

* Logout and login.

* Reboot

* Pull the power cable out.


