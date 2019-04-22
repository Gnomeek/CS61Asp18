## BUG

In some occasions, you may find that you can never pass the test with below exception:

<pre>Running tests

---------------------------------------------------------------------
Question 7 &gt; Suite 1 &gt; Case 2

&gt;&gt;&gt; from hog import play, always_roll, announce_highest, both
&gt;&gt;&gt; #
&gt;&gt;&gt; announce_both = both(announce_highest(0), announce_highest(1))
&gt;&gt;&gt; s0, s1 = play(always_roll(0), always_roll(0), goal=10, say=announce_both)

# Error: expected
#     2 points! That&apos;s the biggest gain yet for Player 0
#     2 points! That&apos;s the biggest gain yet for Player 1
#     6 points! That&apos;s the biggest gain yet for Player 1
#     10 points! That&apos;s the biggest gain yet for Player 0
# but got


Run only this test case with &quot;python3 ok -q 07 --suite 1 --case 2&quot;
---------------------------------------------------------------------
Test summary
    1 test cases passed before encountering first failed test case
</pre>


Well, I face this problem too, which really annoyed me. Everything I search on the Internet doesn't work anymore.

Finally, I find where the bug is. There is no relationship between the *exception* and *announce_highest function*. The problem occur in the past,To speak more specific, it's in PROBLEM 5.

Sometimes, we delete the 
> say=say(score0,score1)

in the *play function*,which also leads to the exception as above.So adding just one row can solve every problems(which makes me looks like a idiot)

    # (note that the indentation for the problem 6 prompt (***YOUR CODE HERE***) might be misleading)
    # BEGIN PROBLEM 6
        say=say(score0,score1)
    # END PROBLEM 6
