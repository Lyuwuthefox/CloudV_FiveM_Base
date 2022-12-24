CS = {}

CS.getSharedObject = 'esx:getSharedObject'
CS.skinMenuTrigger = 'esx_skin:openSaveableMenu'
CS.EasyAdminBanTrigger = 'EasyAdmin:banPlayer'

--Permission Settings
CS.Perms = {}
CS.Perms.AdminBypass = { 'projektleitung' } --All Functions and dont need to be in Admin Duty! [Also some Troll Stuff]
CS.Perms.Godmoderatore = { 'superadministrator', 'admin', 'projektleitung', 'manager' }
CS.Perms.NameTags = { 'mod', 'supporter','admin', 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.NoClip = { 'admin', 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.FullHeal = { 'admin', 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.CarSpawn = { 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.CarFix = { 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.CarDel = { 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.CarBoost = { 'projektleitung' }
CS.Perms.GiveMoney = { 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.GiveItem = { 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.GiveWeapon = { 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.PlayerList = {}
CS.Perms.PlayerList.Goto = { 'mod', 'supporter','admin', 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.PlayerList.Bring = { 'mod', 'supporter','admin', 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.PlayerList.Heal = { 'mod', 'supporter','admin', 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.PlayerList.Freeze = { 'admin', 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.PlayerList.Spectate = { 'mod', 'supporter','admin', 'superadministrator', 'projektleitung', 'manager' } --Force Teleports the Admin above the Player so you can hear the Players
CS.Perms.PlayerList.GiveAccountMoney = { 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.PlayerList.ResetSkin = { 'mod', 'supporter','admin', 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.PlayerList.SetJob = { 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.PlayerList.KickPlayer = { 'mod', 'supporter','admin', 'superadministrator', 'projektleitung', 'manager' }
CS.Perms.PlayerList.BanPlayer = { 'mod', 'supporter','admin', 'superadministrator', 'projektleitung', 'manager' }

--Admin Dutys
AdminDutys = {
    ['admin'] = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 287,   ['torso_2'] = 2,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 114,   ['pants_2'] = 2,
            ['shoes_1'] = 78,   ['shoes_2'] = 2,
            ['helmet_1'] = -1,  ['helmet_2'] = 2,
            ['mask_1'] = 135,  ['mask_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 409,   ['torso_2'] = 3,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 157,   ['pants_2'] = 3,
            ['shoes_1'] = 82,   ['shoes_2'] = 3,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 176,  ['mask_2'] = 3
        }
    },
    ['superadministrator'] = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 287,   ['torso_2'] = 1,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 114,   ['pants_2'] = 1,
            ['shoes_1'] = 78,   ['shoes_2'] = 1,
            ['helmet_1'] = -1,  ['helmet_2'] = 1,
            ['mask_1'] = 135,  ['mask_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 409,   ['torso_2'] = 0,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 157,   ['pants_2'] = 0,
            ['shoes_1'] = 82,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 176,  ['mask_2'] = 0
        }
    },
    ['projektleitung'] = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 287,   ['torso_2'] = 0,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 114,   ['pants_2'] = 0,
            ['shoes_1'] = 78,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 135,  ['mask_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 409,   ['torso_2'] = 2,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 157,   ['pants_2'] = 2,
            ['shoes_1'] = 82,   ['shoes_2'] = 2,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 176,  ['mask_2'] = 2
        }
    },
    ['mod'] = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 287,   ['torso_2'] = 5,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 114,   ['pants_2'] = 5,
            ['shoes_1'] = 78,   ['shoes_2'] = 5,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 135,  ['mask_2'] = 5
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 409,   ['torso_2'] = 4,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 157,   ['pants_2'] = 4,
            ['shoes_1'] = 82,   ['shoes_2'] = 4,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 176,  ['mask_2'] = 4
        }
    },
    ['manager'] = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 287,   ['torso_2'] = 7,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 114,   ['pants_2'] = 7,
            ['shoes_1'] = 78,   ['shoes_2'] = 7,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 135,  ['mask_2'] = 7
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 409,   ['torso_2'] = 1,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 157,   ['pants_2'] = 1,
            ['shoes_1'] = 82,   ['shoes_2'] = 1,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 176,  ['mask_2'] = 1
        }
    },
    ['supporter'] = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 287,   ['torso_2'] = 4,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 114,   ['pants_2'] = 4,
            ['shoes_1'] = 78,   ['shoes_2'] = 4,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 135,  ['mask_2'] = 4
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 409,   ['torso_2'] = 5,
            ['arms'] = 9,   ['arms2'] = 0,
            ['pants_1'] = 157,   ['pants_2'] = 5,
            ['shoes_1'] = 82,   ['shoes_2'] = 5,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 176,  ['mask_2'] = 5
        }
    }
}

--RageUI Settings
Menu = {}
Menu.Title = 'Cloud V' --Only gets used if you dont use a Custom GIF for the Header
Menu.UseHeader = true
Menu.HeaderURL = 'https://cdn.discordapp.com/attachments/975125532515647518/976592261213216798/unknown.png' --.GIF Link or Empty
Menu.HeaderWidth = 455
Menu.HeaderHeigth = 255
Menu.SmallTitle = 'ADMIN MENU'
Menu.X = 700
Menu.Y = 0
--Menu Sounds [https://wiki.gtanet.work/index.php?title=FrontEndSoundlist]
Menu.Sounds = {}
Menu.Sounds.UpDownSound = 'HUD_FRONTEND_DEFAULT_SOUNDSET'
Menu.Sounds.UpDownSoundRef = 'HIGHLIGHT_NAV_UP_DOWN'
Menu.Sounds.LeftRightSound = 'HUD_FRONTEND_DEFAULT_SOUNDSET'
Menu.Sounds.LeftRightSoundRef = 'NAV_LEFT_RIGHT'
Menu.Sounds.SelectSound = 'HUD_FRONTEND_DEFAULT_SOUNDSET'
Menu.Sounds.SelectSoundRef = 'WAYPOINT_SET'
Menu.Sounds.BackSound = 'HUD_FRONTEND_DEFAULT_SOUNDSET'
Menu.Sounds.BackSoundRef = 'TIMER'
Menu.Sounds.ErrorSound = 'HUD_FRONTEND_DEFAULT_SOUNDSET'
Menu.Sounds.ErrorSoundRef = 'ERROR'

--Admin Menu v1.1 Update
CS.Perms.PlayerList.SetAccountMoney = { 'superadministrator', 'projektleitung' }
CS.Perms.Guide = { 'guide', 'supporter', 'projektleitung', 'mod', 'superadministrator', 'manager', 'admin' }
CS.GuideStuff = {}
CS.GuideStuff.ReinCoords =  { x = -1100.55, y = -2756.53, z = 20.34 }
CS.GuideStuff.RausCoords =  { x = 258.21, y = -785.42, z = 30.46 } 
CS.GuideStuff.UsePremadeOutfit = true
CS.GuideStuff.GuideOutfit = { --Only gets used if UsePremadeOutfit is true
    male = {
        ['tshirt_1'] = 31,  ['tshirt_2'] = 0,
        ['torso_1'] = 30,   ['torso_2'] = 5,
        ['arms'] = 4,
        ['pants_1'] = 48,   ['pants_2'] = 0,
        ['shoes_1'] = 43,   ['shoes_2'] = 0,
        ['mask_1'] = 0,  ['mask_2'] = 0,
        ['chain_1'] = 1,   ['chain_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0
    },
    female = {
        ['tshirt_1'] = 45,  ['tshirt_2'] = 2,
        ['torso_1'] = 7,   ['torso_2'] = 0,
        ['arms'] = 1,
        ['pants_1'] = 34,   ['pants_2'] = 0,
        ['shoes_1'] = 10,   ['shoes_2'] = 0,
        ['glasses_1'] = -1,  ['glasses_2'] = 0,
        ['mask_1'] = 0,  ['mask_2'] = 0,
        ['chain_1'] = 0,   ['chain_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0
    }
}

--Admin Menu v1.2 Update [Tickets Currently dont Support oxMySQL]
CS.UseNotify = true
CS.DataBaseType = 'MySQL' --MySQL or oxMySQL [ox needs to be Imported in the fxmanifest.lua]
CS.ClearTicketsOnRestart = true --If you Enable this every Ticket will get Deleted after Server Restart! [Too many Opened Tickets == Slow Query]
CS.Perms.Tickets = { 'supporter', 'mod', 'admin', 'superadministrator', 'manager', 'projektleitung' } --Groups that can Read/Delete Tickets
CS.Perms.ClearAllTickets = { 'admin', 'superadministrator', 'manager', 'projektleitung' } --Have a Button at Server Settings where they can Delete all Tickets

--Admin Menu v1.3 Update
CS.UseTicketSystem = false --Enable/Disable the Ticket System
CS.CustomNotify = true --Enable CS.UseNotify!
CS.Perms.PlayerList.ScreenShot = {'projektleitung' }
function CustomNotify(subject, message) --CS.CustomNotify needs to be True
    TriggerEvent('b-notify:notify', 'info', subject, message)
end