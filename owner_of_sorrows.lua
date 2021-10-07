--- owner_of_sorrows
-- in1: flux a (pitch)
-- in2: flux b (duration)
-- out1: cv voice 1
-- out2: ar voice 1
-- out3: cv voice 2
-- out4: ar voice 2

output[1].scale = {2, 4, 5, 7, 9, 10, 12}
output[2].scale = {2, 5, 9, 12}

function vos(value, offset, scale_factor)
    return (value + offset) / scale_factor
end

function new_ar_time()
   return math.random(1, 5) / 10
end

function new_level()
    return math.random(50, 100) / 10
end

-- on TT: 'CROW.C1 n'
function ii.self.call1(tt_value)
   repeats = tt_value
   play_note()
end

play_note = function()
   ar_time = new_ar_time()
   level = new_level()
   volts_1 = input[2].volts
   output[1].volts = volts_1
   output[2] (ar(ar_time * .075, ar_time * .925, level, 'logarithmic'))
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
