module AdventOfCode2020
using Printf: @sprintf

@info "Advent of Code 2020, Dan Burns"
@info ""

for day in 1:25
    filename = @sprintf("day_%02d.jl", day)
    path = joinpath(@__DIR__, filename)
    isfile(path) && include(path)
end

end
