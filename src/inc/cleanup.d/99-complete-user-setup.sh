if [ -n "$(getent group trunkuser)" ]; then
  user="$TRUNK_USER"
  home="/home/${user}"

  cp -r "/root/." "$home" &&
    chown -R "${user}:${user}" "$home"
fi
