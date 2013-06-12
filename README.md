CHEF-3029 Cookbook
==================

This is a cookbook for testing the following Opscode ticket:

* [CHEF-3029: ifconfig provider for debian/ubuntu platforms](http://tickets.opscode.com/browse/CHEF-3029)

It tests the `ifconfig` resource against `Debian` and `Ubuntu` using [test-kitchen](https://github.com/opscode/test-kitchen).

The vagrant boxes are publicly downloadable, see the [kitchen.yml](https://github.com/onddo/chef3029-cookbook/tree/master/.kitchen.yml) file. This boxes have a **non-stable version of Chef** 11.4.0 from [the last Pull Request on the ticket](https://github.com/btm/chef/pull/1) (2013-05-24).

Tested Platforms
----------------

This version of Chef has been tested in the following platforms using this cookbook:

* Debian 6.0.7 (`ifconfig` resource NOT supported)
* Debian 7.0.0
* Ubuntu 10.04 (`ifconfig` resource NOT supported)
* Ubuntu 11.10
* CentOS 6.4

It is recommended to look at [the used recipe](https://github.com/onddo/chef3029-cookbook/tree/master/recipes/default.rb) and the [tests](https://github.com/onddo/chef3029-cookbook/tree/master/test/integration/default/bats/).

Requirements
------------

`nil`

Usage
-----

This cookbook is aimed to be used with `test-kitchen` for testing the `ifconfig` resource.

```bash
$ kitchen list
Instance                   Last Action
default-debian6-chef3029   <Not Created>
default-debian7-chef3029   <Not Created>
default-ubuntu10-chef3029  <Not Created>
default-ubuntu11-chef3029  <Not Created>
default-centos6-chef3029   <Not Created>
```

```bash
$ kitchen verify
-----> Starting Kitchen (v1.0.0.alpha.7)
# [...]
```

```bash
Instance                   Last Action
default-debian6-chef3029   Verified
default-debian7-chef3029   Verified
default-ubuntu10-chef3029  Verified
default-ubuntu11-chef3029  Verified
default-centos6-chef3029   Verified
```

Contributing
============

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github


License and Author
=====================

|                      |                                          |
|:---------------------|:-----------------------------------------|
| **Author:**          | Xabier de Zuazo (<xabier@onddo.com>)
| **Copyright:**       | Copyright (c) 2013 Onddo Labs, SL. (www.onddo.com)
| **License:**         | Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

