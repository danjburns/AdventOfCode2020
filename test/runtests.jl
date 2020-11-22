using Test, AdventOfCode2020

@testset "Day 1" begin
    @testset "Day 1, Unit tests" begin
        @test fuel(12) == 2
        @test fuel(14) == 2
        @test fuel(1969) == 654
        @test fuel(100756) == 33583

        @test fuel_recurs(14) == 2
        @test fuel_recurs(1969) == 966
        @test fuel_recurs(100756) == 50346
    end

    @testset "Day 1, Puzzle tests (post hoc)" begin
        day01_input = readlines("input/day01.txt") .|> x->parse(Int, x)
        @test fuel.(day01_input) |> sum == 3_406_527
        @test fuel_recurs.(day01_input) |> sum == 5_106_932
    end
end

@testset "Day 2" begin
    @test_skip day2(1) == 2
end