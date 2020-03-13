import board
import neopixel
import time
import pulseio
import random
import touchio
from adafruit_motor import servo
from sauce import Sauce
from item_selection import ItemSelection
import busio
from digitalio import DigitalInOut, Direction, Pull

pwm = pulseio.PWMOut(board.A2, duty_cycle= 2**15, frequency=50)
pwm1 = pulseio.PWMOut(board.A3, duty_cycle= 2**15, frequency=50)
pwm2 = pulseio.PWMOut(board.A4, duty_cycle= 2**15, frequency=50)
pwm3 = pulseio.PWMOut(board.D12, duty_cycle= 2**15, frequency=50)

pi = DigitalInOut(board.D6)
pi.direction = Direction.INPUT
pi.pull = Pull.UP

sauce_pi = DigitalInOut(board.D7)
sauce_pi.direction = Direction.INPUT
sauce_pi.pull = Pull.UP

sauce_servo = servo.Servo(pwm)
plate_servo = servo.Servo(pwm2)
spat_servo = servo.Servo(pwm3)

sauce_unit = Sauce(sauce_servo, sauce_pi)
uart = busio.UART(board.TX, board.RX, baudrate=9600)
x = 0
plate_unit = ItemSelection(plate_servo, spat_servo, pi)

toggle = True

while True:
    plate_servo.angle = 90
    spat_servo.angle = 180

    try:
        data = uart.read(1)
        data = data.decode()
        print(data)

        if data == "a":
            plate_unit.select_spec(1)

        elif data == "b":
            plate_unit.select_spec(2)

        elif data == "c":
            plate_unit.select_spec(3)

        elif data == "d":
            plate_unit.select_spec(4)

        elif data == "e":
            plate_unit.select_spec(5)

        elif data == "f":
            plate_unit.select_spec(6)

        elif data == "g":
            for i in range(6):
                plate_unit.flip()
                time.sleep(1)
                plate_unit.change_one()

        elif data == "h":
            sauce_unit.squirt()

    except AttributeError:
        print("no data")
    time.sleep(1/60/4)