"""Lab 2: Lambda Expressions and Higher Order Functions"""

# Lambda Functions

def lambda_curry2(func):
    """
    Returns a Curried version of a two-argument function FUNC.
    >>> from operator import add
    >>> curried_add = lambda_curry2(add)
    >>> add_three = curried_add(3)
    >>> add_three(5)
    8
    """
    "*** YOUR CODE HERE ***"
    return lambda x : lambda y : func(x,y)


# Q4
    """
    >>> a = lambda x: x * 2 + 1
    >>> def b(b, x):
        ...     return b(x + a(x))
    >>> x = 3
    >>> b(a, x)
    21 # (3+(3*2+1))*2+1 = 21
    """
# Q5
    """
    n = 9
    def make_adder(n):
        return lambda k: k + n
    add_ten = make_adder(n+1)
    result = add_ten(n)
    ANSWER: result = 19 # 10 + 9
    NOTICE: only in add_ten, n become 10 as lambda k: k + 10
            in other place, n is equal to Global frame(n = 9)
    """
