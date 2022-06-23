# Install package(s)
sudo apt -y install qemu-kvm

# Signal start
echo "Starting..."

# Get package
wget "https://fs.devloop.org.uk/filesystems/Debian-Jessie/Debian-Jessie-AMD64-root_fs.bz2"

# Unzip
bunzip2 Debian-Jessie-AMD64-root_fs.bz2

# Create Image
qemu-img create -f qcow2 Image.img 4G

# Run system
kvm -nographic -m 512 -kernel ./Image.img -drive file=./Debian-Jessie-AMD64-root_fs,if=ide -append "root=/dev/sda earlyprintk=serial,ttyS0,9600 console=ttyS0,9600n8"

# Signal end
echo "Hello world!"
