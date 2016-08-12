name             'awesome_customers_rhel'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures awesome_customers_rhel'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'selinux', '~> 0.9.0'
depends 'firewall', '~> 2.4.0'
depends 'httpd', '~>0.3.5'
depends 'mysql', '~>7.0.0'
depends 'mysql_chef_gem', '1.1.0'
depends 'database', '5.1.2'
