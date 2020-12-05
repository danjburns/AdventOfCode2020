using Test, AdventOfCode2020

@testset "Day 1" begin
    @testset "Day 1, Unit tests" begin
        day01_ex1 = [1721, 979, 366, 299, 675, 1456]
        @test sum_two_to_2020(day01_ex1) == 514579
        @test sum_three_to_2020(day01_ex1) == 241861950
    end

    @testset "Day 1, Puzzle tests (post hoc)" begin
        day01_input = readlines("../input/day01.txt") .|> x->parse(Int, x)
        @test sum_two_to_2020(day01_input) == 996996
        @test sum_three_to_2020(day01_input) == 9210402
    end
end

@testset "Day 2" begin
    @testset "Day 2, Unit tests" begin
        day02_ex1 = 
        """1-3 a: abcde
        1-3 b: cdefg
        2-9 c: ccccccccc""" |> x->String.(split(x, "\n"))
        @test count_valids(day02_ex1) == 2
        @test count_valids_p2(day02_ex1) == 1
    end

    @testset "Day 2, Puzzle tests (post hoc)" begin
        day02_input = read("../input/day02.txt", String) |> x->String.(split(x, "\n"))
        @test count_valids(day02_input) == 416
        @test count_valids_p2(day02_input) == 688
    end
end

@testset "Day 3" begin
    @testset "Day 3, Puzzle tests (post hoc)" begin
        day03_input = read("../input/day03.txt", String)
        @test count_trees(day03_input) == 189
        @test assess_slopes(day03_input) == 1718180100
    end
end
