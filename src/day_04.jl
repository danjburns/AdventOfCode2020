module day04
using Pipe: @pipe

raw_ex = """ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in"""
ex = @pipe String.(split(raw_ex, "\n")) |> # equiv to output of readlines(input.txt)
            join(_, "\n") |> 
            split(_, "\n\n") |> 
            split.(_, r"\s+")

input = @pipe readlines("../input/day04.txt") |> 
            join(_, "\n") |> 
            split(_, "\n\n") |> 
            split.(_, r"\s+")

function count_valid_pp(input)
    passports = [Dict{String, String}(split.(blob, ":")) for blob in input]
    required = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
    counts = [0, 0]
    # Part 1 test
    for p in passports
        counts[1] += all([haskey(p, req) for req in required]) ? 1 : 0
    end

    # Part 2 test
    eyecolors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
    for p in passports
        height = match(r"^(\d+)(\w+)$", get(p, "hgt", ""))
        counts[2] += (
            all([haskey(p, req) for req in required]) &&
            1920 <= parse(Int, get(p, "byr", "-1")) <= 2002 &&
            2010 <= parse(Int, get(p, "iyr", "-1")) <= 2020 &&
            2020 <= parse(Int, get(p, "eyr", "-1")) <= 2030 &&
            height isa RegexMatch && (
                (height[2] == "cm" && (150 <= parse(Int, height[1]) <= 193)) ||
                (height[2] == "in" && (59  <= parse(Int, height[1]) <= 76))) &&
            occursin(r"^#[a-f0-9]{6}$", get(p, "hcl", "-1")) &&
            get(p, "ecl", "-1") ∈ eyecolors &&
            occursin(r"^\d{9}$", get(p, "pid", "-1")) &&
            true ? 1 : 0)

    end

    return counts
end

@assert count_valid_pp(ex)[1] == 2
@info "Day 4, Part 1 answer: $(count_valid_pp(input)[1])"


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
invalid = @pipe String.(split(invalid_raw, "\n")) |> # equiv to output of readlines(input.txt)
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
valid = @pipe String.(split(valid_raw, "\n")) |> # equiv to output of readlines(input.txt)
            join(_, "\n") |> 
            split(_, "\n\n") |> 
            split.(_, r"\s+")

@assert count_valid_pp(invalid)[2] == 0
@assert count_valid_pp(valid)[2] == 4
@info "Day 4, Part 2 answer: $(count_valid_pp(input)[2])"

end