module inputs

using Pkg
using Pipe: @pipe

cd(dirname(@__DIR__)) # move pwd up one level from this file
@info "The PWD for inputs module is: $(pwd())"
@info "The __DIR__ inputs module is: $(@__DIR__)"

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



end