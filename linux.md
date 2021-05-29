Linux
=======
What is the command to list the contents of a direcory, line by line and ordered by size ascending in human readable format?
`ls -lSrh`

How would you add a DNS server to a network interface in Linux?
`/etc/network/interfaces`

If the DNS server you've just added is not reachable, how can you get any particular hostname to resolve locally?
`Add the hostname to the '/etc/hosts' file`

How would you check for SELinux related errors?
`Check the '/var/log/audit/audit.log' and '/var/log/messages' files or the **journald**`

Write the commands to add 30GB disk space to a logical volume named "docker" that belongs to a logical group named "docker-group".
`lvextend -L+30G docker`