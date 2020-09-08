
# Welcome

![Bayport](/Bayport_Logo.png)

Welcome to Bayport's DevOps skills assessment.
Please fork this repository and answer any questions on this markdown document.

# Linux
* What is the command to list the contents of a direcory, line by line and ordered by size ascending in human readable format?
#### ls -lsh
* How would you add a DNS server to a network interface in Linux?
#### I will configure by running nmtui and navigate to the interface and set the dns or edit /etc/resolve.conf
* If the DNS server you've just added is not reachable, how can you get any particular hostname to resolve locally? 
#### I can resolve hostname locally by adding and entry in the host file  /etc/hosts
* How would you check for SELinux related errors?
#### error can be seen in /var/log/messages
* Write the commands to add 30GB disk space to a logical volume named "docker" that belongs to a logical group named "docker-group".
####  Create new partition using fdisk utility
####  fdisk /dev/sdb
####  p
####  n
####  Enter at for partion and last to use the full size or specify +30G
####  partprobe
####  pvcreate /dev/sdb1
####  vgs
####  lvextend -l +100%FREE -r /dev/mapper/docker-group /dev/sdb1
* In the root of this repository, create a Bash script called "listit.sh", when executed, this script must do the following (in order):
    * Create a file called directories.list that contains the directory names only of the current directory.
    * Add a line at the beginning of the directories.list file that reads "line one's line".
    * Output the first three lines of directories.list on the console.
    * Accept an integer parameter when executed and repeat the previous question's output x amount of times based on the parameter provided at execution.
* Commit and push your changes.

# Docker
* In the root of this repository, create a Dockerfile that is based on the latest mariadb image.
    * Expose port 3307.
    * Define an evironment variable called BRUCE with a value of WAYNE.
    * Run a command that will output the value from BRUCE into a file called BATCAVE in the root directory of the container. 
* Create a Bash script in the root of this repository called FLY.sh that will do the following:
    * Install Docker if it is not yet installed.
    * Ensure the installed version of Docker is the latest version available.
    * Start a container using the image you've craeted above with your Dockerfile - this container must run as follows:
        * It must be named ALFRED.
        * It must mount /var/lib/mysql to the host operating system to /var/lib/mysql.
        * It must mount /BATCAVE to the host operating system.
    * Checks whether a container exists called ALFRED and if it does, removes an recreates it.
    * Create a schema in the database called "wayneindustries" with one table in it called "fox" with columns "ID" and "Name".
    * Insert an entry with ID "50" and Name "BATMOBILE".
* Create an encrypted file called "secret" in the root of this repository that contains the root password of the database (the password must be "thisisadatabasepassword123456789!").
* Change your Bash script to start the conainer using the root password from the "secret" file.
* Commit and push your changes.

# General
* How would you ensure any change made to this Dockerfile is source controlled, approved, tested and deployed. Explain which tools you will use as if this was going into a production environment.
####  I will use a ci/cd pipeline with a devops tool like jenkins or gitlab. I will create branches for different phases for the developement, uat and production. all pull request will have to be approved before it can be merged to the next phase
* Commit and push your changes.
