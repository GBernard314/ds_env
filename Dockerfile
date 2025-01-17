# FROM ubuntu:latest

# # Update 
# RUN apt update && apt -y upgrade

# # Install python
# RUN apt install -y python3-minimal python3-pip

# # Install jupyter
# RUN pip3 install jupyter

# CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]

# EXPOSE 8888

# # # FROM =>Select a base image
# # FROM ubuntu:latest

# # # RUN =>Call a command
# # # apt-Upgrade get and install the required packages
# # RUN apt-get update
# # RUN apt-get install -y \
# #     wget \ 
# #     vim

# # #　WORKDIR =>Create and move an arbitrary directory directly under the root on the container side
# # WORKDIR /opt

# # #Install anaconda3 and delete the original executable file
# # #　wget =>Specify the URL to download the file
# # #　sh =>Run a shell script
# # #　-b =>Avoid interactive operations
# # #  -p =>Specify the installation destination
# # #  rm =>Delete the specified file
# # #  -f =>Forcibly execute
# # RUN wget https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh && \
# #     sh /opt/Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
# #     rm -f Anaconda3-2019.10-Linux-x86_64.sh

# # #PATH of anaconda3
# # #  ENV =>Change environment variables
# # ENV PATH /opt/anaconda3/bin:$PATH

# # #pip upgrade
# # RUN pip install --upgrade pip

# # #Return directly under root
# # WORKDIR /

# # CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]

# FROM =>Select a base image
FROM ubuntu:latest

# RUN =>Call a command
# apt-Upgrade get and install the required packages
RUN apt-get update
RUN apt-get install -y \
    wget \ 
    vim

#　WORKDIR =>Create and move an arbitrary directory directly under the root on the container side
WORKDIR /opt

#Install anaconda3 and delete the original executable file
#　wget =>Specify the URL to download the file
#　sh =>Run a shell script
#　-b =>Avoid interactive operations
#  -p =>Specify the installation destination
#  rm =>Delete the specified file
#  -f =>Forcibly execute
RUN wget https://repo.continuum.io/archive/Anaconda3-2019.10-Linux-x86_64.sh && \
    sh /opt/Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm -f Anaconda3-2019.10-Linux-x86_64.sh

#PATH of anaconda3
#  ENV =>Change environment variables
ENV PATH /opt/anaconda3/bin:$PATH

#pip upgrade
RUN pip install --upgrade pip


#Return directly under root
WORKDIR /

#Open jupyter lab when container starts
#  CMD =>Specify the command to be executed when the container starts
#  "jupyter", "lab" =>Launch jupyter lab
#  "--ip=0.0.0.0" =>Remove ip restrictions
#  "--allow-root" =>Allow root user, not good for security
#  "LabApp.token=''" = >It can be started without a token. Not good for security
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]