module Awesome

using LinearAlgebra
myglobal = 22/7

export plus1

plus1(x) = 1 + x 
plus1(X::AbstractMatrix) = I + X
plus1(t::Tuple) = (1,t...)

end # module
