case node['redis']['install_type']
when 'package'
  include_recipe 'yum::epel'
  package 'redis'
  service 'redis' do
    action :start
  end
when 'source'
  include_recipe 'redis::source'
else
  Chef::Log.error("install_type must be package or source")
  exit(1)
end