--- sequins event
-- in1: trigger event
-- in2: 
-- out1: cv from sequence
-- out2: ar envelope
-- out3: 
-- out4: 

s = sequins
my_seq = s{2,4,s{5,9},7,s{9,12},10,s{17,12,14,9},s{17,21,24}}


function init()
    input[1]{ mode      = 'change'
            , threshold =  1.0
            , hysteresis = 0.01
            , direction = 'rising'
            }
end

function new_ar_time()
   return math.random(3, 13) / 10
end

function new_level()
    return math.random(11, 99) / 10
end

input[1].change = function()
    repeats = math.random(4, 10)
    play_note()
end

play_note = function()
    ar_time = new_ar_time()
    level = new_level()
    output[1].volts = my_seq() / 12
    output[2] (ar(ar_time * .1, ar_time * .9, level, 'logarithmic'))
end

output[2].done = function()
    if(repeats > 0)
    then
        repeats = repeats - 1
        print(repeats)
        play_note()
    else
        print("-- done --")
    end
end 
