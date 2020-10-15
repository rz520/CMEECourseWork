## block 1: use global keyword to modify a global variable from inside a function
_a_global = 10

print("Outside the function, the value of _a_global is", _a_global)

def a_function():
    global _a_global
    _a_global = 5
    _a_local = 4
    
    print("Inside the function, the value of _a_global is ", _a_global)
    print("Inside the function, the value _a_local is ", _a_local)
    
    return None

a_function()

print("Outside the function, the value of _a_global now is", _a_global)

## block 2: in nested functions, global keyword inside the inner function change the global variables in the main workspace,
## but the global variable within the scope remained origin
def a_function():
    _a_global = 10

    def _a_function2():
        global _a_global
        _a_global = 20

    print("Before calling a_function, value of _a_global is ", _a_global)

    _a_function2()

    print("After calling _a_function2, value of _a_global is ", _a_global)

    return None

a_function()

print("The value of _a_global in main workspace / namespace is ", _a_global)


## block 3: 
_a_global = 10

def a_function():

    def _a_function2():
        global _a_global
        _a_global = 20
    
    print("Before calling a_function, value of _a_global is ", _a_global)

    _a_function2()
    
    print("After calling _a_function2, value of _a_global is ", _a_global)

a_function()

print("The value of _a_global in main workspace / namespace is ", _a_global)