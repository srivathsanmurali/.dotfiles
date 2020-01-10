#!/usr/bin/python
from datetime import date

goalDate = date(2016,7,13)
delta = goalDate - date.today();
print delta.days, "days left for 3DV"
