template node['kibana']['path.yml'] do
    source "kibana.erb"
    owner "root"
    group "root"
    mode 0644
    variables({
    	:settings  => node[:kibana][:settings]
    })
end
