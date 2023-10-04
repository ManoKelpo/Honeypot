# Honeypot Docker
This project consists of a Docker honeypot that simulates an FTP server on port 21 and logs all activities performed by potential attackers. The honeypot runs in a Docker container, making deployment and execution simple and isolated from the host system.

&nbsp;
### Prerequisites:
* Docker installed on your machine. You can download and follow the installation instructions here: [Get-Docker](https://docs.docker.com/get-docker/).
  
&nbsp;
### Usage:
1. Clone the repo:  
$`https://github.com/ManoKelpo/Honeypot-Docker.git`
3. Build the image:   
$`sudo docker build -t honeypot ./`
4. Run the container:  
$`sudo docker run --rm -it -p 2121:21 --name honeypot honeypot`
5. When it shows the "Listening on ..." message, it's time to test:  
$`nc <local IP> 2121`

&nbsp;
### Quick launch using variable:
If you wanna launch the honeypot using a quick variable,just add an alias at the end of your `~/.bashrc` file (or `~/.zshrc`). 
1. Build the image if you still haven't:   
      $`sudo docker build -t honeypot /home/kali/desec/Swiss-Army-Knife/Honeypot/`
2. Add the variable to .bashrc:   
      $`echo "alias honeypot='sudo docker run --rm -it -p 2121:21 --name honeypot honeypot'" >> ~/.bashrc`
3. Launch it (in another terminal, as it will make your actual one useless):  
      $`honeypot`
   
&nbsp;
### Copy log file:
1.  $`docker cp honeypot:/honeypot.log ./honeypot.log`

&nbsp;
### Redirect output to a file:
Just use `>> file.txt` after the command.
1. $`sudo docker run --rm -it -p 2121:21 --name honeypot honeypot >> honeypot.txt`

&nbsp;
### Redirect the output while show real-time prompt:
Use the GNU `tee` utility  
 1. $`sudo docker run --rm -it -p 2121:21 --name honeypot honeypot | tee honeypot.txt`

&nbsp;
### Some Docker utilities:
* List images: $`sudo docker image ls`
* Remove image: $`sudo docker rmi honeypot -f`
* Remove trash: $`sudo docker image prune`
* Stop running container: $`sudo docker stop honeypot`
* Remove container: $`sudo docker rm honeypot -f`
* 
&nbsp;
### Can't quit, what to do?
If you can't quit using `ctrl-c`, there are a few alternatives you can tr
* Send to background, foreground, then ctrl-c:   
    `ctrl-z` > $`fg` > `ctrl-c`
  
* Send to background and kill it:   
    `ctrl-z` > $`jobs -a` > $`kill -9 <service_pid_number>`

* Stop the containeer:   
    Open another terminal > $`sudo docker stop honeypot`

* Stop Docker:   
    Open another terminal > $`sudo service stop docker` then wait a few seconds.

* KILL Docker:   
    Open another terminal > $`ps -a` > find com.docker.cli PID number > `sudo kill -a <pid_number>` > wait a few seconds.

* Pull the power cable out.
