# Updating nix upstream channels

Show the existing channels:

```
nix-channel --list
```

Look at the available channels  at https://nixos.org/channels/ and
then add the one required, giving it a nix expression friendly name:

```
nix-channel --add  https://nixos.org/channels/nixos-18.03 nixos1803
nix-channel --update
```


# Increasing the number of inotify watches

add to `/etc/sysctl.conf`:

```
fs.inotify.max_user_watches=65536
```

and run

```
sudo sysctl -p
```
