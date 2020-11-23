# to findout what is slowing down code, we need to profile code
# write an illustrative program, here is a comprehension version

def my_squares(iters):
    """a function calculate squares from 0 to input number"""
    out = [i ** 2 for i in range(iters)]
    return out

def my_join(iters, string):
    """a function repeat a string as the length of iters"""
    out = ''
    for i in range(iters):
        out += ", " + string
    return out

def run_my_funcs(x,y):
    """a function combines 2 functions above together"""
    print(x,y)
    my_squares(x)
    my_join(x,y)
    return 0

# run functions
run_my_funcs(10000000,"My string")