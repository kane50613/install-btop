#!/bin/bash

package_manager=''
package_managers=("yum" "dnf" "pacman" "apt" "nix")

declare -A package_manager_commands
package_manager_commands=(
  ["yum"]="yum install -y"
  ["dnf"]="dnf install -y"
  ["pacman"]="pacman --noconfirm -S"
  ["apt"]="apt install -y"
  ["nix"]="nix-env -i"
)

for i in "${package_managers[@]}"
do
  if which $i &> /dev/null; then
    package_manager=$i
    break
  fi
done

if [ -z $package_manager ]; then
  echo "No package manager found"
  exit 1
else
  command=${package_manager_commands[$package_manager]}
fi

sudo $command btop

if [ $? -eq 0 ]; then
  exit 0
fi

sudo $command bzip2 make curl

curl -Lo btop.tbz https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz

mkdir btop
tar -xjf btop.tbz -C btop

rm btop.tbz

cd btop/btop

./install.sh
./setuid.sh

cd ../..
rm -rf btop
