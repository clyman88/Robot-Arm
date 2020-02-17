import board
import neopixel
import time
import pulseio
import random
import touchio
from sauce.py import Sauce
from adafruit_motor import servo

pwm = pulseio.PWMOut(board.A2, duty_cycle= 2**15, frequency=50)
pwm = pulseio.PWMOut(board.A3, duty_cycle= 2**15, frequency=50)

sauce_pinch_servo = servo.Servo(pwm)
sauce_side = servo.Servo(pwm)
sauce_unit = Sauce(sauce_pinch_servo, sauce_side, 180, 45, 180, 90)

sauce_unit.open_sauce()
time.sleep(2)
sauce_unit.close_sauce()
time.sleep(2)
sauce_unit.squirt()
time.sleep(2)
sauce_unit.close_sauce()
time.sleep(2)
while True:
    sauce_unit.self_destruct(1)