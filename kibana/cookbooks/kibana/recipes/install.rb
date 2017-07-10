apt_package 'apt-transport-https' do
        action :install
end

# !!!!! INFORMACAO !!!! 

#O Campo distribution deixei vazio, pois por default o apt_repository adiciona a release da distribuicao , e isso causa problemas na instalacao do Kibana.

apt_repository 'kibana' do
  uri         'https://artifacts.elastic.co/packages/5.x/apt'
  key         'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  distribution ''
  components  ['stable' , 'main']
  action :add
end

package ['kibana']  do
  action :install
end
