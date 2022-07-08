using DifferentialEquations
using ComponentArrays

function pendula!(dx,x,p,t)
    θ,θ̇ = x.angle,x.velocity
    ω₀,γ,k = p 
    A = k*[1 -1 0; -1 2 -1;0 -1 1]
    dx.angle .= θ̇
    dx.velocity .= -ω₀^2*θ - γ*θ̇ - A*θ
end

x₀ = ComponentArray(angle=[1,-1,0.],velocity=zeros(3))
IVP = ODEProblem(pendula!,x₀,(0.,80.),[2,0,0.2])
x = solve(IVP)

##
using Plots
plot(x)

##
plot(x,vars=1:3)