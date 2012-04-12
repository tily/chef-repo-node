package "stunnel"

service "stunnel4" do
  supports :status => true, :restart => true, :reload => true
  action [ :nothing ]
end

bash "Create SSL Certificates" do
  # Steps
  # =====
  #   1) Create an SSL private key.
  #   2) Create certificate signing request (CSR).
  #   3) Creates pem file.
  #
  # @param node[:fqdn]: The hostname or fqdn of the server.
  # @param node[:stunnel][:server_ssl_req]
  
  cwd "/etc/ssl"
  code <<-EOH
  umask 077
  openssl genrsa 2048 > private/#{node[:fqdn]}.key
  openssl req -subj "#{node[:stunnel][:server_ssl_req]}" -new -x509 -nodes -sha1 -days 3650 -key private/#{node[:fqdn]}.key > certs/#{node[:fqdn]}.crt
  cat private/#{node[:fqdn]}.key certs/#{node[:fqdn]}.crt > certs/stunnel.pem
  EOH
  not_if { File.exists?("/etc/ssl/certs/stunnel.pem") }
end

bash "Enabling stunnel" do
  code <<-EOH
  echo ENABLED=1 >> /etc/default/stunnel4
  EOH
  notifies :start, resources(:service => "stunnel4")
end