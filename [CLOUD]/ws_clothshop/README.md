exports for othe scripts:

-- returns a boolean --
exports['ws_clothshop']:isInClotheShop() 

-- opens the normal clotheshop --
exports['ws_clothshop']:openClotheShop(clotheShop, outfits) -- if both are true it opens the normal shop

exports['ws_clothshop']:openOutfitList({
    {
        name = "Test",
        outfit = '{"cheeks_1":0,"tshirt_1":15,"lipstick_4":0,"makeup_2":0,"lipstick_2":0,"helmet_1":-1,"mask_1":153,"age_1":0,"hair_color_2":0,"ears_2":0,"arms_2":0,"moles_1":0,"arms":0,"hair_2":0,"pants_1":90,"torso_1":178,"blemishes_2":0,"glasses_2":0,"nose_4":0,"ears_1":-1,"torso_2":0,"hair_color_1":0,"bproof_2":0,"makeup_3":0,"eye_squint":0,"sex":0,"decals_1":0,"blemishes_1":0,"chest_3":0,"tshirt_2":0,"bodyb_1":-1,"eyebrows_6":0,"bracelets_2":0,"nose_6":0,"beard_3":0,"nose_2":0,"nose_3":0,"neck_thickness":0,"chain_1":0,"complexion_2":0,"bproof_1":0,"bags_1":0,"blush_3":0,"blush_2":0,"chest_2":0,"dad":0,"complexion_1":0,"makeup_1":0,"nose_5":0,"chin_2":0,"bodyb_3":-1,"shoes_1":10,"eyebrows_5":0,"bracelets_1":-1,"cheeks_2":0,"eyebrows_3":0,"watches_1":-1,"lip_thickness":0,"chin_13":0,"makeup_4":0,"eyebrows_4":0,"age_2":0,"decals_2":0,"lipstick_1":0,"beard_1":0,"eye_color":0,"sun_1":0,"blush_1":0,"moles_2":0,"jaw_1":0,"mask_2":0,"bags_2":0,"glasses_1":0,"chain_2":0,"sun_2":0,"watches_2":0,"nose_1":0,"jaw_2":0,"cheeks_3":0,"bodyb_2":0,"chin_1":0,"pants_2":0,"shoes_2":0,"eyebrows_2":0,"helmet_2":0,"bodyb_4":0,"eyebrows_1":0,"lipstick_3":0,"hair_1":0,"chin_3":0,"chest_1":0,"face_md_weight":50,"chin_4":0,"skin_md_weight":50,"beard_2":0,"beard_4":0,"mom":21}'', 
    }, -- outfit = json string or table of the skindata --
    {   
        name = "Polizei 1",
        outfit = {              
            ['torso_1'] = 13,
            ['shoes_1'] = 12,
        }
    }
})

client events:

-- this event gets triggered when the clotheshop opens/closed --
AddEventHandler('ws_clothshop:onShopOpen', function(inShop)

end)