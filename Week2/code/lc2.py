#!/usr/bin/env python3 

"""This python script is another practice on comprehension and conventional loops"""

# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.

over_100 = [row for row in rainfall if row[1] > 100]

print(over_100)
print()
 
# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 

less_50 = [row[0] for row in rainfall if row[1] < 50]
print(less_50)
print()

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 

over_100 = []
for row in rainfall:
    if row[1] > 100:
        over_100.append(row)

less_50 = []
for row in rainfall:
    if row[1] < 50:
        less_50.append(row[0])

print(over_100)
print()
print(less_50)