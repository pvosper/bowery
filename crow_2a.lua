-- from @rdfm

my_seq = sequins{0,2,4,5,7,9,10}:step(2)
at_seq = sequins{0.1,0.2,3,0.5}
rl_seq = sequins{0.1,0.2,2}

function init()
    input[1].mode('change')
    output[2].action = ar(dyn{at=0.1},dyn{rl=0.1},8,'logarithmic')
end 

input[1].change = function()
    my_func()
end 

my_func = function()
    output[1].volts = my_seq() / 12
    output[2].dyn.at = at_seq()
    output[2].dyn.rl = rl_seq()
    output[2]()
end 

output[2].done = function()
    my_func()
end 