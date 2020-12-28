module day22

include("inputs.jl")

ex = inputs.ex_d22()
input = inputs.input_d22()

function parse_inputs(input)
    p1blob, p2blob = split(input, "\n\n")
    map([p1blob, p2blob]) do deck
        parse.(Int, split(deck, "\n")[2:end])
    end
end

# Part 1
function play(hands)
    while !any(isempty.(hands))
        cards = popfirst!.(hands)
        if cards[1] > cards[2]
            push!(hands[1], cards...)
        else
            push!(hands[2], reverse(cards)...)
        end
    end
    return hands
end

function score(hands)
    score = 0
    for hand in hands; if !isempty(hand)
        score += sum([card*ind for (ind, card) in enumerate(reverse(hand))])
    end; end
    return score
end

part1(input) = parse_inputs(input) |> play |> score
@assert part1(ex) == 306
@info "Day 22, Part 1 answer: $(part1(input))"


# Part 2
function apply_win!(hands, cards, winner)
    push!(hands[winner], popat!(cards, winner))
    push!(hands[winner], pop!(cards))
end


function play_rc(hands)
    seen_before = Set()

    while !any(isempty.(hands))
        if hash(hands) ∈ seen_before
            return (1, hands)
        else
            push!(seen_before, hash(hands))
        end

        cards = popfirst!.(hands)   # draw cards

        if all(length.(hands) .>= cards)
            newhands = deepcopy(getindex.(hands, UnitRange.(1, cards)))
            (winner, _) = play_rc(newhands)
        else
            winner = cards[1] > cards[2] ? 1 : 2
        end

        apply_win!(hands, cards, winner)

    end

    winner = isempty(hands[1]) ? 2 : 1
    return (winner, hands)
end

part2(input) = parse_inputs(input) |> play_rc |> last |> score
@assert part2(ex) == 291
@info "Day 22, Part 2 answer: $(part2(input))"

end