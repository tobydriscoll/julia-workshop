### A Pluto.jl notebook ###
# v0.19.5

using Markdown
using InteractiveUtils

# ╔═╡ caf65372-92a1-4aba-bd16-28539ceab9ee
using LinearAlgebra

# ╔═╡ 07ce6cb3-1f99-4941-8dce-f289ca343f5b
using BenchmarkTools

# ╔═╡ 08d63c34-6642-4db7-b146-1f327605fd0d
using OffsetArrays

# ╔═╡ 37d0c2ed-ba86-4bc6-9bad-e58955cfbe79
using ComponentArrays

# ╔═╡ bad5989f-b154-4d76-9ec1-0e01a84fa07f
using AxisArrays

# ╔═╡ 5e719d36-28be-4cbc-be19-249971f551ca
md"# Vector"

# ╔═╡ 9a18d6b7-e1c9-4688-895d-6592bebd3182
v = [1,2,3,4]

# ╔═╡ 18b242bf-4b0a-479a-946c-957b184afc5d
length(v)

# ╔═╡ a826bb6c-35f1-46c3-ada9-b6e4fca47d81
w = [1;2;3;4]

# ╔═╡ 494d4630-23d7-42c0-babd-688bb1298169
z = [1 2 3 4]

# ╔═╡ f87a951c-2235-44fb-bb41-4567ad3361d7
size(v),size(w),size(z)

# ╔═╡ eea22231-de82-43f8-aa8d-db675fbf3e66
md"Vector entries can be anything."

# ╔═╡ 2d7a0a5b-5837-4e00-a3cd-77f9045c40fb
weirdo = [1,"foobar",rand(3)]

# ╔═╡ 2f246374-89c1-4f6d-bd37-694a047308ea
eltype(weirdo)

# ╔═╡ 4f17cbbf-ea49-47b1-96ae-759dabb14079
md"## Indexing"

# ╔═╡ 7aeb9694-8df5-4f14-9dcd-72b2f723ae34
v[1],v[end]

# ╔═╡ fd6f5dd4-ab3f-4cdb-bcd9-797e3978503e
v[[1,end]]

# ╔═╡ 69777fb4-361c-4175-a551-6eb3367c3ee2
md"Note the difference in the results above: tuple versus vector."

# ╔═╡ 603e3761-1645-4d6e-993e-702e8f5cce8d
md"We can use *destructuring* to assign entries to individual names."

# ╔═╡ e5e8cc16-fa8c-4fba-92ad-ac04f3d70be6
let
	a,b = v[[1,3]]
	println("a is $a, b is $b")
end

# ╔═╡ 6ca7c1fb-be0a-4514-a9cd-757cb2afd89a
first(v),last(v)

# ╔═╡ 645c0c4e-b3c3-43be-aceb-b84fb9bb8490
v[4:-1:1],reverse(v)

# ╔═╡ 3e0b6cd2-65f9-4f0d-98ad-12ad2132acf0
v[1:2:end]

# ╔═╡ e3de8c04-19eb-4d67-9a81-81bcd484070b
md"Boolean vectors can also be used for indexing. (Syntax is given later.)"

# ╔═╡ 31b78a02-dd1d-4a42-a428-b45ea77443b1
md"## Operations"

# ╔═╡ 6343e973-53f8-4126-8693-068cff515718
v + w

# ╔═╡ 234c9dd8-5112-4713-b693-7e6a883ca013
v*w

# ╔═╡ b32d67ec-dbf6-454c-9826-5802cc6a846a
v .* w

# ╔═╡ 5054e90d-6232-445c-adf6-15c7a890a49e
dot(v,w)

# ╔═╡ aad62c8e-af80-4c2a-909d-f5dea756f277
md"## Growing a vector"

# ╔═╡ 98425426-c48d-4ee7-901b-cbc2c25bee7e
md"Unlike in Matlab, you can't extend the length of a vector on the fly."

# ╔═╡ 96599224-293b-4a43-99cd-2d9333507301
# ╠═╡ disabled = true
#=╠═╡
# Wrong version!

let f = [1,1]
	for n in 3:12
		f[n] = f[n-1] + f[n-2]
	end
	f
end
  ╠═╡ =#

# ╔═╡ ff15462f-448b-4815-bae6-4f06970ae148
md"The following works, but it is inefficient with memory. (Really, you should avoid doing it in Matlab, too.)"

# ╔═╡ d22f3571-4195-4f1d-9bf4-755e2a79eec1
let f = [1,1]
	for n in 3:12
		f = [f; f[n-1] + f[n-2]]
	end
	f
end

# ╔═╡ 8e00f07f-ee79-487f-be6a-d98bd5dc4d2a
md"You can also use `push!` and `append!` to grow a vector (inefficiently)."

# ╔═╡ 859ec95e-aa17-42b6-81c0-4b455518e2b4
let 
	f = [1,1]
	for n in 3:12
		push!(f,f[n-1]+f[n-2])
	end
	f
end

# ╔═╡ 9c5dde59-8de2-4752-8ab5-bc2226e7f925
md"(But once the element type is fixed, it can't be broadened.)"

# ╔═╡ f7ca212c-aaa9-4408-96ec-16c6b1e5149e
let
	u = [1,2,3]
	push!(u,sqrt(2))
end

# ╔═╡ 748375f2-fd0b-4c0e-b30e-e46ddcdf79b8
md"This version is better:"

# ╔═╡ c5d8ff05-1ef4-4633-ab1f-e8fa302ba811
let f = zeros(12)
	f[1:2] = [1,1]
	for n in 3:12
		f[n] = f[n-1] + f[n-2]
	end
	f
end

# ╔═╡ f02f39e0-5098-4164-b498-3f80c2439995
md"This version is considered even better:"

# ╔═╡ 88da31e2-3713-4881-b7d3-e32a237a915e
let f = Vector{Float64}(undef,12)   # allocate only, don't fill
	f[1:2] = [1,1]
	for n in 3:12
		f[n] = f[n-1] + f[n-2]
	end
	f
end

# ╔═╡ c7523846-3187-4b56-a9ee-dca1cc2dc873
md"Another way to allocate memory, of the same type as a known array."

# ╔═╡ 18fad624-969f-4083-a656-735890512158
similar(w)

# ╔═╡ 9717091e-9cf9-4fdc-b595-c5d8166059b3
similar(w,10)

# ╔═╡ b321b426-1c83-4c12-9cff-22ecee73c873
md"# Broadcasting"

# ╔═╡ 1b9926f6-0ad0-472f-8661-9b74c074082e
w .+ 2

# ╔═╡ 5f4dd927-03db-4d40-87ee-1db2c71d3db5
w .= 2

# ╔═╡ 76070805-6627-4253-97e2-9ffebd74104e
v,3v

# ╔═╡ f040fd06-7cb9-4f11-be20-5b0ab5583e3f
(v .+ 1).^2

# ╔═╡ afdb549f-dbd1-4339-917b-567f46c7df5f
@. (v+1)^2

# ╔═╡ ac37dfec-71e7-47a5-ab9b-07e8d6cd140f
md"Boolean index vector:"

# ╔═╡ 3db007d3-0575-4cbf-889a-8515965a96d1
v[iseven.(v)]

# ╔═╡ f61ba108-e80c-4925-989f-f96e0fe5560e
md"Broadcasting will look for any matching array axis. They don't have to be in the same position."

# ╔═╡ 7bedb0bd-3415-4f73-9b1f-b3184d4156c6
v .* [-1,0,2]'  # outer product

# ╔═╡ ed388c54-2026-4595-ada8-88bc400e1fd0
md"# Comprehension/generator"

# ╔═╡ 1df6d8aa-e67c-11ec-3cca-259d877dd9ef
begin 
	c = @. 1/(1:10)
	# c = [1/n for n in 1:10]
	x = 0.9
	terms = @. c*x^(0:9)
	# terms = [ c[n]*x^(n-1) for n in 1:10 ]
end

# ╔═╡ dd579061-1195-43a6-a090-549e3b5edb5f
sum(terms)

# ╔═╡ ca68eba4-1fe5-4ffe-9706-5b02e5cb9b9b
sum( c[n]*x^(n-1) for n in 1:10 )

# ╔═╡ a4c2eb2c-4e79-4e86-bb38-97f2028da5b2
@btime sum( $c[n]*$x^(n-1) for n in 1:10 )

# ╔═╡ 2e3b5f76-d21c-42cc-9133-7540721dc520
@btime sum( [$c[n]*$x^(n-1) for n in 1:10] )

# ╔═╡ 59e23025-3ab8-4029-8de5-b874974c96a4
[ 3.2^n/prod(1:n) for n in 0:10 ]

# ╔═╡ 6eab8b39-ec80-4e68-a4c0-ee772c533b81
maximum( 3.2^n/prod(1:n) for n in 0:20 )

# ╔═╡ 7175553d-9579-4a48-b852-6883cc71be85
md"# Matrix"

# ╔═╡ f74716db-8a21-466e-93a7-264f2c5d6dae
md"## Construction"

# ╔═╡ a047e00a-bbdd-46ae-9a2c-b2acfddee3d9
v

# ╔═╡ 54c1f1af-aecf-4b26-9bc4-e3f82f6cb7d0
md"In the context of a matrix construction, a vector has a column shape."

# ╔═╡ 374fe681-2c11-4458-9799-48d479013141
hcat(v,v,v)  # or [v v v]

# ╔═╡ 11f4a51d-f6bb-470a-98be-4d354d2ab809
vcat(v,v,v)

# ╔═╡ 766b3400-f05b-4c23-9d38-3c18bad2cdc0
md"Note the difference here:"

# ╔═╡ 03ad85bf-4105-4d91-a1a5-2d34150651cb
[v;v;v],[v,v,v]

# ╔═╡ a7739d6f-370e-4cf3-8647-858ae12a74c5
One = ones(4,5)

# ╔═╡ 9c3f9d30-a21b-4145-8dbb-72edbee61493
R = rand(2,4)

# ╔═╡ 48eaa5c0-5a4b-44a7-adab-00e62c980177
typeof(R)

# ╔═╡ f7eb8c6a-d32a-46f5-8b91-8228b9a0b738
H₃ = [1//(i+j-1) for i in 1:3, j in 1:3]

# ╔═╡ fb5492d0-5677-4904-8f71-38e0ae14b678
md"## Indexing and adjoint"

# ╔═╡ 04956e52-aa75-419e-8034-cb4955a635d9
R[2,1]

# ╔═╡ b572191d-f35b-42bf-871d-db3a03a514f9
R[:,end]

# ╔═╡ 01e7ef52-3bb3-44ea-bd5e-fec3d9175374
R[1,:]

# ╔═╡ 9fb712c6-1e5e-4ef4-bbcb-cc5ce8d036c8
md"Adjoint is the same as transpose for real matrices."

# ╔═╡ 72aff4b6-8703-425a-a7ef-1c421f369ae2
R',adjoint(R)

# ╔═╡ d862ff38-fd69-4314-8e38-e3373757df00
md"Any matrix can also be indexed linearly, in column-major order."

# ╔═╡ 9a6470d6-3de2-4f57-935e-8ef44f9e56b7
R[:],vec(R)

# ╔═╡ 7a342ce8-7524-44a6-bd2c-f243c90d4825
R[5]

# ╔═╡ 2fe1b8a9-1f6c-4d16-9bb4-0b088993f2d9
R .> 0.5

# ╔═╡ f0479b5b-880e-4a59-a39b-740e678ae0e1
findall(R .> 0.5)

# ╔═╡ 8c1b1669-4a3f-432a-9693-96179807d403
R[R .> 0.5]

# ╔═╡ 96ba0bde-a917-4155-bbbf-75f20b8a31dd
md"`filter` does not need the time it takes to create and fill a boolean array:"

# ╔═╡ da8d9125-5ab8-44cc-8b9f-b9b6b326793e
filter(>(0.5),R)

# ╔═╡ b5c71c6e-d866-464d-abdc-f81645ea9494
@btime R[R .> 0.5]

# ╔═╡ 6f8a8e6f-dd63-4bd4-8b3c-c0647c0fe36b
@btime filter(>(0.5),R)

# ╔═╡ 7bf38ae7-a44a-4a68-958d-95179cfaf769
md"# Copies and views"

# ╔═╡ 767c0de5-ab10-4b10-921c-a37192977039
R

# ╔═╡ 85a72ee5-c755-4b66-8234-638f54acb2af
md"Slicing an array makes a copy of the relevant contents. These arrays become independent objects."

# ╔═╡ 34ba2421-e2bf-4ec7-9203-d823e018efd2
let
	S = R[1:2,1:2]
	@. S += 1
	S,R
end

# ╔═╡ 0f2299ef-c799-4f58-8664-35d1276f4691
md"A `view` is just a reference (pointer) to contents. Either reference can change the contents."

# ╔═╡ 629c9b7a-451e-4f22-8a98-a50754e1bd70
let
	S = view(R,1:2,1:2)
	@. S += 1
	S,R
end

# ╔═╡ ac8527d5-b6d1-4ec4-a2bd-4b16f90f0f32
md"# More general arrays"

# ╔═╡ d1af1959-4486-4cdf-8de7-0585b6be2424
rand(2,3,2)

# ╔═╡ c9aaa3df-a1f1-4e60-a2db-fc22fecd6205
p = OffsetArray(v,0:3)

# ╔═╡ 60563857-4e83-43cd-8ccc-eff56abc703c
p[0]

# ╔═╡ 74369d1b-468c-4a46-b269-2d48d26f56f1
for i in 1:length(p)  # oh no
	p[i] += 1
end

# ╔═╡ add7df95-240d-460b-b14f-0f46d2f9729f
for i in eachindex(p)  # copacetic
	p[i] += 1
end

# ╔═╡ 28000052-526b-4172-bbc5-c961565f9227
for i in Base.axes(p,1)  # galaxy brain
	p[i] += 1
end

# ╔═╡ cc3da301-d403-4094-8347-0f0afb639fdf
md"""
## Component arrays

In this package, you can give the components names rather than numbers.
"""

# ╔═╡ 680418b2-c7be-4eb8-b871-ff7d1cae51e4
let
	C = ComponentArray(a=3,b=10:5:30)
	C.a,C.b
end

# ╔═╡ ce138259-10fa-4d33-9f63-bf82f0eb6ca3
let
	C = ComponentArray(a=3,b=10:5:30)
	C[:a],C[:b]
end

# ╔═╡ 61921da5-3024-4d8e-848f-54e48472447b
let
	x = ComponentArray(hares=30.,lynx=2.)
	hares,lynx = x
	∂ₜx = similar(x)
	∂ₜx.hares = 0.25hares - 0.08*hares*lynx
	∂ₜx.lynx = -0.1lynx + 0.08*hares*lynx
	∂ₜx
end

# ╔═╡ 6f2cdd47-2087-4ccd-b7cb-b4c99d66011e
md"""
## Axis arrays
In this package, you can name the axes and use noninteger indices.
"""

# ╔═╡ 6bad2a10-a46d-48f9-b673-6a2011b49347
begin
	tt = 1:0.1:6
	f = [sin,cos,sec]
	A = AxisArray([f(t) for t in tt, f in f],time=tt,func=f)
end
	

# ╔═╡ 38c6dbcf-fdba-4a2f-b3a3-9b69e36ab8d6
A[atvalue(3.0),:]

# ╔═╡ 3df761f0-3500-42b6-b1a0-77e52ec4d814
A[4.0..4.5,sin]

# ╔═╡ 99fc3b69-16f8-467a-86e8-43be9e2fcc8a
A[4,3]

# ╔═╡ 55813850-d9ef-4a00-a11a-d2bee612aa3e
q = [ sum(v) for v in eachcol(A)  ]		

# ╔═╡ 976f7f42-fd61-4765-9396-6347012c0dc6
rowidx,colidx = AxisArrays.axes(A,1),AxisArrays.axes(A,2)

# ╔═╡ b0d25568-7209-4645-825f-e309e0ba3cab
A\ones(size(A,1))

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
AxisArrays = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
BenchmarkTools = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
ComponentArrays = "b0b7db55-cfe3-40fc-9ded-d10e2dbeff66"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
OffsetArrays = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"

[compat]
AxisArrays = "~0.4.6"
BenchmarkTools = "~1.3.1"
ComponentArrays = "~0.12.0"
OffsetArrays = "~1.12.5"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[[deps.Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "af92965fb30777147966f58acb05da51c5616b5f"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.3"

[[deps.ArrayInterface]]
deps = ["ArrayInterfaceCore", "Compat", "IfElse", "LinearAlgebra", "Static"]
git-tree-sha1 = "d956c0606a3bc1112a1f99a8b2309b79558d9921"
uuid = "4fba245c-0d91-5ea0-9b3e-6abc04ee57a9"
version = "6.0.17"

[[deps.ArrayInterfaceCore]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "d618d3cf75e8ed5064670e939289698ecf426c7f"
uuid = "30b0a656-2188-435a-8636-2ec0e6a096e2"
version = "0.1.12"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.AxisArrays]]
deps = ["Dates", "IntervalSets", "IterTools", "RangeArrays"]
git-tree-sha1 = "1dd4d9f5beebac0c03446918741b1a03dc5e5788"
uuid = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
version = "0.4.6"

[[deps.BenchmarkTools]]
deps = ["JSON", "Logging", "Printf", "Profile", "Statistics", "UUIDs"]
git-tree-sha1 = "4c10eee4af024676200bc7752e536f858c6b8f93"
uuid = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
version = "1.3.1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "9489214b993cd42d17f44c36e359bf6a7c919abf"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.0"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "924cdca592bc16f14d2f7006754a621735280b74"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.1.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.ComponentArrays]]
deps = ["ArrayInterface", "ChainRulesCore", "LinearAlgebra", "Requires"]
git-tree-sha1 = "f11d593a21f0772af814b836a0266c0be3652cf7"
uuid = "b0b7db55-cfe3-40fc-9ded-d10e2dbeff66"
version = "0.12.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.IfElse]]
git-tree-sha1 = "debdd00ffef04665ccbb3e150747a77560e8fad1"
uuid = "615f187c-cbe4-4ef1-ba3b-2fcf58d6d173"
version = "0.1.1"

[[deps.IntervalSets]]
deps = ["Dates", "Random", "Statistics"]
git-tree-sha1 = "57af5939800bce15980bddd2426912c4f83012d8"
uuid = "8197267c-284f-5f27-9208-e0e47529a953"
version = "0.7.1"

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "b4975062de00106132d0b01b5962c09f7db7d880"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.12.5"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "1285416549ccfcdf0c50d4997a94331e88d68413"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Profile]]
deps = ["Printf"]
uuid = "9abbd945-dff8-562f-b5e8-e1ebf5ef1b79"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RangeArrays]]
git-tree-sha1 = "b9039e93773ddcfc828f12aadf7115b4b4d225f5"
uuid = "b3c3ace0-ae52-54e7-9d0b-2c1406fd6b9d"
version = "0.3.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Static]]
deps = ["IfElse"]
git-tree-sha1 = "5d2c08cef80c7a3a8ba9ca023031a85c263012c5"
uuid = "aedffcd0-7271-4cad-89d0-dc628f76c6d3"
version = "0.6.6"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
"""

# ╔═╡ Cell order:
# ╟─5e719d36-28be-4cbc-be19-249971f551ca
# ╠═9a18d6b7-e1c9-4688-895d-6592bebd3182
# ╠═18b242bf-4b0a-479a-946c-957b184afc5d
# ╠═a826bb6c-35f1-46c3-ada9-b6e4fca47d81
# ╠═494d4630-23d7-42c0-babd-688bb1298169
# ╠═f87a951c-2235-44fb-bb41-4567ad3361d7
# ╟─eea22231-de82-43f8-aa8d-db675fbf3e66
# ╠═2d7a0a5b-5837-4e00-a3cd-77f9045c40fb
# ╠═2f246374-89c1-4f6d-bd37-694a047308ea
# ╟─4f17cbbf-ea49-47b1-96ae-759dabb14079
# ╠═7aeb9694-8df5-4f14-9dcd-72b2f723ae34
# ╠═fd6f5dd4-ab3f-4cdb-bcd9-797e3978503e
# ╟─69777fb4-361c-4175-a551-6eb3367c3ee2
# ╟─603e3761-1645-4d6e-993e-702e8f5cce8d
# ╠═e5e8cc16-fa8c-4fba-92ad-ac04f3d70be6
# ╠═6ca7c1fb-be0a-4514-a9cd-757cb2afd89a
# ╠═645c0c4e-b3c3-43be-aceb-b84fb9bb8490
# ╠═3e0b6cd2-65f9-4f0d-98ad-12ad2132acf0
# ╟─e3de8c04-19eb-4d67-9a81-81bcd484070b
# ╟─31b78a02-dd1d-4a42-a428-b45ea77443b1
# ╠═6343e973-53f8-4126-8693-068cff515718
# ╠═234c9dd8-5112-4713-b693-7e6a883ca013
# ╠═b32d67ec-dbf6-454c-9826-5802cc6a846a
# ╠═caf65372-92a1-4aba-bd16-28539ceab9ee
# ╠═5054e90d-6232-445c-adf6-15c7a890a49e
# ╟─aad62c8e-af80-4c2a-909d-f5dea756f277
# ╟─98425426-c48d-4ee7-901b-cbc2c25bee7e
# ╠═96599224-293b-4a43-99cd-2d9333507301
# ╟─ff15462f-448b-4815-bae6-4f06970ae148
# ╠═d22f3571-4195-4f1d-9bf4-755e2a79eec1
# ╟─8e00f07f-ee79-487f-be6a-d98bd5dc4d2a
# ╠═859ec95e-aa17-42b6-81c0-4b455518e2b4
# ╟─9c5dde59-8de2-4752-8ab5-bc2226e7f925
# ╠═f7ca212c-aaa9-4408-96ec-16c6b1e5149e
# ╟─748375f2-fd0b-4c0e-b30e-e46ddcdf79b8
# ╠═c5d8ff05-1ef4-4633-ab1f-e8fa302ba811
# ╟─f02f39e0-5098-4164-b498-3f80c2439995
# ╠═88da31e2-3713-4881-b7d3-e32a237a915e
# ╟─c7523846-3187-4b56-a9ee-dca1cc2dc873
# ╠═18fad624-969f-4083-a656-735890512158
# ╠═9717091e-9cf9-4fdc-b595-c5d8166059b3
# ╟─b321b426-1c83-4c12-9cff-22ecee73c873
# ╠═1b9926f6-0ad0-472f-8661-9b74c074082e
# ╠═5f4dd927-03db-4d40-87ee-1db2c71d3db5
# ╠═76070805-6627-4253-97e2-9ffebd74104e
# ╠═f040fd06-7cb9-4f11-be20-5b0ab5583e3f
# ╠═afdb549f-dbd1-4339-917b-567f46c7df5f
# ╟─ac37dfec-71e7-47a5-ab9b-07e8d6cd140f
# ╠═3db007d3-0575-4cbf-889a-8515965a96d1
# ╟─f61ba108-e80c-4925-989f-f96e0fe5560e
# ╠═7bedb0bd-3415-4f73-9b1f-b3184d4156c6
# ╟─ed388c54-2026-4595-ada8-88bc400e1fd0
# ╠═1df6d8aa-e67c-11ec-3cca-259d877dd9ef
# ╠═dd579061-1195-43a6-a090-549e3b5edb5f
# ╠═ca68eba4-1fe5-4ffe-9706-5b02e5cb9b9b
# ╠═07ce6cb3-1f99-4941-8dce-f289ca343f5b
# ╠═a4c2eb2c-4e79-4e86-bb38-97f2028da5b2
# ╠═2e3b5f76-d21c-42cc-9133-7540721dc520
# ╠═59e23025-3ab8-4029-8de5-b874974c96a4
# ╠═6eab8b39-ec80-4e68-a4c0-ee772c533b81
# ╟─7175553d-9579-4a48-b852-6883cc71be85
# ╟─f74716db-8a21-466e-93a7-264f2c5d6dae
# ╠═a047e00a-bbdd-46ae-9a2c-b2acfddee3d9
# ╟─54c1f1af-aecf-4b26-9bc4-e3f82f6cb7d0
# ╠═374fe681-2c11-4458-9799-48d479013141
# ╠═11f4a51d-f6bb-470a-98be-4d354d2ab809
# ╟─766b3400-f05b-4c23-9d38-3c18bad2cdc0
# ╠═03ad85bf-4105-4d91-a1a5-2d34150651cb
# ╠═a7739d6f-370e-4cf3-8647-858ae12a74c5
# ╠═9c3f9d30-a21b-4145-8dbb-72edbee61493
# ╠═48eaa5c0-5a4b-44a7-adab-00e62c980177
# ╠═f7eb8c6a-d32a-46f5-8b91-8228b9a0b738
# ╟─fb5492d0-5677-4904-8f71-38e0ae14b678
# ╠═04956e52-aa75-419e-8034-cb4955a635d9
# ╠═b572191d-f35b-42bf-871d-db3a03a514f9
# ╠═01e7ef52-3bb3-44ea-bd5e-fec3d9175374
# ╟─9fb712c6-1e5e-4ef4-bbcb-cc5ce8d036c8
# ╠═72aff4b6-8703-425a-a7ef-1c421f369ae2
# ╟─d862ff38-fd69-4314-8e38-e3373757df00
# ╠═9a6470d6-3de2-4f57-935e-8ef44f9e56b7
# ╠═7a342ce8-7524-44a6-bd2c-f243c90d4825
# ╠═2fe1b8a9-1f6c-4d16-9bb4-0b088993f2d9
# ╠═f0479b5b-880e-4a59-a39b-740e678ae0e1
# ╠═8c1b1669-4a3f-432a-9693-96179807d403
# ╟─96ba0bde-a917-4155-bbbf-75f20b8a31dd
# ╠═da8d9125-5ab8-44cc-8b9f-b9b6b326793e
# ╠═b5c71c6e-d866-464d-abdc-f81645ea9494
# ╠═6f8a8e6f-dd63-4bd4-8b3c-c0647c0fe36b
# ╟─7bf38ae7-a44a-4a68-958d-95179cfaf769
# ╠═767c0de5-ab10-4b10-921c-a37192977039
# ╟─85a72ee5-c755-4b66-8234-638f54acb2af
# ╠═34ba2421-e2bf-4ec7-9203-d823e018efd2
# ╟─0f2299ef-c799-4f58-8664-35d1276f4691
# ╠═629c9b7a-451e-4f22-8a98-a50754e1bd70
# ╟─ac8527d5-b6d1-4ec4-a2bd-4b16f90f0f32
# ╠═d1af1959-4486-4cdf-8de7-0585b6be2424
# ╠═08d63c34-6642-4db7-b146-1f327605fd0d
# ╠═c9aaa3df-a1f1-4e60-a2db-fc22fecd6205
# ╠═60563857-4e83-43cd-8ccc-eff56abc703c
# ╠═74369d1b-468c-4a46-b269-2d48d26f56f1
# ╠═add7df95-240d-460b-b14f-0f46d2f9729f
# ╠═28000052-526b-4172-bbc5-c961565f9227
# ╟─cc3da301-d403-4094-8347-0f0afb639fdf
# ╠═37d0c2ed-ba86-4bc6-9bad-e58955cfbe79
# ╠═680418b2-c7be-4eb8-b871-ff7d1cae51e4
# ╠═ce138259-10fa-4d33-9f63-bf82f0eb6ca3
# ╠═61921da5-3024-4d8e-848f-54e48472447b
# ╟─6f2cdd47-2087-4ccd-b7cb-b4c99d66011e
# ╠═bad5989f-b154-4d76-9ec1-0e01a84fa07f
# ╠═6bad2a10-a46d-48f9-b673-6a2011b49347
# ╠═38c6dbcf-fdba-4a2f-b3a3-9b69e36ab8d6
# ╠═3df761f0-3500-42b6-b1a0-77e52ec4d814
# ╠═99fc3b69-16f8-467a-86e8-43be9e2fcc8a
# ╠═55813850-d9ef-4a00-a11a-d2bee612aa3e
# ╠═976f7f42-fd61-4765-9396-6347012c0dc6
# ╠═b0d25568-7209-4645-825f-e309e0ba3cab
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
