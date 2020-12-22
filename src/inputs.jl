module inputs

using Pkg
using Pipe: @pipe

cd(dirname(@__DIR__)) # move pwd up one level from this file
# @info "The PWD for inputs module is: $(pwd())"
# @info "The __DIR__ inputs module is: $(@__DIR__)"

################
#    Day 1
################
ex_d1() = [1721, 979, 366, 299, 675, 1456]
input_d1() = readlines("input/day01.txt") .|> x->parse(Int, x)

################
#    Day 2
################
ex_d2() = @pipe "1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc" |> String.(split(_, "\n"))
input_d2() = @pipe read("input/day02.txt", String) |> String.(split(_, "\n"))

################
#    Day 3
################
ex_d3() = """..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#""" 
input_d3() = read("input/day03.txt", String);

################
#    Day 4
################
raw_ex_d4 = """ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in"""
ex_d4() = @pipe String.(split(raw_ex_d4, "\n")) |> # equiv to output of readlines(input.txt)
            join(_, "\n") |> 
            split(_, "\n\n") |> 
            split.(_, r"\s+")

input_d4() = @pipe readlines("input/day04.txt") |> 
            join(_, "\n") |> 
            split(_, "\n\n") |> 
            split.(_, r"\s+")
invalid_raw = @pipe """eyr:1972 cid:100
hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

iyr:2019
hcl:#602927 eyr:1967 hgt:170cm
ecl:grn pid:012533040 byr:1946

hcl:dab227 iyr:2012
ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

hgt:59cm ecl:zzz
eyr:2038 hcl:74454a iyr:2023
pid:3556412378 byr:2007"""
invalid_d4() = @pipe String.(split(invalid_raw, "\n")) |> # equiv to output of readlines(input.txt)
            join(_, "\n") |> 
            split(_, "\n\n") |> 
            split.(_, r"\s+")

valid_raw = """pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
hcl:#623a2f

eyr:2029 ecl:blu cid:129 byr:1989
iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

hcl:#888785
hgt:164cm byr:2001 iyr:2015 cid:88
pid:545766238 ecl:hzl
eyr:2022

iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719"""
valid_d4() = @pipe String.(split(valid_raw, "\n")) |> # equiv to output of readlines(input.txt)
            join(_, "\n") |> 
            split(_, "\n\n") |> 
            split.(_, r"\s+")

################
#    Day 5
################
input_d5() = readlines("input/day05.txt")

################
#    Day 6
################
ex1_d6() = @pipe """abcx
abcy
abcz""" |> String.(split(_, "\n")) |> join(_, "\n") |> split(_, "\n\n") |> split.(_, r"\s+")
ex2_d6() = @pipe """abc

a
b
c

ab
ac

a
a
a
a

b""" |> String.(split(_, "\n")) |> join(_, "\n") |> split(_, "\n\n") |> split.(_, r"\s+")
input_d6() = @pipe readlines("input/day06.txt") |> join(_,"\n") |> split(_, "\n\n") |> split.(_, r"\s+")

################
#    Day 7
################

ex1_d7() = @pipe """light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.""" |> String.(split(_, "\n"))
input_d7() = readlines("input/day07.txt")

################
#    Day 8
################
ex1_d8() = @pipe """nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6""" |> String.(split(_, "\n"))
input_d8() = readlines("input/day08.txt")


################
#    Day 9
################
ex1_d9() = @pipe """35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576""" |> String.(split(_, "\n")) |> parse.(Int, _)
input_d9() = parse.(Int, readlines("input/day09.txt"))

################
#    Day 10
################

ex0_d10() = @pipe """16
10
15
5
1
11
7
19
6
12
4""" |> String.(split(_, "\n")) |> parse.(Int, _)

ex1_d10() = @pipe """28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3""" |> String.(split(_, "\n")) |> parse.(Int, _)
input_d10() = parse.(Int, readlines("input/day10.txt"))

################
#    Day 11
################

ex_d11() = @pipe """L.LL.LL.LL
LLLLLLL.LL
L.L.L..L..
LLLL.LL.LL
L.LL.LL.LL
L.LLLLL.LL
..L.L.....
LLLLLLLLLL
L.LLLLLL.L
L.LLLLL.LL""" |> String.(split(_, "\n"))

ex1_d11() = @pipe """.......#.
...#.....
.#.......
.........
..#L....#
....#....
.........
#........
...#.....""" |> String.(split(_, "\n"))

ex2_d11() = @pipe """.##.##.
#.#.#.#
##...##
...L...
##...##
#.#.#.#
.##.##.""" |> String.(split(_, "\n"))

input_d11() = readlines("input/day11.txt")

################
#    Day 12
################

ex_d12() = @pipe """F10
N3
F7
R90
F11""" |> String.(split(_, "\n"))

input_d12() = readlines("input/day12.txt")

################
#    Day 13
################

ex_d13() = @pipe """939
7,13,x,x,59,x,31,19""" |> String.(split(_, "\n"))

input_d13() = @pipe """1000066
13,x,x,41,x,x,x,37,x,x,x,x,x,659,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,19,x,x,x,23,x,x,x,x,x,29,x,409,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,17""" |> String.(split(_, "\n"))


################
#    Day 14
################

ex1_d14() = """mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
mem[8] = 11
mem[7] = 101
mem[8] = 0"""

ex2_d14() = """mask = 000000000000000000000000000000X1001X
mem[42] = 100
mask = 00000000000000000000000000000000X0XX
mem[26] = 1"""

input_d14() = read("input/day14.txt", String)


################
#    Day 16
################

ex_d16() = """class: 1-3 or 5-7
row: 6-11 or 33-44
seat: 13-40 or 45-50

your ticket:
7,1,14

nearby tickets:
7,3,47
40,4,50
55,2,20
38,6,12"""


ex2_d16() = """class: 0-1 or 4-19
row: 0-5 or 8-19
seat: 0-13 or 16-19

your ticket:
11,12,13

nearby tickets:
3,9,18
15,1,5
5,14,9"""

input_d16() = read("input/day16.txt", String)

################
#    Day 17
################

ex_d17() = """.#.
..#
###"""

input_d17() = """##..#.#.
#####.##
#######.
#..#..#.
#.#...##
..#....#
....#..#
..##.#.."""


################
#    Day 18
################

ex1_d18() = "1 + 2 * 3 + 4 * 5 + 6"
ex2_d18() = "1 + (2 * 3) + (4 * (5 + 6))"
ex3_d18() = "2 * 3 + (4 * 5)"
ex4_d18() = "5 + (8 * 3 + 9 + 3 * 4 * 3)"
ex5_d18() = "5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))"
ex6_d18() = "((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2"
input_d18() = readlines("input/day18.txt")



end