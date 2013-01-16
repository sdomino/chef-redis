execute 'download redis stable' do
  command 'wget http://download.redis.io/redis-stable.tar.gz'
end

execute 'unpack redis stable' do
  command 'tar xvzf redis-stable.tar.gz'
end

execute 'make redis stable' do
  cwd '/redis-stable'
  command 'make'
end

service "redis-server" do
  action [:enable, :start]
end