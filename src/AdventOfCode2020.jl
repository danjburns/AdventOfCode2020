module AdventOfCode2020
using Printf: @sprintf

@info "Advent of Code 2020, Dan Burns"
@info ""

# include("day_01.jl")
# include("day_02.jl")
# include("day_03.jl")
# include("day_04.jl")
# include("day_05.jl")
# include("day_06.jl")

for day in 1:25
    filename = @sprintf("day_%02d.jl", day)
    path = joinpath(@__DIR__, filename)
    isfile(path) && include(path)
end


end
