cat << _EOF_ > /etc/apt/sources.list.d/webupd8team-java.list
deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
_EOF_

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
apt-get update
# - Accept the license: https://github.com/Fourdee/DietPi/issues/298
debconf-set-selections <<< "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true"
apt-get install -y oracle-java8-installer

mkdir -p /etc/jdownloader
wget http://installer.jdownloader.org/JDownloader.jar -O /etc/jdownloader/JDownloader.jar

# Update JDownloader
java -Djava.awt.headless=true -jar /etc/jdownloader/JDownloader.jar -norestart

# - USER input | goto https://my.jdownloader.org and register an account

#1st run, user enter http://my.jdownloader.com login details
java -Djava.awt.headless=true -jar /etc/jdownloader/JDownloader.jar

# - Press CTRL+C to exit.

java -Djava.awt.headless=true -jar /etc/jdownloader/JDownloader.jar &> /var/log/jdownloader.log &
