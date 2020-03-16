echo "slowctrl all dac 600" | nc 192.168.7.10 23
echo "hvps setdac all 3800" | nc 192.168.7.10 23
#echo "hvps turnon 0 0 0 0 1 0 0 0 0" | nc 192.168.7.10 23
echo "hvps turnon 1 1 1 1 1 1 1 1 1" | nc 192.168.7.10 23
echo "hvps status gpio" | nc 192.168.7.10 23
echo "hvps mapping 0 0 4 0 0 0 0 0 0" | nc 192.168.7.10 23
echo "hvps switching on 1" | nc 192.168.7.10 23
echo "hvps cathode all 3" | nc 192.168.7.10 23

