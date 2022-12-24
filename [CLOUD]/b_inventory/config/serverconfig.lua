B_SERVICE.ESX = "legacy" -- "legacy" or "extended"

B_SERVICE.MaxInventoryWeight = 40
B_SERVICE.WeaponWeight = 10

B_SERVICE.DefaultWeight = 1 -- Standardgewicht aller Items (bei ESX 1.1)

B_SERVICE.Debug = false

B_SERVICE.TrunkWeights = {
    [0] = 50, --Compact
    [1] = 90, --Sedan
    [2] = 175, --SUV
    [3] = 70, --Coupes
    [4] = 65, --Muscle
    [5] = 30, --Sports Classics
    [6] = 30, --Sports
    [7] = 25, --Super
    [8] = 10, --Motorcycles
    [9] = 50, --Off-road
    [10] = 200, --Industrial
    [11] = 10, --Utility
    [12] = 300, --Vans
    [13] = 1, --Cycles
    [14] = 20, --Boats
    [15] = 50, --Helicopters
    [16] = 50, --Planes
    [17] = 300, --Service
    [18] = 300, --Emergency
    [19] = 300, --Military
    [20] = 1500, --Commercial
    [21] = 0 --Trains
}

B_SERVICE.Logs = "https://discord.com/api/webhooks/1053764096228606094/E0c7J-2lcI82WfHFaGS5ByYJ79a3pM97xSutautBkmnLYVnaAtqwjg-TFJAVuBPExHFw"

B_SERVICE.UseItem = function(source, itemName)
    ESX.UseItem(source, itemName)
end