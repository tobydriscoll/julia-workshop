
using BenchmarkTools

##########
# Case study: Proper broadcasting
##########

##
# breaks loop fusion:
function hypo1(b::Vector{T},h::Vector{T}) where T <: Real
    return sqrt.(b.^2 + h.^2)
end

b = 10rand(5000)
h = 10rand(5000)
@benchmark hypo1($b,$h)

##
# proper loop fusion:
function hypo2(b::Vector{T},h::Vector{T}) where T <: Real
    return sqrt.(b.^2 .+ h.^2)
end
@benchmark hypo2($b,$h)

##
# vectorize last:
function hypo3(b::T,h::T) where T <: Real
    return sqrt(b^2 + h^2)
end
@benchmark hypo3.($b,$h)

##
@code_native(hypo1(b[1:1],h[1:1]))
@code_native(hypo3(b[1],h[1]))

## 
# But performance isn't everything!
@benchmark hypot.($b,$h)


##
##########
# Case study: Type stability
##########

## Type instability: compiler can't be sure of the type

function add_them(x)
    s = 0
    for x in x
        s += x
    end
    return s
end

u = 1:5
@code_warntype(add_them(u))

##
v = rand(5)
@code_warntype(add_them(v))

##
function add_them_up(x)
    s = zero(x)
    for x in x
        s += x
    end
    return s
end
@code_warntype(add_them_up(v))


## Global variables can create type instability.
p = 14.0
function add_them_to_p(x)
    s = p
    for x in x
        s += x
    end
    return s
end
@code_warntype(add_them_to_p(v))

## Global constants are fine.
const q = 14.0
function add_them_to_q(x)
    s = q
    for x in x
        s += x
    end
    return s
end
@code_warntype(add_them_to_q(v))


