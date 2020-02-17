class Sauce(object):

    def __init__(self, pinch_servo, side_servo, open_pos, close_pos, away_pos, primed_pos):
        self.pinch_servo = pinch_servo
        self.side_servo = side_servo
        self.open_pos = open_pos
        self.close_pos = close_pos
        self.away_pos = away_pos
        self.primed_pos = primed_pos

    def open_sauce(self):
        side_servo.angle = away_pos
        pinch_servo.angle = open_pos

    def close_sauce(self):
        pinch_servo.angle = close_pos
        side_servo.angle = primed_pos

    def squirt(self):
        pinch_servo.angle = close_pos -15

    def self_destruct(self, x):
        side_servo.angle += x
        pinch_servo = close_pos - 15
        if side_servo.angle >= 180 + x:
            x *=-1
