# Julia "gotchas"

1. The scope of a variable inside a loop (including the loop index) is local unless declared global or shadowing the same variable in an enclosing scope. (Also, the rules are different in the REPL as opposed to within a function.)
2. You can't add a scalar to an array by using `+`. You have to use `.+` or the `@.` macro.
3. `max` and `min` compare multiple arguments, while `maximum` and `minimum` operate over a single array. (Also, `extrema` does both in one call.)
4. The built-in timer `@time` is stochastic and affected by compilation time. Instead, use `@btime` from `BenchmarkTools`, and use variable interpolation when you call it.