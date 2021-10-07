--- S&H Experiments
-- in1: clock input
-- in2: voltage to be sampled
-- out1: sampled cv (quantized to Dm7 scale)
-- out2: ar envelope
-- out3: pan cv
-- out4:    

function init()
    input[1]{ mode      = 'change'
            , threshold =  0.1
            , hysteresis = 0.01
            , direction = 'rising'
            }
    output[3].slew = 0.1
end

input[1].change = function()
    pan = math.random(-50, 50) / 10
    attack_1 = math.random(10, 25) / 100
    release_1 = math.random(2, 7) / 10
    level_1 = math.random(20, 50) / 10
    volts_1 = input[2].volts
    output[1].scale = {2, 5, 9, 12}
    output[1].volts = volts_1
    output[2] (ar(attack_1, release_1, level_1))
    output[3].volts = pan
end
