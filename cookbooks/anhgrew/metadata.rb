name 'anhgrew'
maintainer 'Anhgrew'
maintainer_email 'nguyenanhdevops@gmail.com'
license 'Apache-2.0'
description 'Installs/configures a simple web site using the Nginx web server'
long_description IO.read("#{File.dirname(__FILE__)}/README.md")
version '0.1.0'
chef_version '>= 16.0'


depends 'git', '~>0.1.0'
depends 'chef-workstation', '~>0.1.0'
depends 'atom', '~>0.1.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/anhgrew/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/anhgrew'
