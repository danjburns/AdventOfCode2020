module day23

using CircularList, ProgressMeter

ex = "389125467"
input = "925176834"


# first cup in list is current cup (cups is already shifted)
import Base: pop!
function pop!(cups::CircularList.List{T}) where T 
    val = current(cups).data; delete!(cups); forward!(cups)
    return val
end

function make_lookup(cups)
    lookup = Dict{Int, CircularList.Node{Int}}()
    for i in 1:length(cups)
        node = current(cups)
        lookup[node.data] = node
        forward!(cups)
    end
    return lookup
end

pickup3!(cups) = [pop!(cups) for _ in 1:3]

function place3!(cups, items, lookup) 
    for item in items
        insert!(cups, item);
        lookup[item] = current(cups)
    end
end

function play(cups, moves; verbose = false)

    lo = minimum(cups)
    hi = maximum(cups)
    lookup = make_lookup(cups)

    @showprogress for move in 1:moves

        verbose && println("-- move $move --")
        verbose && println("cups: ", cups)

        curr = head(cups).data

        # pickup three cups immediately CW of current cup
        forward!(cups)       # move pointer CW by one
        pu3 = pickup3!(cups) # pickup those three cups

        verbose && println("pick up: ", pu3)

        # get desitination cup
        dest = curr - 1
        if dest < lo
            dest = hi
        end
        while dest ∈ pu3
            dest -= 1
            if dest < lo
                dest = hi
            end
        end
        verbose && println("destination: ", dest)
        # jump!(cups, dest)
        jump!(cups, lookup[dest])

        # Place three cups immediately CW of dest
        place3!(cups, pu3, lookup)

        # Select new curr cup. immediately CW of curr cup
        # jump!(cups, curr)   # advance pointer to curr
        jump!(cups, lookup[curr])   # advance pointer to curr
        forward!(cups)              # then move one more

        verbose && println()
    end

    jump!(cups, lookup[1]) # set pointer to cup #1 and return
    return cups
end


function part1(input)
    cups = circularlist([parse(Int, c) for c in input])
    res = play(cups, 100, verbose=false)
    # jump!(res, lookup[1])
    return join(collect(res)[2:end])
end

@assert part1(ex) == "67384529"
@info "Day 23, Part 1 answer: $(part1(input))"

function part2(input)
    c1 = [parse(Int, c) for c in input]
    cups = circularlist(vcat(c1, collect(10:1_000_000)));
    res = play(cups, 10_000_000, verbose=false)
    return res.current.next.data * res.current.next.next.data
    # return res
end

@info "Day 23, Part 2 answer: 91408386135"

""" Takes ~40s to solve part 2. 
julia> part2(input)
Progress: 100%|██████████████████████████████████████████████████| Time: 0:00:41
91408386135
"""

end