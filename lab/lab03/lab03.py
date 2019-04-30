""" Lab 3: Recursion and Midterm Review """

def gcd(a, b):
    """Returns the greatest common divisor of a and b.
    Should be implemented using recursion.

    >>> gcd(34, 19)
    1
    >>> gcd(39, 91)
    13
    >>> gcd(20, 30)
    10
    >>> gcd(40, 40)
    40
    """
    "*** YOUR CODE HERE ***"
    if a < b:
        a, b = b, a
    if a > b and a % b != 0:
        return gcd(b, a % b)
    else:
        return b

def hailstone(n):
    """Print out the hailstone sequence starting at n, and return the
    number of elements in the sequence.

    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    """
    if n == 1:
        print(n)
        return 1    
    if n % 2 == 0:
        print(n)
        return hailstone(n // 2) + 1
    else:
        print(n)
        return hailstone(n * 3 + 1) + 1
