FROM ubuntu:17.04

# Install packages.
RUN apt-get update  &&  apt-get install -y \
      curl \
      ruby \ 
      ruby-dev \
      git \
      vim \
      upstart \
      build-essential 

# Install chef-solo
RUN curl -L https://www.opscode.com/chef/install.sh | bash

ADD . /chef

# Installing recipes  with chef-solo
RUN chef-solo -c /chef/solo.rb -j /chef/recipes.json

# Define default command.
CMD ["/usr/share/kibana/bin/kibana"]

EXPOSE 5601
