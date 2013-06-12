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

  @test "configuration files should be included from the main file" {
    grep -F 'source /etc/network/interfaces.d/*' '/etc/network/interfaces'
  }

  @test "the configuration should be persistent" {
    grep -F 'iface eth0:1 inet static' '/etc/network/interfaces.d/ifcfg-eth0:1'
    grep -F 'address 10.22.33.44' '/etc/network/interfaces.d/ifcfg-eth0:1'
    grep -F 'netmask 255.255.255.0' '/etc/network/interfaces.d/ifcfg-eth0:1'
  }

else

  @test "ifconfig should NOT return the correct inet addr" {
    /sbin/ifconfig eth0:1 | grep -Fv 'inet addr:10.22.33.44'
  }

  @test "configuration files should NOT be included from the main file" {
    grep -Fv 'source /etc/network/interfaces.d/*' '/etc/network/interfaces'
  }

fi

