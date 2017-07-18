bat0="$(acpi -b | grep 'Battery 0' | awk '{print $4}')"
bat1="$(acpi -b | grep 'Battery 1' | awk '{print $4}')"

result="[ $bat0, $bat1 ]"
echo $result 
#notify-send -a "Battery" --urgency=CRITICAL "Low battery"
