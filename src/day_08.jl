module day08

include("inputs.jl")

ex = inputs.ex1_d8()
input = inputs.input_d8()

function parse_tape(input)
    map(input) do line
        op, arg = split(line)
        (Symbol(op), parse(Int, arg))
    end
end

function run(tape)
    accum = 0
    lines_visited = Set{Int}()
    ptr = 1

    while ptr ∉ lines_visited
        ptr > length(tape) && return (true, accum)

        op, arg = tape[ptr]
        push!(lines_visited, ptr)

        if op == :nop
            ptr += 1
        elseif op == :acc
            accum += arg
            ptr += 1
        elseif op == :jmp
            ptr += arg
        end
    end
    return (false, accum)
end

# Part 1
part1(input) = run(parse_tape(input))[2]


@assert part1(ex) == 5
@assert part1(input) == 1930
@info "Day 8, Part 1 answer: $(part1(input))"

# Part 2
function part2(input)
    tape = parse_tape(input)
    for i in eachindex(tape)
        op, arg = tape[i]
        if op == :jmp || op == :nop
            tape[i] = op == :jmp ? (:nop, arg) : (:jmp, arg)
            (was_terminated, accum) = run(tape)
            if was_terminated
                return accum
            else
                tape[i] = (op, arg)
            end
        end
    end
end

@assert part2(ex) == 8
@assert part2(input) == 1688
@info "Day 8, Part 2 answer: $(part2(input))"
end