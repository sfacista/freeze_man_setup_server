FreezeMan Server Config
Install everything.
# Clone the repository
git clone https://github.com/c3g/freezeman
cd freezeman
## git submodule update --init --recursive # dont do this

sudo apt-get install libpq-dev

# Forget about the git subprocess update --init --recurisve command in /backend
# pg_config is required to build psycopg2 from source.

cd backend # move into backend repository directory
virtualenv -p python3 ./env
source env/bin/activate
pip install psycopg2-binary
pip3 install -r requirements.txt

sudo apt-get install postgresql-server-dev-14

#none of the subrepos got installed
#manually install
rm /home/ubuntu/freezeman/backend/dependencies/pg_fzy; 
cd /home/ubuntu/freezeman/backend/dependencies/;
git clone https://github.com/romgrk/pg_fzy.git
cd /home/ubuntu/freezeman/backend/dependencies/pg_fzy;
git clone https://github.com/romgrk/fzy-lua-native.git
mkdir fzy_native; cp -r ./fzy-lua-native/* fzy_native/
make
sudo make install
cd /home/ubuntu/freezeman/backend/;
python ./manage.py migrate



## front end install
cd ~/freezeman
sudo apt install npm
