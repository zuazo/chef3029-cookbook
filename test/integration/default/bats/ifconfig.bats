#!/usr/bin/env bats

load test_helper

if has_ifconfig_support
then

  @test "ifconfig should return the correct inet addr" {
    /sbin/ifconfig eth0:1 | grep -F 'inet addr:10.22.33.44'
  }

  @test "ifconfig should return the correct net mask" {
    /sbin/ifconfig eth0:1 | grep -Fw 'Mask:255.255.255.0'
  }

  if is_debian || is_ubuntu
  then
    @test "configuration files should be included from the main file" {
      grep -F 'source /etc/network/interfaces.d/*' '/etc/network/interfaces'
    }
  fi

  @test "the configuration should be persistent" {
    if is_debian || is_ubuntu
    then
      grep -F 'iface eth0:1 inet static' '/etc/network/interfaces.d/ifcfg-eth0:1'
      grep -F 'address 10.22.33.44' '/etc/network/interfaces.d/ifcfg-eth0:1'
      grep -F 'netmask 255.255.255.0' '/etc/network/interfaces.d/ifcfg-eth0:1'
    else
      grep -F 'DEVICE=eth0:1' '/etc/sysconfig/network-scripts/ifcfg-eth0:1'
      grep -F 'IPADDR=10.22.33.44' '/etc/sysconfig/network-scripts/ifcfg-eth0:1'
      grep -F 'NETMASK=255.255.255.0' '/etc/sysconfig/network-scripts/ifcfg-eth0:1'
    fi
  }

else

  @test "ifconfig should NOT return the correct inet addr" {
    /sbin/ifconfig eth0:1 | grep -Fv 'inet addr:10.22.33.44'
  }

  @test "configuration files should NOT be included from the main file" {
    grep -Fv 'source /etc/network/interfaces.d/*' '/etc/network/interfaces'
  }

fi

