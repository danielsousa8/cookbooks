default['filebeat']['path.yml'] = '/etc/filebeat/filebeat.yml'
default['filebeat']['apt']['uri'] = 'https://artifacts.elastic.co/packages/5.x/apt'
default['filebeat']['apt']['key'] = 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
default['filebeat']['apt']['components'] = ['stable','main']
default['filebeat']['apt']['distribution'] = ''
default['filebeat']['apt']['action'] = :add
