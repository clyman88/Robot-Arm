from time import sleep

class Sauce(object):

    def __init__(self, servo, photo_interrupter):
        self.servo = servo
        self.photo_interrupter = photo_interrupter
        servo.angle = 180

    def squirt(self):
        for i in range(90):
            self.servo.angle = 180 - i
            sleep(.0075)
        self.servo.angle = 180