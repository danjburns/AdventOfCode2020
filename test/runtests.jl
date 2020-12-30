using Test, Pkg

# no need to change pwd for running tests

using AdventOfCode2020:day23
@testset "Day 23" begin
    @testset "Day 23, Unit tests" begin
        @test day23.part1(day23.ex) == "67384529"
    end

    @testset "Day 23, Puzzle tests (post hoc)" begin
        @test day23.part1(day23.input) == "69852437"
    end
end

using AdventOfCode2020:day22
@testset "Day 22" begin
    @testset "Day 22, Unit tests" begin
        @test day22.part1(day22.ex) == 306
        @test day22.part2(day22.ex) == 291
    end

    @testset "Day 22, Puzzle tests (post hoc)" begin
        @test day22.part1(day22.input) == 33010
        @test day22.part2(day22.input) == 32769
    end
end

using AdventOfCode2020:day21
@testset "Day 21" begin
    @testset "Day 21, Unit tests" begin
        @test day21.part1(day21.ex) == 5  
        @test day21.part2(day21.ex) == "mxmxvkd,sqjhc,fvjkl"
    end

    @testset "Day 21, Puzzle tests (post hoc)" begin
        @test day21.part1(day21.input) == 2098
        @test day21.part2(day21.input) == "ppdplc,gkcplx,ktlh,msfmt,dqsbql,mvqkdj,ggsz,hbhsx"
    end
end

using AdventOfCode2020:day20
@testset "Day 20" begin
    @testset "Day 20, Puzzle tests (post hoc)" begin
        @test_skip day20.part1(day20.input) == nothing
        @test_skip day20.part2(day20.input) == nothing
    end
end

using AdventOfCode2020:day19
@testset "Day 19" begin
    @testset "Day 19, Puzzle tests (post hoc)" begin
        @test day19.part1(day19.input) == 182
        @test day19.part2(day19.input) == 334
    end
end

using AdventOfCode2020:day18
@testset "Day 18" begin
    @testset "Day 18, Puzzle tests (post hoc)" begin
        @test day18.part1(day18.input) == 800602729153
        @test day18.part2(day18.input) == 92173009047076
    end
end

using AdventOfCode2020:day17
@testset "Day 17" begin
    @testset "Day 17, Unit tests" begin
        @test day17.part1(day17.ex) == 112  
        @test day17.part2(day17.ex) == 848
    end

    @testset "Day 17, Puzzle tests (post hoc)" begin
        @test day17.part1(day17.input) == 280
        @test day17.part2(day17.input) == 1696
    end
end

using AdventOfCode2020:day16
@testset "Day 16" begin
    @testset "Day 16, Puzzle tests (post hoc)" begin
        @test day16.part1(day16.input) == 21081
        @test day16.part2(day16.input) == 314360510573
    end
end

using AdventOfCode2020:day15
@testset "Day 15" begin
    @testset "Day 15, Unit tests" begin
        @test day15.part1([3,1,2]) == 1836 
        @test day15.part2([3,1,2]) == 362 
    end
    
    @testset "Day 15, Puzzle tests (post hoc)" begin
        @test day15.part1([6,4,12,1,20,0,16]) == 475
        @test day15.part2([6,4,12,1,20,0,16]) == 11261
    end
end

using AdventOfCode2020:day14
@testset "Day 14" begin
    @testset "Day 14, Unit tests" begin
        @test day14.part1(day14.ex1) == 165
        @test day14.part2(day14.ex2) == 208
    end

    @testset "Day 14, Puzzle tests (post hoc)" begin
        @test day14.part1(day14.input) == 9967721333886
        @test day14.part2(day14.input) == 4355897790573
    end
end

using AdventOfCode2020:day13
@testset "Day 13" begin
    @testset "Day 13, Unit tests" begin
        @test day13.part1(day13.ex) == 295
        @test day13.part2(day13.ex) == 1068781
    end

    @testset "Day 13, Puzzle tests (post hoc)" begin
        @test day13.part1(day13.input) == 246
        @test day13.part2(day13.input) == 939490236001473
    end
end

using AdventOfCode2020:day12
@testset "Day 12" begin
    @testset "Day 12, Unit tests" begin
        @test day12.part1(day12.ex) == 25
        @test day12.part2(day12.ex) == 286
    end

    @testset "Day 12, Puzzle tests (post hoc)" begin
        @test day12.part1(day12.input) == 415
        @test day12.part2(day12.input) == 29401
    end
end

using AdventOfCode2020:day11
@testset "Day 11" begin
    @testset "Day 11, Unit tests" begin
        @test day11.part1(day11.ex) == 37
        @test day11.part2(day11.ex) == 26
    end

    @testset "Day 11, Puzzle tests (post hoc)" begin
        @test day11.part1(day11.input) == 2273
        @test day11.part2(day11.input) == 2064
    end
end

using AdventOfCode2020:day10
@testset "Day 10" begin
    @testset "Day 10, Unit tests" begin
        @test day10.part1(day10.ex1) == 220
        @test day10.part2(day10.ex0) == 8
        @test day10.part2(day10.ex1) == 19208
    end

    @testset "Day 10, Puzzle tests (post hoc)" begin
        @test day10.part1(day10.input) == 2176
        @test day10.part2(day10.input) == 18512297918464
    end
end

using AdventOfCode2020:day09
@testset "Day 9" begin
    @testset "Day 9, Unit tests" begin
        @test day09.first_invalid(day09.ex, 5) == 127
        @test day09.part2(day09.ex, 5) == 62
    end

    @testset "Day 9, Puzzle tests (post hoc)" begin
    @test day09.first_invalid(day09.input) == 556543474
    @test day09.part2(day09.input, 25) == 76096372
    end
end

using AdventOfCode2020:day08
@testset "Day 8" begin
    @testset "Day 8, Unit tests" begin
        @test day08.part1(day08.ex) == 5
        @test day08.part2(day08.ex) == 8
    end

    @testset "Day 8, Puzzle tests (post hoc)" begin
        @test day08.part1(day08.input) == 1930
        @test day08.part2(day08.input) == 1688
    end
end


using AdventOfCode2020:day07
@testset "Day 7" begin
    @testset "Day 7, Unit tests" begin
        @test day07.part1(day07.ex) == 4
        @test day07.part2(day07.ex) == 32
    end

    @testset "Day 7, Puzzle tests (post hoc)" begin
        @test day07.part1(day07.input) == 211
        @test day07.part2(day07.input) == 12414
    end
end

using AdventOfCode2020:day06
@testset "Day 6" begin
    @testset "Day 6, Unit tests" begin
        @test day06.count_yesses(day06.ex1)[1] == 6
        @test day06.count_yesses(day06.ex2)[1] == 11
        @test day06.count_yesses(day06.ex2)[2] == 6
    end

    @testset "Day 6, Puzzle tests (post hoc)" begin
        @test day06.count_yesses(day06.input)[1] == 6506
        @test day06.count_yesses(day06.input)[2] == 3243
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
        @test day05.highest_id(day05.input) == 922
        @test day05.find_seat(day05.input)[1] == 747
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