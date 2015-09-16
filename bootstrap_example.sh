
PROJECT_NAME=projectName

GITDIR="/tmp/git"

mkdir -p $GITDIR
cd $GITDIR

yum install -y git

git clone https://github.com/wvulibraries/vagrantHydraStack.git
git clone https://github.com/wvulibraries/hydraSetup.git

cd vagrantHydraStack
bash $GITDIR/vagrantHydraStack/install.sh env

echo "RAILS_ENV=development" >> /etc/environment
echo "PROJECT_NAME=$PROJECT_NAME" >> /etc/environment

source /etc/environment

mkdir -p $HYDRA_INSTALL_DIR
cp $GITDIR/vagrantHydraStack/install/* $HYDRA_INSTALL_DIR
cp $GITDIR/vagrantHydraStack/install.sh $HYDRA_STACK_DIR

cd $HYDRA_STACK_DIR

bash install.sh base
bash install.sh mysql
bash install.sh httpd
bash install.sh ruby
bash install.sh rails
bash install.sh passenger

if [  -d "/vagrant/iai" ]
then
	cd /vagrant/iai
 	bundle install
	rake db:migrate RAILS_ENV=development
	rails s -b 0.0.0.0
else 

	cp $GITDIR/hydraSetup/*.sh /vagrant/
	chmod a+x /vagrant/*.sh

	su vagrant
	cd /vagrant

	bash hydra-setup.sh
	bash template-setup.sh
	
	rm hydra-setup.sh
	rm template-setup.sh

fi
