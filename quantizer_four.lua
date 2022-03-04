--- Simple Quantizer
-- in1: trigger input
-- in2: voltage to be sampled
-- out1: [in2] chromatic (shortcut = '{}')
-- out2: [in2] hexatonic blues scale
-- out3: [in2] hexatonic (outer ring)
-- out4: [in2] dorian

output[1].scale = {}
output[2].scale = {0, 3, 5, 6, 7, 10}
output[3].scale = {0, 2, 4, 8, 10}
output[4].scale = {0, 2, 3, 5, 7, 9, 10}

function init()
    input[1].mode('change',1,0.1,'rising')
end

function quantize()
    v = input[2].volts * .4 -- 0Control range: 0-5v
    output[1].volts = v
    output[2].volts = v
    output[3].volts = v
    output[4].volts = v
end

input[1].change = function()
    delay(quantize, 0.001)
end
