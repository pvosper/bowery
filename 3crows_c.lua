--- sequins event
-- in1: trigger event
-- in2: 
-- out1: cv from sequence
-- out2: ar envelope
-- out3: pulse
-- out4: 

s = sequins
my_seq = s{2,4,s{5,9},7,s{9,12},10,s{17,12,14,9},s{17,21,24}}:step(-1)


function init()
    input[1]{ mode      = 'change'
            , threshold =  1.0
            , hysteresis = 0.01
            , direction = 'rising'
            }
end

function new_ar_time()
   return math.random(1, 3) / 10
end

function new_level()
    return math.random(88, 99) / 10
end

input[1].change = function()
    repeats = math.random(5, 11)
    ar_time = new_ar_time()
    play_note()
end

play_note = function()
    level = new_level()
    output[1].volts = my_seq() / 12
    output[2] (ar(ar_time * .05, ar_time * .95, level, 'logarithmic'))
    output[3] (pulse())
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
