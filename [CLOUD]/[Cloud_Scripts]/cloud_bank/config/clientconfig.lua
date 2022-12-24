B_SERVICE = {}

B_SERVICE.SharedObject = {
    ["Client"] = "esx:getSharedObject",
    ["Server"] = "esx:getSharedObject",
}

B_SERVICE.Title = "Cloud <span>BANK</span>"
B_SERVICE.Subtitle = "CLOUD V"

B_SERVICE.Blip = {
    enabled = {
        atm = false, 
        bank = true
    },
    sprite = 277, -- 108
    display = 4,
    scale = 1.0,
    color = 77,
    shortrange = true,
    text = "Bank"
}

B_SERVICE.BankingPositions = {
    -- Banks
    {coords = vector3(241.727, 220.706, 106.286), type = "bank"},
	{coords = vector3(150.266, -1040.203, 29.374), type = "bank"},
	{coords = vector3(-1212.980, -330.841, 37.787), type = "bank"},
	{coords = vector3(-2962.582, 482.627, 15.703), type = "bank"},
	{coords = vector3(-112.202, 6469.295, 31.626), type = "bank"},
	{coords = vector3(314.187, -278.621, 54.170), type = "bank"},
	{coords = vector3(-351.534, -49.529, 49.042), type = "bank"},
	{coords = vector3(1175.064, 2706.643, 38.094), type = "bank"},
	{coords = vector3(-1063.94, -2745.75, 21.34), type = "bank"},
	{coords = vector3(-1080.85, -2793.58, 21.35), type = "bank"},

    -- ATMs
	{coords = vector3(-1074.38, -827.45, 27.04), type = "atm"}, --PD
	{coords = vector3(-1074.17, -827.45, 19.04), type = "atm"}, --PD
	{coords = vector3(-1110.3, -836.71, 19.0), type = "atm"}, --PD
	{coords = vector3(-1839.22, -363.35, 49.39), type = "atm"}, --KRANKENHAUS
	{coords = vector3(-1840.99, -361.7, 49.39), type = "atm"}, --KRANKENHAUS
	{coords = vector3(-1337.54, -1069.26, 11.47), type = "atm"}, --MIRROR
	{coords = vector3(-2353.56, 3257.64, 92.9), type = "atm"}, --BUNDESWEHR
	{coords = vector3(5143.48, -4955.06, 14.36), type = "atm"}, --CAYO
	{coords = vector3(903.65, -163.99, 74.17), type = "atm"}, --TAXI
	{coords = vector3(-386.733, 6045.953, 31.501), type = "atm"},
	{coords = vector3(-284.037, 6224.385, 31.187), type = "atm"},
	{coords = vector3(-284.037, 6224.385, 31.187), type = "atm"},
	{coords = vector3(-135.165, 6365.738, 31.101), type = "atm"},
	{coords = vector3(-110.753, 6467.703, 31.784), type = "atm"},
	{coords = vector3(-94.9690, 6455.301, 31.784), type = "atm"},
	{coords = vector3(155.4300, 6641.991, 31.784), type = "atm"},
	{coords = vector3(174.6720, 6637.218, 31.784), type = "atm"},
	{coords = vector3(1703.138, 6426.783, 32.730), type = "atm"},
	{coords = vector3(1735.114, 6411.035, 35.164), type = "atm"},
	{coords = vector3(1702.842, 4933.593, 42.051), type = "atm"},
	{coords = vector3(1967.333, 3744.293, 32.272), type = "atm"},
	{coords = vector3(1821.917, 3683.483, 34.244), type = "atm"},
	{coords = vector3(1174.532, 2705.278, 38.027), type = "atm"},
	{coords = vector3(540.0420, 2671.007, 42.177), type = "atm"},
	{coords = vector3(2564.399, 2585.100, 38.016), type = "atm"},
	{coords = vector3(2558.051, 389.4817, 108.660), type = "atm"},
	{coords = vector3(1077.692,-775.796, 58.218), type = "atm"},
	{coords = vector3(1139.018,-469.886, 66.789), type = "atm"},
	{coords = vector3(1168.975,-457.241, 66.641), type = "atm"},
	{coords = vector3(1153.884,-326.540, 69.245), type = "atm"},
	{coords = vector3(381.2827, 323.2518, 103.270), type = "atm"},
	{coords = vector3(236.4638, 217.4718, 106.840), type = "atm"},
	{coords = vector3(265.0043, 212.1717, 106.780), type = "atm"},
	{coords = vector3(285.2029, 143.5690, 104.970), type = "atm"},
	{coords = vector3(157.7698, 233.5450, 106.450), type = "atm"},
	{coords = vector3(-164.568, 233.5066, 94.919), type = "atm"},
	{coords = vector3(-1409.39, -99.2603, 52.473), type = "atm"},
	{coords = vector3(-1205.35, -325.579, 37.870), type = "atm"},
	{coords = vector3(-1215.64, -332.231, 37.881), type = "atm"},
	{coords = vector3(-2072.41, -316.959, 13.345), type = "atm"},
	{coords = vector3(-2975.72, 379.7737, 14.992), type = "atm"},
	{coords = vector3(-2962.60, 482.1914, 15.762), type = "atm"},
	{coords = vector3(-2955.70, 488.7218, 15.486), type = "atm"},
	{coords = vector3(-3044.22, 595.2429, 7.595), type = "atm"},
	{coords = vector3(-3144.13, 1127.415, 20.868), type = "atm"},
	{coords = vector3(-1305.40, -706.240, 25.352), type = "atm"},
	{coords = vector3(-538.225, -854.423, 29.234), type = "atm"},
	{coords = vector3(-711.156, -818.958, 23.768), type = "atm"},
	{coords = vector3(-717.614, -915.880, 19.268), type = "atm"},
	{coords = vector3(-526.566, -1222.90, 18.434), type = "atm"},
	{coords = vector3(-256.831, -719.646, 33.444), type = "atm"},
	{coords = vector3(-203.548, -861.588, 30.205), type = "atm"},
	{coords = vector3(112.4102, -776.162, 31.427), type = "atm"},
	{coords = vector3(112.9290, -818.710, 31.386), type = "atm"},
	{coords = vector3(119.9000, -883.826, 31.191), type = "atm"},
	{coords = vector3(149.4551, -1038.95, 29.366), type = "atm"},
	{coords = vector3(-846.304, -340.402, 38.687), type = "atm"},
	{coords = vector3(-1204.35, -324.391, 37.877), type = "atm"},
	{coords = vector3(-1216.27, -331.461, 37.773), type = "atm"},
	{coords = vector3(-56.1935, -1752.53, 29.452), type = "atm"},
	{coords = vector3(-261.692, -2012.64, 30.121), type = "atm"},
	{coords = vector3(-273.001, -2025.60, 30.197), type = "atm"},
	{coords = vector3(314.187, -278.621, 54.170), type = "atm"},
	{coords = vector3(-351.534, -49.529, 49.042), type = "atm"},
	{coords = vector3(24.589, -946.056, 29.357), type = "atm"},
	{coords = vector3(-254.112, -692.483, 33.616), type = "atm"},
	{coords = vector3(-1570.197, -546.651, 34.955), type = "atm"},
	{coords = vector3(-1415.909, -211.825, 46.500), type = "atm"},
	{coords = vector3(-1430.112, -211.014, 46.500), type = "atm"},
	{coords = vector3(129.216, -1292.347, 29.269), type = "atm"},
	{coords = vector3(287.645, -1282.646, 29.659), type = "atm"},
	{coords = vector3(289.012, -1256.545, 29.440), type = "atm"},
	{coords = vector3(295.839, -895.640, 29.217), type = "atm"},
	{coords = vector3(1686.753, 4815.809, 42.008), type = "atm"},
	{coords = vector3(-302.408, -829.945, 32.417), type = "atm"},
	{coords = vector3(5.134, -919.949, 29.557), type = "atm"},
	{coords = vector3(527.26, -160.76, 57.09), type = "atm"},
	{coords = vector3(-867.19, -186.99, 37.84), type = "atm"},
	{coords = vector3(-821.62, -1081.88, 11.13), type = "atm"},
	{coords = vector3(-1315.32, -835.96, 16.96), type = "atm"},
	{coords = vector3(-660.71, -854.06, 24.48), type = "atm"},
	{coords = vector3(-1109.73, -1690.81, 4.37), type = "atm"},
	{coords = vector3(-1091.5, 2708.66, 18.95), type = "atm"},
	{coords = vector3(1171.98, 2702.55, 38.18), type = "atm"},
	{coords = vector3(2683.09, 3286.53, 55.24), type = "atm"},
	{coords = vector3(89.61, 2.37, 68.31), type = "atm"},
	{coords = vector3(-30.3, -723.76, 44.23), type = "atm"},
	{coords = vector3(-28.07, -724.61, 44.23), type = "atm"},
	{coords = vector3(-613.24, -704.84, 31.24), type = "atm"},
	{coords = vector3(-618.84, -707.9, 30.5), type = "atm"},
	{coords = vector3(-1289.23, -226.77, 42.45), type = "atm"},
	{coords = vector3(-1285.6, -224.28, 42.45), type = "atm"},
	{coords = vector3(-1286.24, -213.39, 42.45), type = "atm"},
}

B_SERVICE.SendNotify = function(color, title, message, time)
    TriggerEvent("sanity:notify", "BANKSYSTEM", message, 5000, color)
end

