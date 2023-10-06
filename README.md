# Honeypot
This project consists of a honeypot that simulates an FTP server on port 21 and logs all activities performed by potential attackers. The honeypot can also be ran in a Docker container, making deployment and execution simple and isolated from the host system.


### Prerequisites:
* Docker installed on your machine, if you prefer the docker installation. You can download and follow the installation instructions here: [Get-Docker](https://docs.docker.com/get-docker/).


&nbsp;
### Installation: 
Docker method (recommended):
```
 docker pull raykelp/honeypot
 sudo docker run --rm -it -p 21:21 --name honeypot raykelp/honeypot 
 echo "alias honeypot='sudo docker run --rm -it -p 2121:21 --name honeypot raykelp/honeypot:1.0'" >> ~/.bashrc
 honeypot
```
Manual shell script method:
```
 git clone https://github.com/ManoKelpo/Honeypot.git
 cd Honeypot
 sudo chmod 775 honeypot.sh
 echo "alias honeypot='(pwd)/honeypot.sh'" >> ~/.bashrc
 ./honeypot.sh
```

&nbsp;
### Testing:
You'll know the server is up when it shows an "Listening \<ip\>..." message.
Then you can test:
```
  nc <local IP> 21
```


&nbsp;
### Redirecting the output to a file:
It's recommended to use the `>>` operator to redirect the output to a log file.
* ```  honeypot >> log.txt```

If you still want to see the real-time prompt while redirecting the output, use the `Tee` utility from GNU:
```
	  honeypot.sh | tee log.txt
```

&nbsp;
### Some Docker utilities:
* List images: ` sudo docker image ls`
* Remove image: ` sudo docker rmi raykelp/honeypot -f`
* Remove trash: ` sudo docker image prune`
* Stop running container: ` sudo docker stop honeypot`
* Remove container: ` sudo docker rm honeypot -f`
* Copying files remote to host: ` docker cp container:/root/file.log ./file.log`
* Copying files host to remote ` docker cp ./file container:/root/file`
(Remember to differentiate the image from the container - A Docker image is a static, standalone package with application code and dependencies, while a Docker container is a running instance of the image, including the executable environment.)
  
&nbsp;
### Can't quit, what to do?
It can happen sometimes that you'll not be able to quit the container using ´ctrl-c´, this is due to the container not handling the SIGNIT command properly.
If this happens, there are some alternatives you can use to close the container:   

* Send to background, foreground, then ctrl-c:   
    Press `ctrl-z`
    ```
     fg 
    ```
    Press `ctrl-c`
  
* Send to background and kill the process:   
	1. Press  `ctrl-z`
	2. 
	```
	 jobs -a
	 kill -9 <service_pid_number>`
	```

* Stop the container:   
	(In another terminal)
	```
	 sudo docker stop honeypot
	```

* Stop Docker service:   
	(In another terminal)
	```
	 sudo service stop docker
	```
* KILL Docker:   
    (In another terminal)
    ```
     sudo killall docker
   
    ```
* Logout and login.

* Reboot

* Pull the power cable out.


