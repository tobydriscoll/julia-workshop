# Julia workshop

## Manuals and guides

* [Julia language](https://docs.julialang.org/en/v1/)
* [Unicode characters](https://docs.julialang.org/en/v1/manual/unicode-input/)
* [Julia-Matlab-Python cheatsheet](https://cheatsheets.quantecon.org)
* [Differences from other major languages](https://docs.julialang.org/en/v1/manual/noteworthy-differences/)

## Packages

* [Package listings on Julia Hub](https://juliahub.com/ui/Packages)
* [IJulia](https://julialang.github.io/IJulia.jl/stable/)
* [Plots](http://docs.juliaplots.org/latest/)
* [DifferentialEquations](https://diffeq.sciml.ai/stable/)
* [NLsolve](https://github.com/JuliaNLSolvers/NLsolve.jl)
* [DataFrames](https://dataframes.juliadata.org/stable/)
* [Images](https://juliaimages.org/stable/)

Also see the Project.toml file in this repository.

## Community

* [Discourse](https://discourse.julialang.org/): Good mix of power users and noobs
* [Zulip](https://julialang.zulipchat.com): Slack-like platform, mostly advanced users and developers
* [Forem](https://forem.julialang.org): Blog posts, brand new
* [Reddit](https://reddit.com/r/julia): Pretty quiet

## Syllabus

* [Notebook demonstration](notebook_demo.ipynb)
* [Pluto demonstration](pluto/Pluto_demo.jl)
* [Basic types and assignments](basic_types.jl)
* [Conditionals and loops](conditionals_loops.jl)
* [Random numbers](random_numbers.ipynb)

## Suggested exercises

1. Find the sum of all the positive integers less than 1000 that are multiples of 3 or 5.
2. A *Collatz sequence* starting at integer $x_0$ is defined recursively by $x_k = f(x_{k-1})$, where
    $$
    f(n) = \begin{cases} 
    n/2, & \text{if $n$ is even,} \\ 3n+1, & \text{if $n$ is odd.} 
    \end{cases}
    $$
    It is believed, but not proved, that the Collatz sequence has finite length for every starting integer. Determine the value of $x_0 < 200$ that gives the longest Collatz sequence.
3. Define a *random walk* as the sequence $x_0=0$, $x_k = x_{k-1} \pm 1$, where the $+$ and $-$ signs are chosen independently and with equal probability at each $k$. It is easy to prove the expected values
    $$
    E[x_n] = 0, \qquad E\bigl[x_n^2\bigr] = n,
    $$
    and not at all easy to prove 
    $$
    E\bigl[\left|x_n\right|\bigr] = \sqrt{\frac{2n}{\pi}}. 
    $$
    Perform a random walk with $n=100,000$ and verify that these expected values are approximately obtained.
4. You know the Maclaurin series for the exponential function,
    $$
    e^x = 1 + x + \frac{x^2}{2} + \cdots + \frac{x^n}{n!} + \cdots. 
    $$
    Set $x=10.0$ and use a loop to evaluate this series naively, stopping when you reach a term that is too small to change the result. Then repeat for $x$ equal to `10f0`, which gives a 32-bit result, and $x$ equal to `BigFloat(10)`, which gives a 256-bit result.