## Anonymous function 
x -> cos(x^2)
map(x->cos(x^2),1:5)

## Quick form 
plus1(x) = x + 1
plus1(4)
∔(x,y) = x + y + x*y
3 ∔ 4

## Closures
plustwo(x) = x + two
plustwo(5)
two = 2
plustwo(5)

## Full form
function roots(a,b,c)
    d = b^2-4a*c
    if isreal(d) && d < 0
        d = complex(d)
    end
    x₁ = (-b-sign(b)*sqrt(d)) / 2a 
    return x₁,c/(a*x₁)   # return keyword not strictly needed
end

roots isa Function
typeof(roots)
roots(1,2,2)


## Broadcasting
t = 1:6
log(t)  # error 
log.(t)

plus1(t)
plus1.(t)

log.(1 .+ sin.(t))
@. log(1+sin(t))


## Default argument values
function foo(x,y=6)
    return x+y
end
foo(2,4)
foo(2)

vander(x,n=length(x)-1) = [ x^j for x in x, j in 0:n ]
vander(-1:3)
vander(-1:3,2)


## Slurping
add_three(args...) = args[1] + args[2] + args[3]
add_three(1,2,3,4,5,6)


## Keyword arguments
function bar(x;rev)
    return rev ? reverse(x) : x
end

bar(1:5)
bar(1:5,true)
bar(1:5,rev=true)
rev = false
bar(1:5;rev=rev)

function bar(x;rev=true)
    return rev ? reverse(x) : x   # abbreviated if/then/else
end

bar(1:5)
bar(1:5,true)
rev = false
bar(1:5;rev)
