ABSTRACT
========

This is a repository of chef that is aimed at node.js production environment, planning to support various requirements specific to node.js or socket.io webapps.

 * nginx, patched with tcp_proxy_module (<https://github.com/yaoweibin/nginx_tcp_proxy_module>)
 * Stunnel + HAProxy (<http://blog.mixu.net/2011/08/13/nginx-websockets-ssl-and-socket-io-deployment/>)
 * node-http-proxy (<https://github.com/nodejitsu/node-http-proxy>)
 * forever (https://github.com/nodejitsu/forever)
 * basic node.js webapp deployment

TODO
====

 * redis
 * mongodb

SEE ALSO
========

See https://github.com/opscode/chef-repo/blob/master/README.md for chef-repo document.

Other references:
 * forever init script (<http://www.exratione.com/2011/07/running-a-nodejs-server-as-a-service-using-forever.php>)
 * recipe[node_server], recipe[node_npm] (<https://github.com/digitalbutter/cookbook-node>)
 * recipe[npm_package] (knife site install npm, <https://github.com/balbeko/chef-npm>)
