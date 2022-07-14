module Circles

export Circle, center, perimeter, area

struct Circle 
    center 
    radius 
    Circle(p::AbstractVector{<:Real},r::Real) = new(float(p),float(r))
end

center(c::Circle) = c.center 
perimeter(c::Circle) = 2π*c.radius
area(c::Circle) = π*c.radius^2

import Base: +,- 
+(c::Circle,x::AbstractVector) = Circle(c.center+x,c.radius)
-(c::Circle,x) = +(c,-x)

end # module Circles
