# SEE ALSO: https://github.com/digitalbutter/cookbook-node/blob/master/providers/server.rb
action :install do
  template "/etc/init.d/forever-#{new_resource.name}" do
    source "initscript.erb"
    mode 0755
    variables(
      :name => new_resource.name,
      :script_dir => new_resource.script_dir,
      :script_file => new_resource.script_file,
      :user => new_resource.user,
      :args => new_resource.args
    )
  end
end

[:start, :stop, :restart, :enable, :disable].each do |x|
  action x do
    service "forever-#{new_resource.name}" do
      provider Chef::Provider::Service::Init
      action x
    end
  end
end
