# installs and configures an Nginx server & performs a 301 redirect when querying /redirect_me
exec { 'update_packages':
  command => 'apt-get update',
}

package { 'nginx':
  ensure  => installed,
}

file { '/var/www/html/index.nginx-debian.html':
  content => 'Hello World!',
}

exec {'redirect_me':
  command  => 'sed -i "24i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
}

service { 'nginx':
  ensure  => running,
}
