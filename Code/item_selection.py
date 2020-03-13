from time import sleep

class ItemSelection(object):
    has_started = False
    current_item = 1
    toggle = True
    def __init__(self, plate_servo, spat_servo, photo_interrupter):
        self.plate_servo = plate_servo
        self.spat_servo = spat_servo
        self.photo_interrupter = photo_interrupter

    def change_one(self):
        while self.toggle == True:
            self.plate_servo.angle = 98
            if self.photo_interrupter.value == False:
                self.has_started = True
            if self.photo_interrupter.value == True and self.has_started == True:
                self.plate_servo.angle = 90
                self.toggle = False
        self.spat_servo.angle = 180
        self.toggle = True
        self.has_started = False
        self.current_item += 1
        if (self.current_item > 6):
            self.current_item = 1

    def select_spec(self, selected):
        while self.current_item != selected:
            self.change_one()
        self.flip()

    def flip(self):
        sleep(1)
        self.spat_servo.angle = 0
        sleep(1)
        self.spat_servo.angle = 180