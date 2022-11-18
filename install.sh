# check if wget & make installed first
sudo apt update
sudo apt install bzip2 make wget -y

# download pre-built btop files
wget -O btop.tbz https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz

# create a directory and decompress
mkdir btop
tar -xjf btop.tbz -C btop

# remove file
rm btop.tbz

# switch to btop directory
cd btop

# run install script
./install.sh
./setuid.sh

cd ..
rm -rf btop