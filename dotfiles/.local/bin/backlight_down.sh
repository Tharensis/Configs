#!/bin/bash

curr=$(xbacklight -get)

next=$(echo $curr / 2 | bc)

xbacklight -set $next
