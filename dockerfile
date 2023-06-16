# Comment:

# Download Ubuntu
FROM ubuntu:latest
RUN apt update
RUN apt install -y build-essential 



# Creata a folder in home folder
RUN mkdir -p /home/parallel

# Copy the exe & txt inside the image
COPY parallelmain.cc /home/parallel
COPY serialmain.cc /home/parallel
COPY generated.txt /home/parallel

# Run the app
RUN g++ -o  /home/parallel/serialmain -fopenmp /home/parallel/serialmain.cc
RUN g++ -o /home/parallel/parallelmain -fopenmp /home/parallel/parallelmain.cc
CMD /home/parallel/serialmain
CMD /home/parallel/parallelmain
