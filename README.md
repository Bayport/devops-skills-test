
# Welcome

![Bayport](/Bayport_Logo.png)

Welcome to Bayport's DevOps skills assessment.
Please fork this repository and answer any questions on this markdown document.

# Linux
* What is the command to list the contents of a direcory, line by line and ordered by size ascending in human readable format?
		ls -laS


* How would you add a DNS server to a network interface in Linux?

		
		
* If the DNS server you've just added is not reachable, how can you get any particular hostname to resolve locally? 

		

* How would you check for SELinux related errors?
		 cat /var/log/audit/audit.log |grep Error


* Write the commands to add 30GB disk space to a logical volume named "docker" that belongs to a logical group named "docker-group".
		Extend the Logical Volume using the below:
		lvextend -L +30G /docker/docker-group
		
		Expand the filesystem using the below:
		resize2fs /docker/docker-group

* In the root of this repository, create a Bash script called "listit.sh", when executed, this script must do the following (in order):
    * Create a file called directories.list that contains the directory names only of the current directory.
    * Add a line at the beginning of the directories.list file that reads "line one's line".
    * Output the first three lines of directories.list on the console.
    * Accept an integer parameter when executed and repeat the previous question's output x amount of times based on the parameter provided at execution.
* Commit and push your changes.


#!/bin/bash

ls -d */ > directories.list
sed -i "1 i\line one's line" directories.list
head -3 directories.list

echo -n "Enter a number: "
read num1

if ! [[ "$num1" =~ ^[0-9]+$ ]] ; then
    echo "Thas's not a number"
    exit 1
fi
i=1
while [ $i -le 4 ]
do
  echo $num1
  i=$(( $i +1 ))
done



# Docker
* In the root of this repository, create a Dockerfile that is based on the latest mariadb image.
    * Expose port 3307.
    * Define an evironment variable called BRUCE with a value of WAYNE.	
    * Run a command that will output the value from BRUCE into a file called BATCAVE in the root directory of the container. 
	
	FROM mariadb:latest
	EXPOSE 3307
	ENV BRUCE=WAYNE
	RUN echo "$(BRUCE) > /root/BATCAVE"

	
	
* Create a Bash script in the root of this repository called FLY.sh that will do the following:
    * Install Docker if it is not yet installed.
    * Ensure the installed version of Docker is the latest version available.
	
			
#!/bin/bash
yum install -y yum-utils device-mapper-persistent-data lvm2

echo "Updating and installing Docker"
yum-config-manager   --add-repo  https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce

echo "Starting and enabling Docker"
systemctl start docker
systemctl enable docker

echo "Creating database container "

docker build -t alfred .

docker run -d -p 3307:3307 --restart always --name ALFRED -v /var/lib/mysql:/var/lib/mysql alfred

result=$( docker ps -a |grep documentsrv_test  )

if [[ -n "$result" ]]; then
  echo "removing container"
  docker rm -f ALFRED
  sleep 3

  docker run -d -p 3307:3307 --restart always --name ALFRED -v /var/lib/mysql:/var/lib/mysql alfred
else
  echo "No such container"
fi

docker exec -it ALFRED mysql -u root -e "$(cat ./db.sql)"



	
    * Start a container using the image you've craeted above with your Dockerfile - this container must run as follows:
        * It must be named ALFRED.
        * It must mount /var/lib/mysql to the host operating system to /var/lib/mysql.
        * It must mount /BATCAVE to the host operating system.
    * Checks whether a container exists called ALFRED and if it does, removes an recreates it.
    * Create a schema in the database called "wayneindustries" with one table in it called "fox" with columns "ID" and "Name".
    * Insert an entry with ID "50" and Name "BATMOBILE".
	
	CREATE DATABASE wayneindustries;

	USE wayneindustries;

	CREATE TABLE fox (ID INT NOT NULL, Name VARCHAR(40));

	INSERT INTO fox (ID, Name) VALUES ('50', 'BATMOBILE')
	
	
* Create an encrypted file called "secret" in the root of this repository that contains the root password of the database (the password must be "thisisadatabasepassword123456789!").
* Change your Bash script to start the conainer using the root password from the "secret" file.
* Commit and push your changes.

# General
* How would you ensure any change made to this Dockerfile is source controlled, approved, tested and deployed. Explain which tools you will use as if this was going into a production environment.
* Commit and push your changes.


