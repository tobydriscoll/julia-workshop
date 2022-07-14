includet("cheb.jl")    # requires Revise 
##
x = rand(50000);
@profview(cheb1(x,400))

@profview(cheb2(x,2000))

@profview(cheb3(x,2000))

@profview(cheb4(x,2000))

##
using BenchmarkTools

x = rand(40000);
# t1 = @benchmark cheb1($x,500)

t2 = @benchmark(cheb2($x,500))

t3 = @benchmark(cheb3($x,500))

t4 = @benchmark(cheb4($x,500))

##

judge(median(t3),median(t2))
judge(median(t4),median(t2))

##
t5 = @benchmark(cheb5($x,500))
judge(median(t5),median(t2))

t5t = @benchmark(cheb5t($x,500))
judge(median(t5t),median(t5))
