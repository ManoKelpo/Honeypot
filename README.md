# Honeypot
This project consists of a honeypot that simulates an FTP server on port 21 and logs all activities performed by potential attackers. The honeypot can also be ran in a Docker container, making deployment and execution simple and isolated from the host system.


### Prerequisites:
* Docker installed on your machine, if you prefer the docker installation. You can download and follow the installation instructions here: [Get-Docker](https://docs.docker.com/get-docker/).


&nbsp;
## Installation: 
### METHOD 1 - Docker  (recommended)
0. Install Docker:
   [Get-Docker](https://docs.docker.com/get-docker/).
1. Pull the image from dockerhub:
   `docker pull raykelp/honeypot`
2. Run the container:     
  $`sudo docker run --rm -it -p 21:21 --name honeypot raykelp/honeypot`
3. (OPTIONAL) Add the variable to .bashrc to run anywhere using :    
  $`echo "alias honeypot='sudo docker run --rm -it -p 2121:21 --name honeypot raykelp/honeypot:1.0'" >> ~/.bashrc` (or `.zshrc`)
4. Restart bash by closing and opening the terminal or by running $`bash` to launch it again.
5. Run $`honeypot`


&nbsp;
### METHOD 2 - Shell script
1. Clone the repo:
   $`https://github.com/ManoKelpo/Honeypot-Docker.git`
2. Inside of it, give the script permission to run:
   $`sudo chmod 775 honeypot.sh`
3. Run:
   $`honeypot.sh`


&nbsp;
### Testing:
After running the script, or the container, you will know the server it's up when it shows an "Listening..." message.
You can test if its working by connecting to it using Netcat `nc`:
$`nc <local IP> 21`
   

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
* Copying files remote > host: $`docker cp container:/root/file.log ./file.log`
* Copying files host > remote $`docker cp ./file container:/root/file`
(Remember to differentiate the image from the container - A Docker image is a static, standalone package with application code and dependencies, while a Docker container is a running instance of the image, including the executable environment.)
  
&nbsp;
### Can't quit, what to do?
It can happen sometimes that you'll not be able to quit the container using ´ctrl-c´, this is due to the container not handling the SIGNIT command properly.
If this happens, there are some alternatives you can use to close the container:   
* Send to background, foreground, then ctrl-c:   
    `ctrl-z` > $`fg` > `ctrl-c`
  
* Send to background and kill the process:   
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


