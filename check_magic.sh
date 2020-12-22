magic_number=`xxd actions/e2b/trusted-firmware-a/build/a80x0_mcbin/release/fip.bin | head -n1 | grep -o "0100 64aa"`
if [ "$magic_number" != "0100 64aa" ]; then
  echo "Correct number"
fi