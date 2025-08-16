use std::fmt;

#[derive(PartialEq, Eq)]
#[derive(Debug)]

pub struct Clock {
    hours: i32, 
    minutes: i32
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let extra_hours = minutes / 60;
        let mut minutes: i32 = minutes % 60;
        let mut hours: i32 = hours;
        if minutes < 0 {
            hours -= 1
        }
        minutes = if minutes >= 0 {minutes} else {60 + minutes};
        hours += extra_hours;
        hours %= 24;
        hours = if hours >= 0 {hours} else {24 + hours};
        Self { hours, minutes }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let new_minutes: i32 = self.minutes + minutes;
        Clock::new(
            self.hours,
            new_minutes
        )
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:0>2}:{:0>2}", self.hours, self.minutes)
    }
}