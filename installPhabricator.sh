#/bin/bash

HAVEPCNTL=`php -r "echo extension_loaded('pcntl');"`
if [ $HAVEPCNTL != "1" ]
then
  echo "Installing pcntl...";
  echo
  apt-get source php5
  PHP5=`ls -1F | grep '^php5-.*/$'`
  (cd $PHP5/ext/pcntl && phpize && ./configure && make && sudo make install)
else
  echo "pcntl already installed";
fi

if [ ! -e libphutil ]
then
  git clone git://github.com/facebook/libphutil.git
else
  (cd libphutil && git pull --rebase)
fi

if [ ! -e arcanist ]
then
  git clone git://github.com/facebook/arcanist.git
else
  (cd arcanist && git pull --rebase)
fi

if [ ! -e phabricator ]
then
  git clone git://github.com/facebook/phabricator.git
else
  (cd phabricator && git pull --rebase)
fi

cd /opt/phabricator && ./bin/storage upgrade --force

