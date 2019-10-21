echo "slowctrl all dac 600" | nc 192.168.7.10 23
echo "hvps setdac all 3800" | nc 192.168.7.10 23
echo "hvps cathode all 3" | nc 192.168.7.10 23
echo "hvps turnon all" | nc 192.168.7.10 23
echo "hvps status gpio" | nc 192.168.7.10 23

