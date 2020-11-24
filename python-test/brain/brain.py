#!/usr/bin/env python3

from robot import Robot

rb = Robot()
while rb.update():
    print(rb.pos_x, rb.pos_y, rb.pos_t, rb.range)
