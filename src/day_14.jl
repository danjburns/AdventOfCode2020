module day14

struct Part1 end
struct Part2 end

include("inputs.jl")

ex1 = inputs.ex1_d14()
ex2 = inputs.ex2_d14()
input = inputs.input_d14()

function parse_input(input)
    lines = split(input, "\n")
    memrx = r"mem\[(\d+)\]"
    instructions = []
    for line in lines
        first, last= split(line, " = ")
        if startswith(line, "mem")
            idx = parse(Int, match(memrx, first)[1])
            val = parse(Int, last)
            msk = ""
        elseif startswith(line, "mask")
            msk = lpad(last, 64, '.') # make mask 64 bits for easy comparison
            idx, val = missing, missing
        end
        push!(instructions, (idx=idx, val=val, msk=msk))
    end
    return instructions
end

test_mask = "............................XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X"
@assert parse_input(ex1)[1].msk == test_mask

# Part 1
function apply_mask(p::Part1, mask, val)
    result = Array{Char,1}()
    valbit = bitstring(UInt64(val))
    for bit = 29:64
        if mask[bit] == 'X'
            push!(result, valbit[bit])
        elseif mask[bit] == '1'
            push!(result, '1')
        elseif mask[bit] == '0'
            push!(result, '0')
        end
    end
    parse(Int, String(result), base=2)
end

@assert apply_mask(Part1(), test_mask, 11) == 73
@assert apply_mask(Part1(), test_mask, 101) == 101
@assert apply_mask(Part1(), test_mask, 0) == 64

write!(p::Part1, memory, mask, i) = memory[i.idx] = apply_mask(p, mask, i.val)


function initialize_program(p::Union{Part1,Part2}, input)
    insts = parse_input(input)
    memory = Dict{Int, Int}()
    mask = String(['X' for _ in 1:64])

    for i in insts
        if !isempty(i.msk)
            mask = i.msk
        else
            write!(p, memory, mask, i)
        end
    end
    return sum(values(memory))
end

part1(input) = initialize_program(Part1(), input)
@assert part1(ex1) == 165
@info "Day 14, Part 1 answer: $(part1(input))"

# Part 2
function apply_mask(p::Part2, mask, addr)
    result = Array{Char,1}()
    addrbit = bitstring(UInt64(addr))
    for bit = 29:64
        if mask[bit] == 'X'
            push!(result, 'X')
        elseif mask[bit] == '1'
            push!(result, '1')
        elseif mask[bit] == '0'
            push!(result, addrbit[bit])
        end
    end
    
    addrs = [result]
    while 'X' ∈ addrs[1]
        x = popfirst!(addrs)
        push!(addrs, replace(x, 'X'=>'0', count=1))
        push!(addrs, replace(x, 'X'=>'1', count=1))
    end
    [parse(Int, String(addr), base=2) for addr in addrs]
end

test_mask2 = lpad("000000000000000000000000000000X1001X", 64, '.')
@assert apply_mask(Part2(), test_mask2, 42) == [26, 27, 58, 59]

function write!(p::Part2, memory, mask, i)
    addrs = apply_mask(p, mask, i.idx)
    [memory[addr] = i.val for addr in addrs]
end

part2(input) = initialize_program(Part2(), input)
@assert part2(ex2) == 208
@info "Day 14, Part 2 answer: $(part2(input))"

end 