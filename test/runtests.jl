using Test, AdventOfCode2020

using AdventOfCode2020:day01
@testset "Day 1" begin
    @testset "Day 1, Unit tests" begin
        @test day01.sum_two_to_2020(day01.ex) == 514579
        @test day01.sum_three_to_2020(day01.ex) == 241861950
    end

    @testset "Day 1, Puzzle tests (post hoc)" begin
        @test day01.sum_two_to_2020(day01.input) == 996996
        @test day01.sum_three_to_2020(day01.input) == 9210402
    end
end

using AdventOfCode2020:day02
@testset "Day 2" begin
    @testset "Day 2, Unit tests" begin
        @test day02.count_valids(day02.ex) == 2
        @test day02.count_valids_p2(day02.ex) == 1
    end

    @testset "Day 2, Puzzle tests (post hoc)" begin
        @test day02.count_valids(day02.input) == 416
        @test day02.count_valids_p2(day02.input) == 688
    end
end

using AdventOfCode2020:day03
@testset "Day 3" begin
    @testset "Day 3, Unit tests" begin
        @test day03.count_trees(day03.ex) == 7
        @test day03.assess_slopes(day03.ex) == 336
    end

    @testset "Day 3, Puzzle tests (post hoc)" begin
        @test day03.count_trees(day03.input) == 189
        @test day03.assess_slopes(day03.input) == 1718180100
    end
end

using AdventOfCode2020:day04
@testset "Day 4" begin
    @testset "Day 4, Unit tests" begin
        @test day04.count_valid_pp(day04.ex)[1] == 2
        @test day04.count_valid_pp(day04.invalid)[2] == 0
        @test day04.count_valid_pp(day04.valid)[2] == 4
    end

    @testset "Day 4, Puzzle tests (post hoc)" begin
        @test day04.count_valid_pp(day04.input)[1] == 206
        @test day04.count_valid_pp(day04.input)[2] == 123
    end
end

using AdventOfCode2020:day05
@testset "Day 5" begin
    @testset "Day 5, Unit tests" begin
        @test day05.parse_bp("BFFFBBFRRR") == 567
        @test day05.parse_bp("FFFBBBFRRR") == 119
        @test day05.parse_bp("BBFFBBFRLL") == 820
    end

    @testset "Day 5, Puzzle tests (post hoc)" begin
        @test day05.highest_id() == 922
        @test day05.find_seat()[1] == 747
    end
end

using AdventOfCode2020:day06
@testset "Day 6" begin
    @testset "Day 6, Unit tests" begin
        @test day06.count_yesses(day06.ex1) == 6
        @test day06.count_yesses(day06.ex2) == 11
    end

    @testset "Day 6, Puzzle tests (post hoc)" begin
        @test day06.count_yesses(day06.input) == 6506
    end
end