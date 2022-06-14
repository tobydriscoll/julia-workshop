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
    return x₁,c/(a*x₁)
end

roots isa Function
typeof(roots)
roots(1,2,2)
