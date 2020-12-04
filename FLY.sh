# Uninstall older versions of docker
sudo apt-get remove -y docker docker-engine docker.io
sudo apt autoremove -y

# Install dependencies
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add the Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
sudo apt-get update -y

# Install the latest version of Docker
sudo apt-get install -y docker-ce

# Enable the Docker daemon 
sudo systemctl start docker
sudo systemctl enable docker

# Start a container using the local Dockerfile
docker rm -f ALFRED
docker build -t maria:0.1 .
docker run --name ALFRED -v /var/lib/mysql:/var/lib/mysql -v /BATCAVE:/BATCAVE -d maria:0.1

docker exec -it ALFRED mysql -u root -c \
"CREATE OR REPLACE DATABASE wayneindustries;" \
"CREATE TABLE fox (ID INT NOT NULL, Name CHAR(30));" \
"INSERT INTO fox (ID, Name) VALUES(50,'BATMOBILE');"

echo "thisisadatabasepassword123456789!" | base64 > secret

docker run --name ALFRED -v /var/lib/mysql:/var/lib/mysql -v /BATCAVE:/BATCAVE -e MYSQL_ROOT_PASSWORD_FILE=/secret -d maria:0.1
