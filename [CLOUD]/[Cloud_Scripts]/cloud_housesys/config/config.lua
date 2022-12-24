RV = {}

RV.defaultInterior = "default"
RV.defaultDimension = 2000
RV.resellPrecentage = 0.7
RV.maxPlayerResellPrecentage = 1.3

RV.interiors = {
    ["default"] = {
        ["door"] = vector4(346.5485, -1012.4471, -99.1963, 0.0139),
        ["wardrobe"] = vector3(350.6665, -994.1148, -99.1962),
        ["manage"] = vector3(349.8712, -1007.4684, -99.1963),
    },
    -- ["modern_1"] = {
    --     ["door"] = vector4(-786.7562, 315.7344, 217.6384, 270.8398),
    --     ["wardrobe"] = vector3(-797.6864, 328.2977, 220.4384),
    --     ["manage"] = vector3(-782.1920, 321.9829, 217.6436),
    -- },
    ["modern_2"] = {
        ["door"] = vector4(-787.1130, 315.7261, 187.9135, 268.2733),
        ["wardrobe"] = vector3(-797.6664, 328.1155, 190.7158),
        ["manage"] = vector3(-782.2229, 322.2010, 187.9179),
    },
    ["modern_3"] = {
        ["door"] = vector4(-773.9323, 341.9649, 196.6862, 92.2867),
        ["wardrobe"] = vector3(-763.3119, 329.3853, 199.4865),
        ["manage"] = vector3(-778.6823, 335.5443, 196.6862),
    },
    ["modern_4"] = {
        ["door"] = vector4(-1449.8896, -525.9483, 56.9290, 34.4956),
        ["wardrobe"] = vector3(-1467.6348, -537.4415, 50.7325),
        ["manage"] = vector3(-1460.5382, -520.4767, 56.9290),
    },
    ["modern_5"] = {
        ["door"] = vector4(-784.8558, 323.6748, 211.9971, 269.8644),
        ["wardrobe"] = vector3(-793.3251, 326.4395, 210.7967),
        ["manage"] = vector3(-769.8380, 323.6654, 211.9970),
    },
    ["modern_6"] = {
        ["door"] = vector4(-603.0699, 58.9682, 98.2002, 92.1173),
        ["wardrobe"] = vector3(-594.7139, 55.9748, 96.9996),
        ["manage"] = vector3(-618.5822, 58.9808, 98.2000),
    },
    ["house_1"] = {
        ["door"] = vector4(-174.1371, 497.1445, 137.6670, 197.6476),
        ["wardrobe"] = vector3(-167.4264, 487.6552, 133.8436),
        ["manage"] = vector3(-172.1924, 490.4494, 137.4436),
    },
    ["house_2"] = {
        ["door"] = vector4(373.4851, 423.3514, 145.9079, 169.3196),
        ["wardrobe"] = vector3(374.3735, 411.4864, 142.1001),
        ["manage"] = vector3(371.1934, 415.9879, 145.7001),
    },
}

RV.interiorsPreview = {
    {
        id = "default",
        label = "Standard",
        price = 25000,
        videoUrl = "https://content.red-v.cc/Interior 4.mp4"
    },
    -- {
    --     id = "modern_1",
    --     label = "Modern #1",
    --     price = 950000,
    --     videoUrl = "https://content.Ovara.cc/Interior 1.mp4"
    -- },
    {
        id = "modern_2",
        label = "Modern #2",
        price = 1,
        videoUrl = "https://content.red-v.cc/Interior 2.mp4"
    },
    {
        id = "modern_3",
        label = "Modern #3",
        price = 1,
        videoUrl = "https://content.red-v.cc/Interior 3.mp4"
    },
    {
        id = "modern_4",
        label = "Modern #4",
        price = 1,
        videoUrl = "https://content.red-v.cc/Interior 5.mp4"
    },
    {
        id = "modern_5",
        label = "Modern #5",
        price = 1,
        videoUrl = "https://content.red-v.cc/Interior 6.mp4"
    },
    {
        id = "modern_6",
        label = "Modern #6",
        price = 1,
        videoUrl = "https://content.red-v.cc/Interior 8.mp4"
    },
    {
        id = "house_1",
        label = "Haus #1",
        price = 1,
        videoUrl = "https://content.red-v.cc/Interior 7.mp4"
    },
    {
        id = "house_2",
        label = "Haus #2",
        price = 1,
        videoUrl = "https://content.red-v.cc/Interior 10.mp4"
    },
}

RV.houses = {
    {
        name = "711 | Benny",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-339.7822, 625.7737, 171.3569, 26.4205),
            ["garage"] = vector4(-343.7082, 634.3214, 172.2975, 49.1425),
        }
    },
    {
        name = "716",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-126.5317, 588.8444, 204.5169, 358.0534),
            ["garage"] = vector4(-144.5625, 596.4659, 203.7722, 4.8963),
        }
    },
    {
        name = "715",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-185.2587, 591.6766, 197.8231, 7.9166),
            ["garage"] = vector4(-178.1054, 597.2354, 197.8724, 3.8837),
        }
    },
    {
        name = "714",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-189.3165, 617.7979, 199.6612, 191.2019),
            ["garage"] = vector4(-196.6217, 616.2720, 197.3953, 184.0627),
        }
    },
    {
        name = "715",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-232.6284, 588.2998, 190.5363, 3.6773),
            ["garage"] = vector4(-223.8054, 593.0753, 190.3314, 346.1123),
        }
    },
    {
        name = "714",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-256.6945, 632.3256, 187.8052, 55.0950),
            ["garage"] = vector4(-242.8905, 608.5247, 186.8978, 143.0163),
        }
    },
    {
        name = "710",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-307.6008, 643.4528, 176.1332, 125.4116),
            ["garage"] = vector4(-304.5643, 630.7628, 175.5280, 109.9055),
        }
    },
    {
        name = "710",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-340.0435, 668.9572, 172.7844, 197.7711),
            ["garage"] = vector4(-344.8929, 661.7832, 169.6425, 170.5539),
        }
    },
    {
        name = "709",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-400.2061, 664.9795, 163.8303, 2.4405),
            ["garage"] = vector4(-393.8821, 672.0286, 163.1352, 343.5809),
        }
    },
    {
        name = "704",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-445.4411, 685.6158, 152.9534, 210.6838),
            ["garage"] = vector4(-466.6609, 672.8271, 147.6552, 138.2630),
        }
    },
    {
        name = "705 | Moritz",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-476.6450, 648.0421, 144.3867, 17.0660),
            ["garage"] = vector4(-464.7738, 643.8503, 144.1886, 44.3461),
        }
    },
    {
        name = "704",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-498.5990, 683.3071, 151.8591, 184.9756),
            ["garage"] = vector4(-519.7958, 695.1240, 150.2839, 78.1221),
        }
    },
    {
        name = "700",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-533.4860, 709.1526, 153.0876, 188.2395),
            ["garage"] = vector4(-522.1077, 710.0366, 152.0468, 181.9041),
        }
    },
    {
        name = "899",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-495.2482, 738.9456, 163.0310, 133.4901),
            ["garage"] = vector4(-491.4899, 748.3583, 162.8358, 243.1654),
        }
    },
    {
        name = "899",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-494.3804, 795.7963, 184.3432, 12.8983),
            ["garage"] = vector4(-484.2735, 797.7342, 180.5846, 321.5098),
        }
    },
    {
        name = "893",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-596.9005, 851.5402, 211.4722, 41.1644),
            ["garage"] = vector4(-609.0636, 867.8329, 213.6653, 339.7148),
        }
    },
    {
        name = "894",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-655.3209, 803.1500, 198.9904, 336.4034),
            ["garage"] = vector4(-661.6029, 807.7960, 199.4310, 5.0901),
        }
    },
    {
        name = "989",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-600.0654, 807.3580, 191.3014, 76.2132),
            ["garage"] = vector4(-596.5645, 805.0540, 190.7851, 143.4777),
        }
    },
    {
        name = "894",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-597.1841, 763.7765, 189.1201, 226.0688),
            ["garage"] = vector4(-591.0627, 753.2794, 183.7161, 263.3303),
        }
    },
    {
        name = "700",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-579.9409, 733.2183, 184.2119, 17.6429),
            ["garage"] = vector4(-579.0366, 742.6082, 183.7840, 121.7560),
        }
    },
    {
        name = "896",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-664.2198, 742.2004, 174.2839, 267.4691),
            ["garage"] = vector4(-669.6926, 754.8809, 174.1750, 356.7113),
        }
    },
    {
        name = "896",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-668.4275, 638.4462, 149.5289, 110.2962),
            ["garage"] = vector4(-671.9205, 645.4546, 149.2434, 79.8133),
        }
    },
    {
        name = "asd",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-686.1651, 596.2689, 143.6420, 223.2726),
            ["garage"] = vector4(-684.2478, 603.5381, 143.5800, 48.2921),
        }
    },
    {
        name = "888",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-704.2522, 588.8873, 141.9307, 354.9437),
            ["garage"] = vector4(-723.2239, 592.8214, 141.8358, 15.6056),
        }
    },
    {
        name = "888",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-732.8541, 594.0919, 142.1507, 330.3199),
            ["garage"] = vector4(-742.9986, 603.2814, 141.9238, 314.5288),
        }
    },
    {
        name = "887",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-765.7817, 650.6476, 145.6981, 295.9011),
            ["garage"] = vector4(-767.0980, 666.0711, 144.8127, 276.0614),
        }
    },
    {
        name = "887",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-819.3171, 697.0697, 148.1098, 42.2744),
            ["garage"] = vector4(-808.2386, 705.9929, 146.9490, 348.1891),
        }
    },
    {
        name = "879",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-931.5574, 691.5257, 153.4667, 50.9339),
            ["garage"] = vector4(-950.6664, 691.8928, 153.5867, 359.7067),
        }
    },
    {
        name = "872",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1065.0330, 727.0498, 165.4746, 30.9199),
            ["garage"] = vector4(-1056.1017, 736.7667, 165.4499, 313.6545),
        }
    },
    {
        bre = true,
        name = "818",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1974.5063, 630.7894, 122.5363, 245.5713),
            ["garage"] = vector4(-1971.5874, 622.3423, 122.1322, 248.6567),
        }
    },
    {
        name = "829",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1974.5063, 630.7894, 122.5363, 245.5713),
            ["garage"] = vector4(-1889.4596, 624.8153, 130.0041, 133.1701),
        }
    },
    {
        name = "830",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1929.2931, 595.5164, 122.2849, 76.0837),
            ["garage"] = vector4(-1942.7087, 582.6407, 118.8494, 74.6850),
        }
    },
    {
        name = "819",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1995.8027, 591.0074, 117.9034, 257.2243),
            ["garage"] = vector4(-1984.7295, 603.2430, 118.1886, 249.9050),
        }
    },
    {
        name = "831",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1938.5315, 551.4277, 114.8285, 70.6569),
            ["garage"] = vector4(-1939.3680, 525.5444, 109.7931, 158.4680),
        }
    },
    {
        name = "821",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-2013.9484, 499.5504, 107.1718, 256.2805),
            ["garage"] = vector4(-2012.1351, 483.9703, 107.0071, 253.2750),
        }
    },
    {
        name = "832",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1943.3636, 449.5872, 102.9280, 98.2876),
            ["garage"] = vector4(-1944.7990, 460.9659, 102.0261, 97.1450),
        }
    },
    {
        name = "828",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-2010.9982, 445.0808, 103.0159, 291.9915),
            ["garage"] = vector4(-2007.1628, 454.5293, 102.6373, 276.4940),
        }
    },
    {
        bre = true,
        name = "822",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-2008.4432, 367.5680, 94.8143, 268.2250),
            ["garage"] = vector4(-2001.5081, 376.8872, 94.4834, 179.6318),
        }
    },
    {
        name = "833",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1940.8883, 387.1823, 96.5071, 155.9819),
            ["garage"] = vector4(-1945.4662, 384.8761, 96.3593, 88.2157),
        }
    },
    {
        name = "823",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-2008.4971, 367.4962, 94.8143, 278.7377),
            ["garage"] = vector4(-2001.1630, 378.0652, 94.4835, 174.5405),
        }
    },
    {
        name = "824",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1995.2646, 300.4927, 91.9647, 199.0712),
            ["garage"] = vector4(-1991.8273, 290.2697, 91.6666, 216.3395),
        }
    },
    {
        name = "825",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1970.0819, 246.2627, 87.8121, 293.2860),
            ["garage"] = vector4(-1974.1219, 261.3831, 87.2195, 289.3120),
        }
    },
    {
        name = "826",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1960.9664, 212.1422, 86.8029, 293.3163),
            ["garage"] = vector4(-1946.4856, 202.5252, 85.8032, 292.3462),
        }
    },
    {
        name = "827",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1921.6672, 160.3946, 84.5633, 310.0822),
            ["garage"] = vector4(-1935.6039, 182.8824, 84.6087, 306.2353),
        }
    },
    {
        name = "828",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1898.7268, 132.7247, 81.9846, 305.4231),
            ["garage"] = vector4(-1888.4662, 122.7962, 81.6945, 307.2814),
        }
    },
    {
        bre = true,
        name = "828",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1898.7268, 132.7247, 81.9846, 305.4231),
            ["garage"] = vector4(-1888.4662, 122.7962, 81.6945, 307.2814),
        }
    },
    {
        name = "837",
        price = 10,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1858.5994, 207.4474, 84.2941, 39.4147),
            ["garage"] = vector4(-1878.5961, 187.9396, 83.9922, 125.7591),
        }
    },
    {
        name = "836",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1906.2096, 252.3739, 86.2512, 118.2200),
            ["garage"] = vector4(-1904.0485, 239.3467, 86.2511, 26.9079),
        }
    },
    {
        name = "835",
        price = 10,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1922.3033, 298.4149, 89.2873, 101.9401),
            ["garage"] = vector4(-1924.0270, 282.0391, 89.0733, 164.4800),
        }
    },
    {
        bre = true,
        name = "834",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1932.0831, 362.4368, 93.7883, 103.8090),
            ["garage"] = vector4(-1938.0149, 360.2334, 93.5767, 155.6439),
        }
    },
    {
        name = "833",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1932.0831, 362.4368, 93.7883, 103.8090),
            ["garage"] = vector4(-1938.0149, 360.2334, 93.5767, 155.6439),
        }
    },
    {
        name = "839",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1861.5082, 310.4481, 89.1150, 108.8860),
            ["garage"] = vector4(-1858.7550, 327.6836, 88.6599, 22.7530),
        }
    },
    {
        name = "840",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1807.9513, 333.3856, 89.5673, 27.6430),
            ["garage"] = vector4(-1794.5597, 348.7845, 88.5528, 78.3999),
        }
    },
    {
        name = "845",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1539.9951, 421.0681, 110.0140, 359.9500),
            ["garage"] = vector4(-1547.0432, 427.9738, 109.3611, 269.3486),
        }
    },
    {
        name = "847",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1495.9447, 437.1162, 112.4979, 36.2772),
            ["garage"] = vector4(-1505.2942, 427.3027, 111.1057, 42.7094),
        }
    },
    {
        name = "849",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1453.9661, 512.4704, 117.7964, 15.9485),
            ["garage"] = vector4(-1471.5596, 513.0302, 117.8339, 14.8643),
        }
    },
    {
        name = "846",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1500.6351, 522.9792, 118.2722, 211.7364),
            ["garage"] = vector4(-1487.4049, 527.1793, 118.2722, 208.8632),
        }
    },
    {
        name = "848",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1452.7050, 545.5182, 120.7996, 250.4829),
            ["garage"] = vector4(-1451.3739, 533.7028, 119.2093, 242.3708),
        }
    },
    {
        name = "851",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1405.6058, 526.7339, 123.8313, 87.3523),
            ["garage"] = vector4(-1411.5389, 539.5649, 122.6495, 97.8171),
        }
    },
    {
        name = "850",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1405.1802, 561.7760, 125.4062, 167.3512),
            ["garage"] = vector4(-1411.4094, 559.3016, 124.4931, 173.2428),
        }
    },
    {
        name = "850",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1367.0803, 610.8855, 133.8944, 283.0790),
            ["garage"] = vector4(-1362.6205, 604.6703, 133.8904, 271.0346),
        }
    },
    {
        name = "853",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1337.6031, 606.2571, 134.3799, 91.6658),
            ["garage"] = vector4(-1345.0508, 611.0629, 133.8028, 103.6967),
        }
    },
    {
        name = "850",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1364.4803, 570.1078, 134.9730, 252.1352),
            ["garage"] = vector4(-1357.4860, 578.6340, 131.4200, 252.1345),
        }
    },
    {
        name = "854",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1347.0084, 561.2953, 130.5317, 56.1231),
            ["garage"] = vector4(-1360.1079, 553.3215, 129.6139, 41.5291),
        }
    },
    {
        name = "857",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1291.8578, 650.1301, 141.5014, 192.7151),
            ["garage"] = vector4(-1284.6204, 649.1509, 139.8055, 202.9785),
        }
    }, 
    {
        name = "858",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1277.8260, 629.8492, 143.1926, 123.4199),
            ["garage"] = vector4(-1287.8971, 625.6168, 138.8302, 39.9354),
        }
    }, 
    {
        name = "858",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1248.9036, 643.0812, 142.7235, 299.3332),
            ["garage"] = vector4(-1235.4803, 653.6510, 142.5280, 41.9890),
        }
    }, 
    {
        name = "857",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1241.3291, 674.1170, 142.8133, 167.5517),
            ["garage"] = vector4(-1251.0117, 664.8019, 142.8109, 254.3716),
        }
    }, 
    {
        name = "861",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1218.5778, 665.2274, 144.5345, 47.5190),
            ["garage"] = vector4(-1223.9873, 663.3965, 143.6578, 54.7092),
        }
    }, 
    {
        name = "861",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1196.7755, 693.7651, 147.4245, 61.7478),
            ["garage"] = vector4(-1201.7854, 690.1413, 146.8938, 56.0519),
        }
    }, 
    {
        name = "861",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1165.6232, 727.3260, 155.6068, 328.1018),
            ["garage"] = vector4(-1161.2593, 743.3638, 154.9625, 39.6417),
        }
    }, 
    {
        name = "861",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-1117.8308, 761.5644, 164.2887, 24.6126),
            ["garage"] = vector4(-1114.6691, 770.0419, 163.2614, 34.4681),
        }
    },

    -- ## NEW

    {
        name = "587",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(167.1186, 473.8841, 142.5132, 81.1502),
            ["garage"] = vector4(174.3340, 483.0406, 142.3393, 350.8796),
        }
    },
    {
        name = "587",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(223.7621, 513.8585, 140.7671, 44.3697),
            ["garage"] = vector4(235.9744, 529.1672, 140.6830, 294.2490),
        }
    },
    {
        name = "573",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(119.5166, 494.3611, 147.3429, 107.1539),
            ["garage"] = vector4(114.0863, 496.3895, 147.1481, 189.3927),
        }
    },
    {
        name = "573",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(80.1079, 485.9407, 148.2017, 207.9240),
            ["garage"] = vector4(89.9038, 487.2225, 147.7278, 209.0206),
        }
    },
    {
        name = "573",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(107.0791, 467.5002, 147.3737, 359.2950),
            ["garage"] = vector4(95.7227, 475.5392, 147.3686, 298.8653),
        }
    },
    {
        name = "573",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(57.7920, 450.0174, 147.0314, 326.8111),
            ["garage"] = vector4(64.9791, 456.5863, 146.8238, 22.0395),
        }
    },
    {
        name = "573",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(42.9619, 468.7144, 148.0961, 176.1376),
            ["garage"] = vector4(56.0622, 467.2639, 146.6875, 191.0387),
        }
    },
    {
        name = "565",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-7.7458, 468.0328, 145.8565, 342.5853),
            ["garage"] = vector4(0.7623, 470.4782, 145.7668, 242.3795),
        }
    },
    {
        name = "565",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-66.5457, 490.5693, 144.6905, 341.7255),
            ["garage"] = vector4(-78.8001, 496.4761, 144.4738, 341.5613),
        }
    },
    {
        name = "557",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-109.7934, 502.6899, 143.3047, 351.8008),
            ["garage"] = vector4(-123.1670, 509.6016, 142.9119, 357.0909),
        }
    },
   -- {
    --    name = "564",
    --    price = 1,
    --    closed = false,
  --      owner = "none",
    --    ownerName = "none",
    --    interior_id = "none",
     --   positions = {
           -- ["enter"] = vector4(8.5071, 540.0374, 176.0272, 345.5065),
    --        ["garage"] = vector4(15.3570, 548.1501, 176.1805, 62.1490),
      --  }
  --  },
    {
        name = "564",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(45.7676, 556.3489, 180.0822, 24.2142),
            ["garage"] = vector4(51.5150, 563.2365, 180.3112, 24.8944),
        }
    },
    {
        name = "564",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(84.8831, 562.4202, 182.5724, 1.2385),
            ["garage"] = vector4(97.5502, 567.3900, 182.3027, 6.5900),
        }
    },
    {
        name = "572",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(119.3741, 564.3081, 183.9593, 7.4845),
            ["garage"] = vector4(131.2222, 568.7692, 183.3303, 9.9980),
        }
    },
    {
        name = "572",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(150.8020, 556.0601, 183.7374, 111.5416),
            ["garage"] = vector4(149.9427, 570.8409, 183.8757, 277.3293),
        }
    },
    {
        name = "586",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(215.9266, 620.5773, 187.6342, 80.3395),
            ["garage"] = vector4(209.6473, 608.7268, 186.7429, 341.1685),
        }
    },
    {
        name = "586",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(232.1132, 672.4487, 189.9455, 42.5325),
            ["garage"] = vector4(228.0414, 680.9147, 189.5589, 101.4524),
        }
    },
    {
        name = "718",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(228.3083, 765.9329, 204.7809, 58.6744),
            ["garage"] = vector4(217.9333, 757.1520, 204.6839, 58.7102),
        }
    },
    {
        name = "557",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-175.0415, 502.4999, 137.4202, 103.7197),
            ["garage"] = vector4(-189.3806, 502.8424, 134.3455, 286.1230),
        }
    },
    {
        name = "550",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-230.3408, 488.4593, 128.7680, 11.1807),
            ["garage"] = vector4(-245.8883, 493.2478, 125.8361, 20.2402),
        }
    },
    {
        name = "550",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-312.0351, 474.8488, 111.8241, 119.1979),
            ["garage"] = vector4(-317.2826, 480.4575, 112.7218, 119.2921),
        }
    },
    {
        name = "542",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-355.4814, 469.7394, 112.4862, 283.9236),
            ["garage"] = vector4(-353.5533, 475.1041, 112.7432, 309.5636),
        }
    },
    {
        name = "549",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-349.4641, 514.8253, 120.6432, 138.0595),
            ["garage"] = vector4(-361.3255, 513.2109, 119.4960, 136.5094),
        }
    },
    {
        name = "541",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-386.7748, 504.2885, 120.4127, 331.3589),
            ["garage"] = vector4(-399.3690, 518.5255, 120.3470, 359.6358),
        }
    },
    
    {
        name = "540",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-378.0419, 548.1875, 123.8508, 235.0991),
            ["garage"] = vector4(-378.5488, 520.7854, 120.6714, 44.8935),
        }
    },
    {
        name = "540",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-406.5500, 567.2737, 124.6033, 154.8248),
            ["garage"] = vector4(-408.2397, 560.6108, 124.4178, 149.4981),
        }
    },
    {
        name = "530",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-459.1001, 537.4691, 121.4570, 356.0380),
            ["garage"] = vector4(-469.9281, 542.0953, 120.8462, 353.2404),
        }
    },
    {
        name = "530",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-500.6275, 552.1665, 120.5975, 341.0077),
            ["garage"] = vector4(-481.7655, 548.5966, 119.8751, 342.2977),
        }
    },
    {
        name = "702",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-520.2086, 594.2822, 120.8365, 281.1859),
            ["garage"] = vector4(-520.4194, 574.8639, 121.0157, 280.7905),
        }
    },
    {
        name = "705",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-474.4271, 585.9690, 128.6835, 92.9121),
            ["garage"] = vector4(-478.3199, 597.9166, 127.5656, 95.8824),
        }
    },
    {
        name = "701",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-515.1284, 628.8377, 133.5522, 205.4068),
            ["garage"] = vector4(-513.5394, 624.4117, 132.7174, 294.3362),
        }
    },
    {
        name = "700",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-565.2571, 683.4389, 146.2011, 147.2581),
            ["garage"] = vector4(-559.5335, 686.0595, 145.4151, 169.6043),
        }
    },
    {
        name = "701",
        price = 1,
        closed = false,
        owner = "none",
        ownerName = "none",
        interior_id = "none",
        positions = {
            ["enter"] = vector4(-559.4476, 664.1078, 145.4569, 344.9741),
            ["garage"] = vector4(-555.0577, 665.7740, 144.9184, 342.1176),
        }
    },
    -- {
    --     name = "896",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(-606.2344, 672.3695, 151.5969, 350.9878),
    --         ["garage"] = vector4(-615.3004, 677.8420, 149.7990, 346.6248),
    --     }
    -- },
    -- {
    --     name = "896",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(-661.9894, 679.0318, 153.9106, 78.3206),
    --         ["garage"] = vector4(-667.1254, 669.3680, 150.3830, 67.5228),
    --     }
    -- },
    -- {
    --     name = "442",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1301.2397, -573.6868, 71.7322, 343.1993),
    --         ["garage"] = vector4(1293.8315, -574.0967, 71.6222, 342.3023),
    --     }
    -- },
    -- {
    --     name = "441",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1303.0311, -527.6259, 71.4606, 162.0481),
    --         ["garage"] = vector4(1310.7483, -527.8093, 71.3123, 157.5534),
    --     }
    -- },
    -- {
    --     name = "441",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1328.6338, -535.9424, 72.4408, 69.1816),
    --         ["garage"] = vector4(1318.8187, -532.7894, 72.1175, 159.4180),
    --     }
    -- },
    -- {
    --     name = "442",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1323.5262, -582.9570, 73.2463, 337.7896),
    --         ["garage"] = vector4(1316.3228, -581.9013, 73.0989, 333.3641),
    --     }
    -- },
    -- {
    --     name = "441",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1348.0765, -547.2367, 73.8916, 157.4369),
    --         ["garage"] = vector4(1355.6736, -547.5032, 73.7843, 155.1271),
    --     }
    -- },
    -- {
    --     name = "442",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1341.3663, -597.3734, 74.7008, 235.3311),
    --         ["garage"] = vector4(1348.6874, -604.0454, 74.3578, 327.7808),
    --     }
    -- },
    -- {
    --     name = "444",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1367.3115, -606.3831, 74.7109, 1.3722),
    --         ["garage"] = vector4(1360.1196, -609.0610, 74.3380, 358.3528),
    --     }
    -- },
    -- {
    --     name = "444",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1386.1173, -593.2907, 74.4854, 54.1109),
    --         ["garage"] = vector4(1383.6108, -600.3178, 74.3380, 49.2565),
    --     }
    -- },
    -- {
    --     name = "443",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1388.8201, -569.5451, 74.4965, 112.7604),
    --         ["garage"] = vector4(1393.8549, -575.0788, 74.3389, 112.5687),
    --     }
    -- },
    -- {
    --     name = "443",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1373.2437, -555.7296, 74.6856, 69.2136),
    --         ["garage"] = vector4(1363.1003, -553.3710, 74.3380, 158.1846),
    --     }
    -- },
    -- {
    --     name = "436",
    --     price = 3200000,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1251.3666, -515.6854, 69.3490, 258.0661),
    --         ["garage"] = vector4(1250.4307, -522.2726, 68.9781, 254.8149),
    --     }
    -- },
    -- {
    --     name = "436",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1251.5364, -494.2519, 69.9069, 257.7663),
    --         ["garage"] = vector4(1258.5240, -492.8514, 69.4374, 255.9816),
    --     }
    -- },
    -- {
    --     name = "436",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1259.6101, -480.1342, 70.1888, 308.8493),
    --         ["garage"] = vector4(1278.9271, -478.6284, 68.9743, 160.2699),
    --     }
    -- },
    -- {
    --     name = "435",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1266.0120, -458.0902, 70.5170, 273.7070),
    --         ["garage"] = vector4(1273.0139, -455.8829, 69.3287, 275.4365),
    --     }
    -- },
    -- {
    --     name = "435",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1262.4310, -429.9418, 70.0148, 293.8726),
    --         ["garage"] = vector4(1269.5546, -441.8434, 69.3754, 287.7539),
    --     }
    -- },
    -- {
    --     name = "437",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1241.5646, -566.2748, 69.6574, 317.2726),
    --         ["garage"] = vector4(1246.6599, -578.2795, 69.2492, 271.6945),
    --     }
    -- },
    -- {
    --     name = "437",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1240.5416, -601.7414, 69.7827, 273.9206),
    --         ["garage"] = vector4(1243.6322, -585.8109, 69.2810, 270.8688),
    --     }
    -- },
    -- {
    --     name = "438",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1251.0400, -621.3189, 69.4132, 209.7845),
    --         ["garage"] = vector4(1257.8926, -622.7903, 69.4105, 293.7710),
    --     }
    -- },
    
    -- {
    --     name = "439",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1265.6129, -648.2835, 67.9216, 19.4423),
    --         ["garage"] = vector4(1274.3163, -657.2155, 67.7023, 293.5756),
    --     }
    -- },
    -- {
    --     name = "439",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1271.0516, -683.3824, 66.0316, 5.9928),
    --         ["garage"] = vector4(1276.0380, -672.4426, 65.9508, 273.8176),
    --     }
    -- },
    -- {
    --     name = "440",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1265.3439, -703.1793, 64.5686, 241.1699),
    --         ["garage"] = vector4(1261.7968, -714.8483, 64.5197, 242.7348),
    --     }
    -- },
    -- {
    --     name = "440",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1229.0925, -725.4572, 60.7979, 97.4705),
    --         ["garage"] = vector4(1224.3541, -729.3110, 60.2791, 152.4447),
    --     }
    -- },
    -- {
    --     name = "439",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1222.5189, -697.0156, 60.8074, 103.7534),
    --         ["garage"] = vector4(1222.0527, -704.3793, 60.7072, 96.2147),
    --     }
    -- },
    -- {
    --     name = "439",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1221.4166, -668.9700, 63.4931, 15.4589),
    --         ["garage"] = vector4(1216.3188, -665.5392, 62.8122, 99.9291),
    --     }
    -- },
    -- {
    --     name = "438",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1207.1425, -620.2603, 66.4386, 94.0935),
    --         ["garage"] = vector4(1203.7300, -612.6719, 65.9544, 97.3503),
    --     }
    -- },
    -- {
    --     name = "437",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1203.6299, -598.4476, 68.0635, 181.4663),
    --         ["garage"] = vector4(1186.8378, -595.8799, 63.8657, 9.9932),
    --     }
    -- },
    -- {
    --     name = "437",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1200.8719, -575.7493, 69.1391, 139.4758),
    --         ["garage"] = vector4(1184.1921, -572.4592, 64.1802, 1.4660),
    --     }
    -- },
    -- {
    --     name = "437",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1204.7689, -557.6928, 69.6152, 88.1092),
    --         ["garage"] = vector4(1187.1678, -552.4854, 64.5720, 88.1342),
    --     }
    -- },
    -- {
    --     name = "421",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(996.9506, -729.5292, 57.8157, 312.4935),
    --         ["garage"] = vector4(1006.6141, -730.6375, 57.6301, 307.4498),
    --     }
    -- },
    -- {
    --     name = "421",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(979.1936, -716.4047, 58.2207, 313.3776),
    --         ["garage"] = vector4(982.4620, -709.7282, 57.6107, 312.0490),
    --     }
    -- },
    -- {
    --     name = "420",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(970.9026, -701.4282, 58.4819, 353.7161),
    --         ["garage"] = vector4(972.7924, -685.6373, 57.6811, 310.7664),
    --     }
    -- },
    -- {
    --     name = "420",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(960.1179, -669.8846, 58.4498, 298.5842),
    --         ["garage"] = vector4(959.1182, -661.7987, 58.0138, 299.2650),
    --     }
    -- },
    -- {
    --     name = "419",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(943.4546, -653.5618, 58.4287, 221.2083),
    --         ["garage"] = vector4(951.1733, -653.2680, 57.9185, 309.0886),
    --     }
    -- },
    -- {
    --     name = "419",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(929.0168, -639.6996, 58.2424, 319.9155),
    --         ["garage"] = vector4(928.4103, -627.2527, 57.8142, 317.0826),
    --     }
    -- },
    -- {
    --     name = "419",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(902.9557, -615.5575, 58.4534, 228.3862),
    --         ["garage"] = vector4(915.3392, -627.7750, 58.0490, 320.8718),
    --     }
    -- },
    -- {
    --     name = "418",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(886.8737, -608.1700, 58.4451, 316.0860),
    --         ["garage"] = vector4(877.2960, -595.2144, 58.0460, 317.4122),
    --     }
    -- },
    -- {
    --     name = "418",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(861.7399, -583.5503, 58.1565, 4.5268),
    --         ["garage"] = vector4(872.6493, -589.2666, 57.9047, 315.7861),
    --     }
    -- },
    -- {
    --     name = "417",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(844.0983, -563.0834, 57.8339, 190.3694),
    --         ["garage"] = vector4(851.1259, -566.1096, 57.7079, 277.4392),
    --     }
    -- },
    -- {
    --     name = "417",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(850.2010, -532.6915, 57.9256, 266.9040),
    --         ["garage"] = vector4(853.0734, -542.0118, 57.3237, 264.9326),
    --     }
    -- },
    -- {
    --     name = "416",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(861.5125, -509.0063, 57.7222, 228.7485),
    --         ["garage"] = vector4(858.3636, -521.3782, 57.2960, 225.5170),
    --     }
    -- },
    -- {
    --     name = "416",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(878.3651, -498.0205, 58.0906, 227.1788),
    --         ["garage"] = vector4(874.6823, -506.8548, 57.4897, 227.9883),
    --     }
    -- },
    -- {
    --     name = "415",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(906.3195, -489.6619, 59.4362, 204.8455),
    --         ["garage"] = vector4(911.9682, -484.6700, 59.0377, 202.7268),
    --     }
    -- },
    -- {
    --     name = "415",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(921.7468, -477.8413, 61.0836, 205.2516),
    --         ["garage"] = vector4(932.7468, -479.1638, 60.6947, 202.3819),
    --     }
    -- },
    -- {
    --     name = "415",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(944.0819, -463.4084, 61.3957, 125.2450),
    --         ["garage"] = vector4(942.3071, -468.1826, 61.2523, 215.2468),
    --     }
    -- },
    -- {
    --     name = "414",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(967.1517, -451.7163, 62.7896, 212.9660),
    --         ["garage"] = vector4(975.2396, -452.5424, 62.4028, 213.9496),
    --     }
    -- },
    -- {
    --     name = "414",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(987.7442, -433.3930, 63.8908, 213.7266),
    --         ["garage"] = vector4(996.8500, -435.1192, 64.0141, 248.8955),
    --     }
    -- },
    -- {
    --     name = "414",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1010.4202, -423.4492, 65.3494, 310.6757),
    --         ["garage"] = vector4(1014.9257, -422.5876, 65.0008, 218.2119),
    --     }
    -- },
    -- {
    --     name = "413",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1028.7091, -408.3146, 66.3428, 216.6703),
    --         ["garage"] = vector4(1022.1885, -418.3122, 65.9430, 222.7615),
    --     }
    -- },
    -- {
    --     name = "413",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1060.6592, -378.4635, 68.2313, 223.0004),
    --         ["garage"] = vector4(1056.7977, -387.1670, 67.8535, 221.0900),
    --     }
    -- },
    -- {
    --     name = "425",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1114.3671, -391.3232, 68.9482, 64.1864),
    --         ["garage"] = vector4(1103.2271, -398.7255, 67.6659, 78.3069),
    --     }
    -- },
    -- {
    --     name = "425",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1100.7227, -411.2713, 67.5553, 84.8032),
    --         ["garage"] = vector4(1102.9766, -418.8271, 67.1529, 82.1997),
    --     }
    -- },
    -- {
    --     name = "426",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1098.6022, -464.4502, 67.3194, 168.3238),
    --         ["garage"] = vector4(1101.8390, -473.8881, 66.9404, 75.6790),
    --     }
    -- },
    -- {
    --     name = "426",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1090.2477, -484.2735, 65.6604, 80.3451),
    --         ["garage"] = vector4(1086.2488, -496.2733, 64.6499, 80.8151),
    --     }
    -- },
    -- {
    --     name = "430",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1009.8026, -572.5323, 60.5945, 264.0834),
    --         ["garage"] = vector4(1011.8296, -563.2457, 60.1994, 263.1523),
    --     }
    -- },
    -- {
    --     name = "430",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(999.6195, -593.9783, 59.6386, 258.8466),
    --         ["garage"] = vector4(1007.5521, -589.6960, 59.0816, 259.3213),
    --     }
    -- },
    -- {
    --     name = "430",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(980.3023, -627.7000, 59.2359, 35.8373),
    --         ["garage"] = vector4(974.9125, -619.1980, 58.8387, 123.8907),
    --     }
    -- },
    -- {
    --     name = "430",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(964.3046, -596.1191, 59.9027, 79.0293),
    --         ["garage"] = vector4(955.2034, -599.3641, 59.3750, 26.5269),
    --     }
    -- },
    -- {
    --     name = "430",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(976.6992, -580.5794, 59.8500, 28.2770),
    --         ["garage"] = vector4(983.4118, -574.6191, 59.2891, 30.7426),
    --     }
    -- },
    -- {
    --     name = "429",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(919.7380, -569.6668, 58.3663, 205.7534),
    --         ["garage"] = vector4(925.4194, -564.7888, 57.9683, 204.2936),
    --     }
    -- },
    -- {
    --     name = "429",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(893.1502, -540.6019, 58.5066, 118.7443),
    --         ["garage"] = vector4(889.8552, -551.8145, 58.1025, 115.7925),
    --     }
    -- },
    -- {
    --     name = "429",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(924.4341, -526.0033, 59.7890, 26.5507),
    --         ["garage"] = vector4(915.9108, -522.9351, 58.7505, 23.4167),
    --     }
    -- },
    -- {
    --     name = "428",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(945.8087, -518.9734, 60.6259, 303.0729),
    --         ["garage"] = vector4(947.3897, -511.6914, 60.2230, 28.2311),
    --     }
    -- },
    -- {
    --     name = "428",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(970.3531, -502.3799, 62.1409, 79.0534),
    --         ["garage"] = vector4(962.2855, -501.9384, 61.6105, 40.1378),
    --     }
    -- },
    -- {
    --     name = "427",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1014.5737, -469.0683, 64.5030, 37.5478),
    --         ["garage"] = vector4(1019.1697, -460.4163, 63.9582, 36.9316),
    --     }
    -- },
    -- {
    --     name = "427",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1056.1840, -448.8760, 66.2575, 349.9488),
    --         ["garage"] = vector4(1061.1591, -445.3812, 65.9102, 255.9436),
    --     }
    -- },
    -- {
    --     name = "427",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1051.7086, -470.6491, 63.9004, 259.3744),
    --         ["garage"] = vector4(1054.9886, -482.8015, 63.8745, 255.9383),
    --     }
    -- },
    -- {
    --     name = "427",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1046.2681, -497.9822, 64.0868, 349.5140),
    --         ["garage"] = vector4(1052.5034, -487.9509, 63.8977, 255.9840),
    --     }
    -- },
    -- {
    --     name = "428",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(1006.1489, -511.1520, 60.8362, 116.0753),
    --         ["garage"] = vector4(1004.6191, -517.3293, 60.6935, 205.0711),
    --     }
    -- },
    -- {
    --     name = "428",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(987.8018, -525.7916, 60.6906, 210.8232),
    --         ["garage"] = vector4(982.5159, -534.5368, 60.0705, 209.8433),
    --     }
    -- },
    -- {
    --     name = "428",
    --     price = 1,
    --     closed = false,
    --     owner = "none",
    --     ownerName = "none",
    --     interior_id = "none",
    --     positions = {
    --         ["enter"] = vector4(965.5324, -542.6033, 59.3592, 213.1933),
    --         ["garage"] = vector4(957.7047, -551.5746, 59.3102, 211.4260),
    --     }
    -- },
}