FROM ubuntu:17.04

# Install packages.
RUN apt-get update  &&  apt-get install -y \
      curl \
      ruby \ 
      ruby-dev \
      git \
      upstart \
      build-essential \
      vim 

RUN gem install berkshelf --no-ri --no-rdoc

# Install chef-solo
RUN curl -L https://www.opscode.com/chef/install.sh | bash

ADD . /chef
RUN berks vendor -b /chef/Berksfile /chef/cookbooks/

# Installing recipes  with chef-solo
RUN chef-solo -c /chef/solo.rb -j /chef/recipes.json

RUN ln -s /etc/elasticsearch/ /usr/share/elasticsearch/config

# Start elasticsearch 
USER elastic

CMD ["/usr/share/elasticsearch/bin/elasticsearch"]

EXPOSE 9200 9300
