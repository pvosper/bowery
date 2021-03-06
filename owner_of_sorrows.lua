--- owner_of_sorrows
-- in1: flux a (pitch)
-- in2: flux b (duration)
-- out1: cv voice 1
-- out2: ar voice 1
-- out3: cv voice 2
-- out4: ar voice 2

output[1].scale = {2, 4, 5, 7, 9, 10, 12}
output[3].scale = {2, 5, 9, 12}

s = sequins
o_seq = s{2,s{4,7},5,s{4,7,10},9}

function new_level()
    return math.random(10)
end

function ii.self.call1(tt_arf)
    repeats = 0
    arf = tt_arf / 10
    level = new_level()
    output[1].volts = o_seq() / 12
    output[2] (ar(arf * .1, arf * .9, level, 'logarithmic'))
end

-- on TT: 'CROW.C3 75 47 21'
function ii.self.call3(tt1, tt2, tt3)
    repeats = tt1
    ar_factor_1 = tt2
    ar_factor_2 = tt3
    play_note_voice_1()
    play_note_voice_2()
end

play_note_voice_1 = function()
    ar_time = input[2].volts / ar_factor_1
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
    end
end 

play_note_voice_2 = function()
    ar_time = input[2].volts / ar_factor_2
    level = new_level()
    volts_1 = input[1].volts / 3
    output[3].volts = volts_1
    output[4] (ar(ar_time * .2, ar_time * .8, level, 'linear'))
end

output[4].done = function()
    if(repeats > 0)
    then
        repeats = repeats - 1
        play_note_voice_2()
    end
end 
