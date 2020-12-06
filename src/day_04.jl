module day04
using Pipe: @pipe

include("inputs.jl")
ex = inputs.ex_d4
invalid = inputs.invalid_d4
valid = inputs.valid_d4
input = inputs.input_d4

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

@assert count_valid_pp(invalid)[2] == 0
@assert count_valid_pp(valid)[2] == 4
@info "Day 4, Part 2 answer: $(count_valid_pp(input)[2])"

end