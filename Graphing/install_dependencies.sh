sudo apt-get -y update

#base python and pip
sudo apt install python3
sudo apt-get install python3-pip
#Install Pandas
#```bash
sudo pip install pandas

#libs - Plotly and Matplotlib
sudo pip install plotly
sudo pip install matplotlib

# dynamic graph dependency (Tkinker)
sudo apt-get install python-tk

# Install Orca dependcies and Orca(needed for image exports)
sudo pip install psutil
sudo pip install requests
sudo apt install npm
sudo npm install -g electron@1.8.4 orca

# Additional dependencies that may be needed incase you are on a 64bit machine with 32-bit software
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module
sudo apt install libgconf-2-4