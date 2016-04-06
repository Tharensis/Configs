#!/bin/bash

is_in_tablet_mode(){
    local mode=$(cat /sys/devices/platform/thinkpad_acpi/hotkey_tablet_mode)
    if [[ "$mode" == "1" ]]; then
        return 0
    else
        return 1
    fi
}

set_randr() {
    local rotation="$1"

    xrandr -o "$rotation"
}

set_wacom() {
    local rotation="$1"

    xsetwacom list devices | sed 's/id: .*//' | while read device; do
    xsetwacom set "$device" rotate "$rotation"
    xsetwacom set "$device" MapToOutput "LVDS1"
done
}

set_input() {
    local mode="$1"

    local trackpoint="`xinput list | grep TrackPoint | grep -Eo 'id=([0-9]*)' | cut -d'=' -f2`"
    local touchpad="`xinput list | grep TouchPad | grep -Eo 'id=([0-9]*)' | cut -d'=' -f2`"
    for input in "$trackpoint" "$touchpad"; do
        if [[ $mode == "enable" ]]; then
            xinput set-prop "$input" "Device Enabled" "1"
        elif [[ $mode == "disable" ]]; then
            xinput set-prop "$input" "Device Enabled" "0"
        else
            echo "Error [set_input" 1>&2
        fi    done
}

rotate_normal() {
    set_randr normal
    set_wacom none
}

rotate_portrait() {
    set_randr right
    set_wacom cw
}

rotate_landscape() {
    set_randr inverted
    set_wacom half
}

autorotate() {
    local rotation="$1"

    if is_in_tablet_mode; then
        if [[ $rotation == "portrait" ]]; then
            rotate_portrait
        else
            rotate_landscape
        fi
        set_input disable
    else
        rotate_normal
        set_input enable
    fi
}


#listen for changes via acpi
acpi_listen | while read event; do
    if [[
            $event == "ibm/hotkey HKEY 00000080 00005009"
        ||  $event == "ibm/hotkey HKEY 00000080 0000500a"
        ||  $event == "video/tabletmode TBLT 0000008A 00000000"
        ||  $event == "video/tabletmode TBLT 0000008A 00000001"
    ]]; then
    autorotate "$rotation"
fi
done