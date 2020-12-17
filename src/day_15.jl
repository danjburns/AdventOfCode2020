module day15

function play_game(input, turns)
    seen = Dict(x=>i for (i,x) in enumerate(input[1:end-1]))
    lastnum = input[end]
    for i in length(input):(turns-1)
        next = lastnum in keys(seen) ? i - seen[lastnum] : 0
        seen[lastnum] = i
        lastnum = next
    end
    lastnum
end

part1(input) = play_game(input, 2020)
part2(input) = play_game(input, 30_000_000)

@assert part1([0,3,6]) == 436
@assert part1([3,1,2]) == 1836
@assert part2([3,1,2]) == 362

input = [6,4,12,1,20,0,16]
@info "Day 15, Part 1 answer: $(part1(input))"
@info "Day 15, Part 2 answer: $(part2(input))"


end