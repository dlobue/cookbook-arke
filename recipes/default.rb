
package "python-arke" do
    action :upgrade
    notifies :stop, "service[arke]", :immediately
end

directory node.arke.plugin_dir do
    action :create
    mode "0755"
    recursive true
end

template node.arke.config_file do
    source "arke.conf.erb"
    mode 0644
    notifies :stop, "service[arke]", :immediately
end

service "arke" do
    provider Chef::Provider::Service::Upstart
    supports [:status, :restart, :reload]
    action node.arke.service_action
end


