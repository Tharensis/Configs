#!/bin/bash

curr=$(xbacklight -get)

next=$(echo $curr \* 2 + 1 | bc)

xbacklight -set $next
