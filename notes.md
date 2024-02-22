To open a program on an rpi connected to a screen and rotate it:

```shell
sudo openvt -s -- bpytop; echo 1 | sudo tee /sys/class/graphics/fbcon/rotate
```

