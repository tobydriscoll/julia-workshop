## Numbers

-1
-1.0

typeof(-1)

300_000_000
3e8

typeof(-1.0)

eps(1/128)
eps(1/127)

pi
typeof(pi)
cis(π/2)

1/4
4/2
4÷2
4%2

log(-1.0)

log(complex(-1.0))

typeof(log(complex(-1.0)))

pi

2π
x = 3
3x

ℯ
ℯ


## Help

apropos("log10")
apropos(r"^log")
@edit(log10(2.0))


## Type hierarchy

typeof(7.0)
7.0 isa Real
7.0 isa Number
7.0 isa Integer
7 isa Real
7 isa Complex 
7 + 0im isa Number 

subtypes(Real)
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

'c'  # a character

"A string"

"""
A string on 
multiple lines
"""

"escaped string symbol \$"

"string with interpolated value x=$y"

using(Pkg); Pkg.add("PyFormattedStrings")  # one-time package installation
using PyFormattedStrings
println(f"pi is approximately {π:.7f} and e is approximately {ℯ:.7f}")


## Tuple

tup = (1,2,3)
loner = (10,)
a,b,c = tup
a
b
c

(x,y)
x,y = y,x
(x,y)

tup[2]

nt = (foo=4,bar=9)  # NamedTuple
nt.foo
f,g = nt
f 
g 

tup = (1,2,3,4)
+(tup)     # error
+(tup...)  # splat


## Range

rng = 2:8
typeof(rng)
collect(rng)

x = -1:0.1:1
collect(x)

x = range(-1,1,21)
collect(x)

collect('a':'f')

collect(4:2)


## Dictionary

"pi"=>3.17
typeof( "pi"=>3.17 )
dd = Dict( "pi"=>3.17, "e"=>2.72, "phi"=>1.62, 4=>"four" )
dd["phi"]
dd[5] = "five"
keyz = keys(dd)
valz = values(dd)
zip(keyz,valz)
collect(zip(keyz,valz))
Dict(zip(keyz,valz))


## Symbol

:sym
typeof(:sym)
Symbol("spaced out")
dd = Dict( :pi=>3.17, "e"=>2.72, "phi"=>1.62 )
