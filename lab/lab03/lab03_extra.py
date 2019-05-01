""" Optional problems for Lab 3 """

from lab03 import *

## Higher order functions

def cycle(f1, f2, f3):
    """Returns a function that is itself a higher-order function.

    >>> def add1(x):
    ...     return x + 1
    >>> def times2(x):
    ...     return x * 2
    >>> def add3(x):
    ...     return x + 3
    >>> my_cycle = cycle(add1, times2, add3)
    >>> identity = my_cycle(0)
    >>> identity(5)
    5
    >>> add_one_then_double = my_cycle(2)
    >>> add_one_then_double(1)
    4
    >>> do_all_functions = my_cycle(3)
    >>> do_all_functions(2)
    9
    >>> do_more_than_a_cycle = my_cycle(4)
    >>> do_more_than_a_cycle(2)
    10
    >>> do_two_cycles = my_cycle(6)
    >>> do_two_cycles(1)
    19
    """
    def circleOutside(n):
        def functionDef(m):
            if m % 3 == 1:
                return f1
            if m % 3 == 2:
                return f2
            if m % 3 == 0:
                return f3
        def circleInside(x):
            count = 1
            while count <= n:
                x = functionDef(count)(x)
                count += 1
            return x
        return circleInside
    return circleOutside

## Lambda expressions

def is_palindrome(n):
    """
    Fill in the blanks '_____' to check if a number
    is a palindrome.

    >>> is_palindrome(12321)
    True
    >>> is_palindrome(42)
    False
    >>> is_palindrome(2015)
    False
    >>> is_palindrome(55)
    True
    """
    x, y = n, 0
    f = lambda: y * 10 + x % 10
    while x > 0:
        x, y = x // 10 , f()
    return y == n

## More recursion practice

# Find the bug
def skip_mul(n):
    """Return the product of n * (n - 2) * (n - 4) * ...

    >>> skip_mul(5) # 5 * 3 * 1
    15
    >>> skip_mul(8) # 8 * 6 * 4 * 2
    384
    """
    """
    replace this statement with below sentences
    if n == 2:
        return 2
    """
    if n == 2 or n == 1:
        return n
    else:
        return n * skip_mul(n - 2)

def is_prime(n):
    """Returns True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    if n == 1:
        return False
    def helpFunc(i):
        if i == n:
            return True
        if n % i == 0:
            return False
        return helpFunc(i + 1)
    return helpFunc(2)


def interleaved_sum(n, odd_term, even_term):
    """Compute the sum odd_term(1) + even_term(2) + odd_term(3) + ..., up
    to n.

    >>> # 1 + 2^2 + 3 + 4^2 + 5
    ... interleaved_sum(5, lambda x: x, lambda x: x*x)
    29
    """
    def help_odd(k,odd_term):
        if k == n:
            return odd_term(n)
        return help_even(k + 1 , even_term) + odd_term(k)
    def help_even(k,even_term):
        if k == n:
            return even_term(n)
        return help_odd(k + 1, odd_term) + even_term(k)

    return help_odd(1,odd_term)

def ten_pairs(n):
    """Return the number of ten-pairs within positive integer n.

    >>> ten_pairs(7823952)
    3
    >>> ten_pairs(55055)
    6
    >>> ten_pairs(9641469)
    6
    """
    "*** YOUR CODE HERE ***"
    
    def digits_count(x,digits):
        if x == 0:
            return 0
        if x % 10 == digits:
            return digits_count(x // 10, digits) + 1
        else:
            return digits_count(x // 10, digits)

    if n < 10:
        return 0

    return ten_pairs(n // 10) + digits_count(n // 10, 10 - n % 10)
