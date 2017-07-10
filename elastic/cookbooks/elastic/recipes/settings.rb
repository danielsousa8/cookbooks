elasticsearch_user 'elastic' do
  action :create
end

elasticsearch_configure 'elastic' do
   allocated_memory '512m'
   configuration ({
     'http.port' => 9200,
     'cluster.name' => 'Elasticsearch-logs',
     'node.name' => 'elastic01',
     'network.host' => '0.0.0.0'
   })
end
