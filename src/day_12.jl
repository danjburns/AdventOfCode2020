module day12

include("inputs.jl")

ex = inputs.ex_d12()
input = inputs.input_d12()

mutable struct Ship
    pos::Array{Int}
    heading::Array{Int}
    waypoint::Array{Int}
end

parse_instruction(line) = line[1], parse(Int, line[2:end])
rot(θ) = [cosd(θ) -sind(θ); sind(θ) cosd(θ)]

function heading!(ship, act, val) 
    if     act == 'N' ship.pos += [0;1] * val
    elseif act == 'E' ship.pos += [1;0] * val
    elseif act == 'S' ship.pos += [0;-1] * val
    elseif act == 'W' ship.pos += [-1;0] * val
    elseif act == 'R' ship.heading = rot(-val) * ship.heading
    elseif act == 'L' ship.heading = rot(val) * ship.heading
    elseif act == 'F' ship.pos += ship.heading * val
    end
end

function waypoint!(ship, act, val) 
    if     act == 'N' ship.waypoint += [0;1] * val
    elseif act == 'E' ship.waypoint += [1;0] * val
    elseif act == 'S' ship.waypoint += [0;-1] * val
    elseif act == 'W' ship.waypoint += [-1;0] * val
    elseif act == 'R' ship.waypoint = rot(-val) * ship.waypoint
    elseif act == 'L' ship.waypoint = rot(val) * ship.waypoint
    elseif act == 'F' ship.pos += ship.waypoint * val
    end
end

function navigate(input, move)
    insts = parse_instruction.(input)
    ship = Ship([0;0], [1; 0], [10,1])
    [move(ship, inst...) for inst in insts]
    return sum(abs.(ship.pos))
end

part1(input) = navigate(input, heading!)
part2(input) = navigate(input, waypoint!)

@assert part1(ex) == 25
@assert part1(input) == 415
@info "Day 12, Part 1 answer: $(part1(input))"
@assert part2(ex) == 286
@assert part2(input) == 29401
@info "Day 12, Part 2 answer: $(part2(input))"

end