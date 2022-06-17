
x = randn(500);
y = 2x.^2 + randn(500);

layout = @layout [ a{0.85w} b; c d{0.8h} ]
plt = plot(;layout,link=:both,showaxis=false)
scatter!(x,y,subplot=3,m=3,xaxis="x",yaxis="y",showaxis=:xy)
plot!(;subplot=2,frame=:none)
histogram!(x,subplot=1,xticks=[],yticks=[30,60,90])
histogram!(y,subplot=4,orientation=:horizontal,xticks=[40,80,120],yticks=[])