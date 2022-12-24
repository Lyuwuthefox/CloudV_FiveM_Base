RiP = {}

RiP.EsxExport = true            -- [BOOLEAN] Set to true if you are using ESX 1.8.5 or above.

RiP.Keybind = 38

RiP.Blur = true                                 -- Background blur

RiP.Sound = true                                -- [true/false] Elevator-Sound

RiP.Elevators = {
    {
        Name = "Mission Row PD",                     -- Elevator name

        Required = {
            Job ='police',                      -- 'false' or job name
            Item = 'false',                     -- 'false' or item name
        },

        Marker = {                              -- Elevator marker
			Show = true,
			Type = 22,
			Size = {X = 1.0, Y = 1.0, Z = 0.9,},
			Color = {R = 11, G = 154, B = 245,},
		},

        
        Stations = {
            {
                Name = 'Zellenblock',
                Location = vector3(485.6, -995.07, 28.02),
                Heading =  177.18,
            },
            {
                Name = 'Tiefgarage',
                Location = vector3(377.38, -955.48, 22.2),
                Heading =  271.13,
            },
        }
    },
}

RiP.Locale = {
    Titel = 'Fahrstuhl',
    Job = 'Du hast nicht den richtigen Job, um den Fahrstuhl zu nutzen.',
    Item = 'Du hast nicht den benötigten Gegenstand, um den Fahrstuhl zu nutzen.'
}

RegisterNetEvent("RiP-Elevator:Notify")
AddEventHandler("RiP-Elevator:Notify", function(Type, Time, Titel, Text)

    TriggerEvent("sanity:notify", "Fahrstuhl",Text, 5000, "error")
    
    --ESX.ShowNotification(Text) --Deaktiviere das wenn du ein eigenes Notify System benutzt (Dissable this if u using a Custom Notify System)
    --exports['okokNotify']:Alert(Title, Text, Time, Type)
end)