using Test,Circles


@testset "Properties" begin
    c = Circle([1,1],3)
    @test center(c) == [1.,1.]
    @test perimeter(c) ≈ 6π
    @test area(c) ≈ 9π
end

@testset "Translation" begin 
    c = Circle([-1,2],3)
    @test center(c+[3,7]) ≈ [2,9]
    @test area(c-[1,0]) == area(c)
end
