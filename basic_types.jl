## Numbers

-1

typeof(-1)

300_000_000

typeof(-1.0)

eps()

cis(π/2)

log(-1.0)

log(complex(-1.0))

typeof(log(complex(-1.0)))

pi

2π

ℯ


## Help

apropos("log")
apropos(r"^log")
@edit(log10(2.0))


## Type hierarchy

typeof(7.0)
7.0 isa Real
7.0 isa Number
7.0 isa Integer
7 isa Real
7 isa Complex 
7 + 0im isa Complex 

typeof(7f0)
7f0 isa Float64
7f0 isa Real


## Assignments

x = 22//7
typeof(x)

a1 = a2 = a3 = 0

x += 1
x *= 2

y = 3.14


## String

"A string"

"""
A string on 
multiple lines
"""

"string with interpolated value x=$x"

using PyFormattedStrings
println(f"pi is approximately {π:.7f} and e is approximately {ℯ:.7f}")


## Tuple

tup = (1,2,3)
loner = (10,)
a,b,c = tup

(x,y)
x,y = y,x
(x,y)

nt = (foo=4,bar=9)  # NamedTuple
nt.foo
f,g = nt

tup = (1,2,3,4)
+(tup)     # error
+(tup...)  # splat


## Range

rng = 2:8
collect(rng)

x = -1:0.1:1
collect(x)

x = range(-1,1,21)
collect(x)

collect('a':'f')


## Dictionary

typeof( "pi"=>3.17 )
dd = Dict( "pi"=>3.17, "e"=>2.72, "phi"=>1.62 )
keyz = keys(dd)
valz = values(dd)
Dict(zip(keyz,valz))


## Symbol

:sym
typeof(:sym)
dd = Dict( :pi=>3.17, "e"=>2.72, "phi"=>1.62 )
