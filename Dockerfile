# Use an official OCaml image as a parent image
FROM ocaml/opam:debian-ocaml-5.0

# Set the working directory
WORKDIR /home/opam/project

# Copy the current directory contents into the container
COPY . /home/opam/project

# Install system dependencies (if any)
RUN sudo apt-get update && sudo apt-get install -y pkg-config liblapacke-dev libopenblas-dev zlib1g-dev 

# Install OCaml dependencies
RUN opam install dune owl.1.0.2.

# Specify the command to run on container start
CMD ["bash"]