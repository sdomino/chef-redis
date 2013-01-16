case node['redis']['install_type']
when 'package'
  package "redis-server"
  service "redis-server" do
    action [:enable, :start]
  end
when 'source'
  include_recipe 'redis::source'
else
  Chef::Log.error("install_type must be package or source")
  exit(1)
end