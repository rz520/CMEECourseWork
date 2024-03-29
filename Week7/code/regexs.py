#!/usr/bin/env python3

"""some regexes examples in python using re module"""

# import module
import re

# examples
my_string = "a given string"

# find a space in the string
match = re.search(r"\s", my_string)
print(match)

# see the match
match.group()

# another pattern
match = re.search(r'\d', my_string)
print(match)

# use if to know whether a pattern was matched
MyStr = 'an example'
match = re.search(r'\w*\s', MyStr)
if match:
    print('found a match:', match.group())
else:
    print('did not find a match')


# some more regexes examples
match = re.search(r'2', "it takes 2 to tango")
match.group()

match = re.search(r'\d', "it takes 2 to tango")
match.group()

match = re.search(r'\d.*', "it takes 2 to tango")
match.group()

match = re.search(r'\s\w{1,3}\s', 'once upon a time')
match.group()

match = re.search(r'\s\w*$', 'once upon a time')
match.group()


# a more compact syntax by directly returning the matched group
re.search(r'\w*\s\d.*\d', 'take 2 grams of H2O').group()

re.search(r'^\w*.*\s', 'once upon a time').group()

# *, +, {} repeat the previous regex token as many times as possible
# use ? to terminate at the first found instance of a pattern
re.search(r'^\w*.*?\s', 'once upon a time').group()

# further illustrate greediness in regexes, matching an HTML tag
re.search(r'<.+>', 'This is a <EM>first</EM>test').group()
re.search(r'<.+?>', 'This is a <EM>first</EM>test').group()

# move on
re.search(r'\d*\.?\d*', '1432.75+60.22i').group()

re.search(r'[AGTC]+', 'the sequence ATTCGT').group()

re.search(r'\s+[A-Z]\w+\s*\w+', "The bird-shit frog's name is Theloderma asper.").group()