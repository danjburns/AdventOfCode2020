module day18

include("inputs.jl")
ex1 = inputs.ex1_d18()
ex2 = inputs.ex2_d18()
ex3 = inputs.ex3_d18()
ex4 = inputs.ex4_d18()
ex5 = inputs.ex5_d18()
ex6 = inputs.ex6_d18()
input = inputs.input_d18()

# Part 1
"""Use the power of Julia to define a new binary operator ⨦ (plussim)
this operator will perform multiplcation, but be parsed as having 
the same precendence as addition."""

⨦(a,b) = a * b

proc1(in) = eval(Meta.parse(replace(in, "*"=>"⨦")))

@assert proc1(ex1) == 71
@assert proc1(ex2) == 51
@assert proc1(ex3) == 26
@assert proc1(ex4) == 437
@assert proc1(ex5) == 12240
@assert proc1(ex6) == 13632

part1(input) = sum([proc1(line) for line in input])
@info "Day 18, Part 1 answer: $(part1(input))"


# Part 2
⨱(a,b) = a + b 

proc2(in) = eval(Meta.parse(replace(replace(in, "*"=>"⨦"), "+"=>"⨱")))

@assert proc2(ex1) == 231
@assert proc2(ex2) == 51
@assert proc2(ex3) == 46
@assert proc2(ex4) == 1445
@assert proc2(ex5) == 669060
@assert proc2(ex6) == 23340

part2(input) = sum([proc2(line) for line in input])
@info "Day 18, Part 2 answer: $(part2(input))"

end