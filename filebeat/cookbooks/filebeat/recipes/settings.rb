template node['filebeat']['path.yml'] do
    source "filebeat.erb"
    owner "root"
    group "root"
    mode 0644
end
