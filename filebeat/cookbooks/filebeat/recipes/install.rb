package 'apt-transport-https'

apt_repository 'beats' do
   uri node['filebeat']['apt']['uri']
   components node['filebeat']['apt']['components']
   key node['filebeat']['apt']['key']
   distribution node['filebeat']['apt']['distribution']
   action node['filebeat']['apt']['action']
end

package ['filebeat']  do
   action :install
end
