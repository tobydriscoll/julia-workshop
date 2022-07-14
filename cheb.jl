function cheb1(x,n)
    T = [ones(length(x)) x]
    for k in 2:n-1
        Tnew = 2x.*T[:,k] - T[:,k-1]
        T = [T Tnew]
    end
    return T
end

function cheb2(x,n)
    T = [ones(length(x)), x]
    for k in 2:n-1
        Tnew = @. 2x*T[k] - T[k-1]
        push!(T,Tnew)
    end
    return hcat(T...)
end

function cheb3(x,n)
    T = similar(x,length(x),n)
    T[:,1:2] = [ones(length(x)) x]
    for k in 2:n-1
        Tnew = @. 2x*T[:,k] - T[:,k-1]
        T[:,k+1] .= Tnew
    end
    return T
end

function cheb4(x,n)
    T = similar(x,length(x),n)
    T[:,1:2] .= [ones(length(x)) x]
    twox = 2x
    Tnew = copy(twox)
    for k in 2:n-1
        Tnew .= twox.*T[:,k] .- T[:,k-1]
        T[:,k+1] .= Tnew
    end
    return T
end

function cheb5(x,n)
    T = similar(x,length(x),n)
    T[:,1] .= 1.0
    T[:,2] .= x
    twox = 2x
    for k in 2:n-1
        for i in eachindex(x)
            T[i,k+1] = twox[i]*T[i,k]-T[i,k-1]
        end 
    end
    return T
end


##

using LoopVectorization

function cheb5t(x,n)
    T = similar(x,length(x),n)
    T[:,1] .= 1.0
    T[:,2] .= x
    twox = 2x
    for k in 2:n-1
        @turbo for i in eachindex(x)
            T[i,k+1] = muladd(twox[i],T[i,k],-T[i,k-1])
        end 
    end
    return T
end

