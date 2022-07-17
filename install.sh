# check if curl installed first
sudo apt install curl

# download pre-built btop files
curl -o btop.tbz https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz

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