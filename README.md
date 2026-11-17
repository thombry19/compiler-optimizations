## COMP 211 Checkoff 3 · Performance and Optimization - OVERVIEW

This repo is a collection of a few coding examples that I used when exploring the concept of code optimization in C. It contains a few .c files and .s files, as well as some built files too.

## TOPIC

The topic I chose was code optimizations, but I always wanted to briefly explore inlining despite it being a bit more in depth because I wanted to understand it.

## WHAT I EXPLORED

So it turns out optimization is actually quite useful. A C compiler doesn't merely translate my code line by line, as certain levels of optimization options can sometimes rewrite my entire program into something a lot faster, just as long as the origram's observable behavior stays the same. I tested two rewrites in dead code elimination, in which lines that are irrelevant to the final result are removed. I also tested function inlining, which pastes a function directly into its caller.

## FAVORITE DISCOVERIES

1. **A 2,000,000,000 iteration loop took a full 4.7 s at `-O0` and just 0.002 s at `-O2`. That's optimization for you!**
  The compiler accomplished this by simply removing the loop, as it was found to be useless.
2. **`-O1` vs. `O2`.**
   It removes the useless `sum` but leaves an empty countdown loop; `-O2` discoveres that the empty loop does nothing and fully removes it too.
3. **Inlining: Initial guess vs. actual test..** 
   Inlining `scale()` made the loop about 2.5 times faster. I first thought that this came from vectorization, but nearly all of the improvement is from removing the call itself.

## ADDITIONAL RUN INSTRUCTIONS

All of the .c files have their instructions for running at the bottoms, but here are the instructions for running the .s files for inlining:
- `assembly/dce_O0.s`: `dce.c` compiled with `-O0`; the 2-billion-iteration loop is fully visible (`.L3` body, `.L2` check).
- `assembly/dce_O2.s`: `dce.c` compiled with `-O2`; the loop is gone and `main` only prints "done" (`call puts`) and returns.
- `assembly/inline_O2.s`: `inline.c` compiled with `-O2`; `scale()` is inlined, so there is no `call scale` in the loop.
- `assembly/inline_O2_noinline.s`: `inline.c` with `scale()` forced not to inline; the loop still has a `call scale` on every iteration.