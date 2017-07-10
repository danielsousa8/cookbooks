elasticsearch_install 'elastic' do
  type 'package'
  version "5.5.0"
  action :install
end
