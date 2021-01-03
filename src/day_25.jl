module day25

using Base.Iterators

ex = """5764801
17807724"""

input = """10604480
4126658"""

parse_input(input) = parse.(BigInt, split(input, "\n"))

function tf(sn, ls)
    val = 1
    for i = 1:ls
        val *= sn
        val = rem(val, 20201227)
    end
    return val
end
@assert tf(7, 8) == 5764801
@assert tf(7, 11) == 17807724

function break_encryption(input)
    pub_keys = parse_input(input)

    # work out card's loop size
    lsc = find_ls(pub_keys[1])

    # @assert tf(pub_keys[1], lss[2]) == tf(pub_keys[2], lss[1])
    encryption_key = tf(pub_keys[2], lsc)
    return encryption_key
end


function find_ls(pub_key)
    val = 1
    for ls in countfrom(1)
        val *= 7
        val %= 20201227
        val == pub_key && return ls
    end
end

part1(input) = break_encryption(input)
@assert part1(ex) == 14897079
@info "Day 25, Part 1 answer: $(part1(input))"

end
