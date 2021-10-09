--- owner_of_sorrows
-- in1: flux a (pitch)
-- in2: flux b (duration)
-- out1: cv voice 1
-- out2: ar voice 1
-- out3: cv voice 2
-- out4: ar voice 2

output[1].scale = {2, 4, 5, 7, 9, 10, 12}
output[3].scale = {2, 5, 9, 12}

function new_level()
    return math.random(3, 10)
end

-- on TT: 'CROW.C1 n'
function ii.self.call1(tt_value)
    print("-- start --")
   repeats = tt_value
   play_note_voice_1()
   play_note_voice_2()
end

play_note_voice_1 = function()
   ar_time = input[2].volts / 11
   level = new_level()
   volts_1 = input[1].volts / 2
   output[1].volts = volts_1
   output[2] (ar(ar_time * .1, ar_time * .9, level, 'linear'))
end

output[2].done = function()
    if(repeats > 0)
    then
        repeats = repeats - 1
        play_note_voice_1()
    else
        print("-- 1 done --")
    end
end 

play_note_voice_2 = function()
   ar_time = input[2].volts / 5
   level = new_level()
   volts_1 = input[1].volts / 2
   output[3].volts = volts_1
   output[4] (ar(ar_time * .2, ar_time * .8, level, 'linear'))
end

output[4].done = function()
    if(repeats > 0)
    then
        repeats = repeats - 1
        play_note_voice_2()
    else
        print("-- 2 done --")
    end
end 
