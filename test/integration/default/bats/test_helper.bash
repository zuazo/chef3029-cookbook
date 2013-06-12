get_distro_name() {
  lsb_release -si | tr A-Z a-z
}

distro_release_major() {
  lsb_release -rs | cut -d. -f1
}

is_debian() {
  [ $(get_distro_name) = 'debian' ]
}

is_ubuntu() {
  [ $(get_distro_name) = 'ubuntu' ]
}

is_centos() {
  [ $(get_distro_name) = 'centos' ]
}

is_fedora() {
  [ $(get_distro_name) = 'fedora' ]
}

is_redhat() {
  [ $(get_distro_name) = 'redhat' ]
}

has_ifconfig_support() {
  is_centos || is_fedora || is_redhat || \
  ( is_debian && [ $(distro_release_major) -ge 7 ] ) || \
  ( is_ubuntu && [ $(distro_release_major) -ge 11 ] )
}
