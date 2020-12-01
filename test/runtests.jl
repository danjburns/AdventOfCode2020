using Test, AdventOfCode2020

@testset "Day 1" begin
    @testset "Day 1, Unit tests" begin
        day01_ex1 = [1721, 979, 366, 299, 675, 1456]
        @test sum_two_to_2020(day01_ex1) == 514579
        @test sum_three_to_2020(day01_ex1) == 241861950
    end

    @testset "Day 1, Puzzle tests (post hoc)" begin
        day01_input = readlines("input/day01.txt") .|> x->parse(Int, x)
        @test sum_two_to_2020(day01_input) == 996996
        @test sum_three_to_2020(day01_input) == 9210402
    end
end

