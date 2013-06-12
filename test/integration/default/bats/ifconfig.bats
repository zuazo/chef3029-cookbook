#!/usr/bin/env bats

@test "ifconfig should return the correct inet addr" {
  /sbin/ifconfig eth0:1 | grep -F 'inet addr:10.22.33.44'
}

@test "ifconfig should return the correct net mask" {
  /sbin/ifconfig eth0:1 | grep -Fw 'Mask:255.255.255.0'
}

