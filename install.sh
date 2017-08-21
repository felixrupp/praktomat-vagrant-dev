#!/usr/bin/env sh

sudo apt-get update;
sudo apt-get upgrade;
sudo apt-get install --assume-yes libpq-dev zlib1g-dev libmysqlclient-dev libsasl2-dev libssl-dev swig libapache2-mod-xsendfile libapache2-mod-wsgi git-core default-jdk junit junit4 dejagnu gcj-jdk;
sudo apt-get install --assume-yes python2.7-dev python-setuptools python-psycopg2 python-m2crypto python-virtualenv;

cat << 'EOF' | sudo tee /usr/local/bin/startPraktomat
#!/usr/bin/env sh
/home/vagrant/env/bin/python /home/vagrant/Praktomat/src/manage-devel.py runserver 0.0.0.0:8000;
EOF

sudo chmod +x /usr/local/bin/startPraktomat;

cd /home/vagrant/;
git clone --recursive git://github.com/KITPraktomatTeam/Praktomat.git;
virtualenv --system-site-packages env/;
./env/bin/pip install -r ./Praktomat/requirements.txt;
wget https://github.com/jplag/jplag/releases/download/v2.11.9-SNAPSHOT/jplag-2.11.9-SNAPSHOT-jar-with-dependencies.jar;
sudo mv jplag-2.11.9-SNAPSHOT-jar-with-dependencies.jar /usr/local/bin/jplag.jar;

mkdir Praktomat/data;
./env/bin/python ./Praktomat/src/manage-devel.py migrate --noinput;

echo "Provisioning finished. Please create the first superuser with '/home/vagrant/env/bin/python /home/vagrant/Praktomat/src/manage-devel.py createsuperuser'. To use jPlag add 'JPLAGJAR = /full/path/to/jplag.jar' to the Django Admin Settings in Praktomat.";