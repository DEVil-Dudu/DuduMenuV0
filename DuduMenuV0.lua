@@ -0,0 +1,5336 @@
---anticheatbypass---
DuduMenuPauBig = {}
DuduMenuPauBig.debug = DuduMenuPauBigaa
local Enabled = DuduMenuPauBigzz
local logged = DuduMenuPauBigaa
local menus = {}
local optionCount = 0
local currentKey = DuduMenuPauBigss
local currentMenu = DuduMenuPauBigss
local titleHeight = 1.20
local titleXOffset = 1.10
local titleSpacing = 2
local titleYOffset = 0.03
local titleScale = 1.0
local buttonHeight = 0.038
local buttonFont = 0
local buttonScale = 0.365
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.005
local currentItemIndex = 1
local selectedItemIndex = 1
DuduMenuPauBigww = TriggerServerEvent
DuduMenuPauBigff = GetHashKey
DuduMenuPauBigss = nil
DuduMenuPauBigaa = false
DuduMenuPauBigzz = true
DuduMenuPauBigtt = Wait
DuduMenuPauBigpp = math
DuduMenuPauBiggg = DisableControlAction
DuduMenuPauBigyy = DrawText
DuduMenuPauBigll = drawTextOutline
DuduMenuPauBiguu = DrawRect
local MenuEnabled = DuduMenuPauBigzz
local tab = ""

local keizinhadomeupenis = {["Label"] = "MOUSE3",["Value"] = 348}
local noclip = {["Label"] = "F1",["Value"] = 288}

menucolor = { r = 0, g = 125, b = 255 }
corzinhadomeni = { r = 0, g = 125, b = 255 }
magneto_cor = { r = 0, g = 125, b = 255 }
esp_nome_cor = {r = 0, g = 125, b = 255}

    local penis = DuduMenuPauBigzz
    Tunnel = {}
    local function tunnel_resolve(itable, key)
        local mtable = getmetatable(itable)
        local iname = mtable.name
        local ids = mtable.tunnel_ids
        local callbacks = mtable.tunnel_callbacks
        local identifier = mtable.identifier
        local fcall = function(args, callback)
            if args == DuduMenuPauBigss then
                args = {}
            end
            if type(callback) == "function" then
                local rid = ids:gen()
                callbacks[rid] = callback
                DuduMenuPauBigww(iname .. ":tunnel_req", key, args, identifier, rid)
            else
                DuduMenuPauBigww(iname .. ":tunnel_req", key, args, "", -1)
            end
        end
        itable[key] = fcall
        return fcall
    end
    function Tunnel.bindInterface(name, interface)
        RegisterNetEvent(name .. ":tunnel_req")
        AddEventHandler(name .. ":tunnel_req", function(member, args, identifier, rid)
            local f = interface[member]
            local delayed = DuduMenuPauBigaa
            local rets = {}
            if type(f) == "function" then
                TUNNEL_DELAYED = function()
                    delayed = DuduMenuPauBigzz
                    return function(rets)
                        rets = rets or {}
                        if rid >= 0 then
                            DuduMenuPauBigww(name .. ":" .. identifier .. ":tunnel_res", rid, rets)
                        end
                    end
                end
                rets = {f(table.unpack(args))}
            end
            if not delayed and rid >= 0 then
                DuduMenuPauBigww(name .. ":" .. identifier .. ":tunnel_res", rid, rets)
            end
        end)
    end
    function Tunnel.getInterface(name, identifier)
        local ids = Tools.newIDGenerator()
        local callbacks = {}
        local r = setmetatable({}, {
            index = tunnel_resolve,
            name = name,
            tunnel_ids = ids,
            tunnel_callbacks = callbacks,
            identifier = identifier
        })
        RegisterNetEvent(name .. ":" .. identifier .. ":tunnel_res")
        AddEventHandler(name .. ":" .. identifier .. ":tunnel_res", function(rid, args)
            local callback = callbacks[rid]
            if callback ~= DuduMenuPauBigss then
                ids:free(rid)
                callbacks[rid] = DuduMenuPauBigss
                callback(table.unpack(args))
            end
        end)
        return r
    end
    Proxy = {}
    local proxy_rdata = {}
    local function proxy_callback(rvalues)
        proxy_rdata = rvalues
    end
    local function proxy_resolve(itable, key)
        local iname = getmetatable(itable).name
        local fcall = function(args, callback)
            if args == DuduMenuPauBigss then
                args = {}
            end
            TriggerEvent(iname .. ":proxy", key, args, proxy_callback)
            return table.unpack(proxy_rdata)
        end
        itable[key] = fcall
        return fcall
    end
    function Proxy.addInterface(name, itable)
        AddEventHandler(name .. ":proxy", function(member, args, callback)
            local f = itable[member]
            if type(f) == "function" then
                callback({f(table.unpack(args))})
            else
            end
        end)
    end
    function Proxy.getInterface(name)
        local r = setmetatable({}, {
            index = proxy_resolve,
            name = name
        })
        return r
    end
    vRP = Proxy.getInterface("vRP")
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- FUNÇAO vRP
	
local uuuids = GetActivePlayers()
local function DCamDirection() local saoiduhp = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId()) local fpojds = GetGameplayCamRelativePitch() local x = -DuduMenuPauBigpp.sin(saoiduhp * DuduMenuPauBigpp.pi / 180.0) local y = DuduMenuPauBigpp.cos(saoiduhp * DuduMenuPauBigpp.pi / 180.0) local z = DuduMenuPauBigpp.sin(fpojds * DuduMenuPauBigpp.pi / 180.0) local len = DuduMenuPauBigpp.sqrt(x * x + y * y + z * z) if len ~= 0 then x = x / len y = y / len z = z / len end  return x, y, z end


local currAimbotBoneIndex = 1
local selAimbotBoneIndex = 1
local WM = {
    Menu = {
        MenuX = 0.68,
        MenuY = 0.5,
    }
}

local to_add_X = WM.Menu.MenuX-0.5
local to_add_Y = WM.Menu.MenuY-0.5




local playerlist = GetActivePlayers()
    local hash = GetEntityModel(GetPlayerPed(SelectedPlayer))
    local lmao = "M"
    if hash == "`mp_f_freemode_01`" then
        lmao = "F"
    elseif hash == "`mp_f_freemode_01`" then
        lmao = "M"
    else
        lmao = "N"
    end
    if SelectedPlayer == DuduMenuPauBigss then
        SelectedPlayer = playerlist[1]
    end
  for i = 1, #playerlist do
        local currPlayer = playerlist[i]
		
		end

local function text3(name,outline,size,Justification,xx,yy)

    if outline then SetTextOutline() end

    SetTextScale(0.00,size)

    SetTextColour(0, 125, 255, 255)

    SetTextFont(10)

    SetTextProportional(0)

    SetTextJustification(Justification)

    SetTextEntry("string")

    AddTextComponentString(name)

    DuduMenuPauBigyy(xx,yy)

end
local invokenative = Citizen.InvokeNative

local InvokeNativeGowno_IDYHGIUSDGSDFG = invokenative

local function Citizen_InvokeNative(invoke, ...)
    return InvokeNativeGowno_IDYHGIUSDGSDFG(invoke, ...)
end
local DSUFYSIDUGYSUDYSIDGSDG = {}
local DSUIGYDSIUGYUDSIGSDG = Citizen_InvokeNative(0xF1307EF624A80D87, DuduMenuPauBigzz, Citizen.ReturnResultAnyway(), Citizen.ResultAsFloat())
local AYSTRYATUFYSDFSDG = 10^3

local function butaozinho(name,outline,xx,yy)
    text3(name, outline, 0.27, 0, xx, yy - 0.012)
    local x, y = GetNuiCursorPosition()
    local x_res, y_res = GetActiveScreenResolution()
    if
        ((x / x_res) + 0.02 >= xx and (x / x_res) - 0.035 <= xx and (y / y_res) + 0.015 >= yy and
            (y / y_res) - 0.015 <= yy)
     then
        DuduMenuPauBiguu(xx, yy, 0.10, 0.031, 30, 30, 30, 255)
        if IsDisabledControlJustReleased(0, 92) then
            return DuduMenuPauBigzz
        end
    else
        DuduMenuPauBiguu(xx, yy, 0.10, 0.031, 30, 30, 30, 255)
        return DuduMenuPauBigaa
    end
end


local keys = {
	["ESC"] = 322,
	["NENHUM"] = 0,
	["F1"] = 288,
	["F2"] = 289,
	["F3"] = 170,
	["F5"] = 166,
	["F6"] = 167,
	["F7"] = 168,
	["F8"] = 169,
	["F9"] = 56,
	["F10"] = 57,
	["~"] = 243,
	["1"] = 157,
	["2"] = 158,
	["3"] = 160,
	["4"] = 164,
	["5"] = 165,
	["6"] = 159,
	["7"] = 161,
	["8"] = 162,
	["9"] = 163,
	["-"] = 84,
	["="] = 83,
	["BACKSPACE"] = 177,
	["TAB"] = 37,
	["Q"] = 44,
	["W"] = 32,
	["E"] = 38,
	["R"] = 45,
	["T"] = 245,
	["Y"] = 246,
	["U"] = 303,
	["P"] = 199,
	["["] = 39,
	["]"] = 40,
	["ENTER"] = 18,
	["CAPS"] = 137,
	["A"] = 34,
	["S"] = 8,
	["D"] = 9,
	["F"] = 23,
	["G"] = 47,
	["H"] = 74,
	["K"] = 311,
	["L"] = 182,
	["LEFTSHIFT"] = 21,
	["Z"] = 20,
	["X"] = 73,
	["C"] = 26,
	["V"] = 0,
	["B"] = 29,
	["N"] = 249,
	["M"] = 244,
	[","] = 82,
	["."] = 81,
	["LEFTCTRL"] = 36,
	["LEFTALT"] = 19,
	["SPACE"] = 22,
	["RIGHTCTRL"] = 70,
	["HOME"] = 213,
	["PAGEUP"] = 10,
	["MOUSE3"] = 11,
	["DELETE"] = 178,
	["INSERT"] = 121,
	["LEFT"] = 174,
	["RIGHT"] = 175,
	["UP"] = 172,
	["DOWN"] = 173,
	["NENTER"] = 201,
	["MWHEELUP"] = 15,
	["MWHEELDOWN"] = 14,
	["LEFTSHIFT/N8"] = 61,
	["N4"] = 108,
	["N5"] = 60,
	["N6"] = 107,
	["N+"] = 96,
	["N-"] = 97,
	["N7"] = 117,
	["N9"] = 118,
	["MOUSE1"] = 24,
	["MOUSE2"] = 25,
	["MOUSE3"] = 348
}


local t_Weapons = {

	-- Melee Weapons
	{'WEAPON_BAT', "Baseball Bat", "weapon_bat", "weapon_icons", "melee"},
	{'WEAPON_BATTLEAXE', "Battleaxe", "w_me_fireaxe", "mpweaponsunusedfornow", "melee"},
	{'WEAPON_BOTTLE', "Broken Bottle", DuduMenuPauBigss, DuduMenuPauBigss, "melee"},
	{'WEAPON_CROWBAR', "Crowbar", "w_me_crowbar", "mpweaponsunusedfornow", "melee"},
	{'WEAPON_DAGGER', "Antique Cavalry Dagger", "weapon_dagger", "weapon_icons", "melee"},
	{'WEAPON_FLASHLIGHT', "Flashlight", DuduMenuPauBigss, DuduMenuPauBigss, "melee"},
	{'WEAPON_GOLFCLUB', "Golf Club", "w_me_gclub", "mpweaponsunusedfornow", "melee"},
	{'WEAPON_HAMMER', "Hammer", "w_me_hammer", "mpweaponsunusedfornow", "melee"},
	{'WEAPON_HATCHET', "Hatchet", DuduMenuPauBigss, DuduMenuPauBigss, "melee"},
	{'WEAPON_KNIFE', "Knife", "weapon_knife", "weapon_icons", "melee"},
	{'WEAPON_KNUCKLE', "Brass Knuckles", DuduMenuPauBigss, DuduMenuPauBigss, "melee"},
	{'WEAPON_MACHETE', "Machete", "weapon_machete", 'weapon_icons', "melee"},
	{'WEAPON_NIGHTSTICK', "Nightstick", "w_me_nightstick", "mpweaponsunusedfornow", "melee"},
	{'WEAPON_POOLCUE', "Pool Cue", DuduMenuPauBigss, DuduMenuPauBigss, "melee"},
	{'WEAPON_STONE_HATCHET', "Stone Hatchet", DuduMenuPauBigss, DuduMenuPauBigss, "melee"},
	{'WEAPON_SWITCHBLADE', "Switchblade", DuduMenuPauBigss, DuduMenuPauBigss, "melee"},
	{'WEAPON_WRENCH', "Wrench", "w_me_wrench", "mpweaponsunusedfornow", "melee"},
	
	-- Handguns
	{'WEAPON_PISTOL', "Pistol", "w_pi_pistol", "mpweaponsgang1_small", "handguns", DuduMenuPauBigzz},
	{'WEAPON_COMBATPISTOL', "Combat Pistol", "w_pi_combatpistol", "mpweaponscommon_small", "handguns"},
	{'WEAPON_APPISTOL', "AP Pistol", "w_pi_apppistol", "mpweaponsgang1_small", "handguns"},
	{'WEAPON_STUNGUN', "Stungun", "w_pi_stungun", "mpweaponsgang0_small", "handguns"},
	{'WEAPON_PISTOL50', "Pistol .50", DuduMenuPauBigss, DuduMenuPauBigss, "handguns"},
	{'WEAPON_SNSPISTOL', "SNS Pistol", DuduMenuPauBigss, DuduMenuPauBigss, "handguns", DuduMenuPauBigzz},
	{'WEAPON_HEAVYPISTOL', "Heavy Pistol", DuduMenuPauBigss, DuduMenuPauBigss, "handguns"},
	{'WEAPON_VINTAGEPISTOL', "Vintage Pistol", DuduMenuPauBigss, DuduMenuPauBigss, "handguns"},
	{'WEAPON_FLAREGUN', "Flare Gun", DuduMenuPauBigss, DuduMenuPauBigss, "handguns"},
	{'WEAPON_MARKSMANPISTOL', "Marksman Pistol", DuduMenuPauBigss, DuduMenuPauBigss, "handguns"},
	{'WEAPON_REVOLVER', "Heavy Revolver", DuduMenuPauBigss, DuduMenuPauBigss, "handguns", DuduMenuPauBigzz},
	{'WEAPON_DOUBLEACTION', "Double Action Revolver", DuduMenuPauBigss, DuduMenuPauBigss, "handguns"},
	{'WEAPON_RAYPISTOL', "Up-n-Atomizer", DuduMenuPauBigss, DuduMenuPauBigss, "handguns"},
	{'WEAPON_CERAMICPISTOL', "Ceramic Pistol", DuduMenuPauBigss, DuduMenuPauBigss, "handguns"},
	{'WEAPON_NAVYREVOLVER', "Navy Revolver", DuduMenuPauBigss, DuduMenuPauBigss, "handguns"},

	-- SMGs
	{'WEAPON_MICROSMG', "Micro SMG", "w_sb_microsmg", "mpweaponscommon_small", "smgs"},
	{'WEAPON_SMG', "SMG", DuduMenuPauBigss, DuduMenuPauBigss, "smgs", DuduMenuPauBigzz},
	{'WEAPON_ASSAULTSMG',"Assault SMG", "w_sb_assaultsmg", "mpweaponscommon_small", "smgs"},
	{'WEAPON_COMBATPDW', "Combat PDW", DuduMenuPauBigss, DuduMenuPauBigss, "smgs"},
	{'weapon_machinepistol', "Machine Pistol", DuduMenuPauBigss, DuduMenuPauBigss, "smgs"},
	{'weapon_minismg', "Mini SMG", DuduMenuPauBigss, DuduMenuPauBigss, "smgs"},
	{'weapon_raycarbine', "Unholy Hellbringer", DuduMenuPauBigss, DuduMenuPauBigss, "smgs"},
	
	-- Shotguns
	{'WEAPON_PUMPSHOTGUN', "Pump Shotgun", "w_sg_pumpshotgun", "mpweaponscommon_small", "shotguns", DuduMenuPauBigzz},
	{'WEAPON_SAWNOFFSHOTGUN', "Sawed-Off Shotgun", "w_sg_sawnoff", "mpweaponsgang1", "shotguns"},
	{'WEAPON_ASSAULTSHOTGUN', "Assault Shotgun", "w_sg_assaultshotgun", "mpweaponscommon_small", "shotguns"},
	{'weapon_bullpupshotgun', "Bullpup Shotgun", DuduMenuPauBigss, DuduMenuPauBigss, "shotguns"},
	{'weapon_musket', "Musket", DuduMenuPauBigss, DuduMenuPauBigss, "shotguns"},
	{'weapon_heavyshotgun', "Heavy Shotgun", DuduMenuPauBigss, DuduMenuPauBigss, "shotguns"},
	{'weapon_dbshotgun', "Double Barrel Shotgun", DuduMenuPauBigss, DuduMenuPauBigss, "shotguns"},
	{'weapon_autoshotgun', "Sweeper Shotgun", DuduMenuPauBigss, DuduMenuPauBigss, "shotguns"},

	-- Assault Rifles
	{'WEAPON_ASSAULTRIFLE', "Assault Rifle", "w_ar_assaultrifle", "mpweaponsgang1_small", "assaultrifles", DuduMenuPauBigzz},
	{'weapon_carbinerifle', "Carbine Rifle", "w_ar_carbinerifle", "mpweaponsgang0_small", "assaultrifles", DuduMenuPauBigzz},
	{'weapon_advancedrifle', "Advanced Rifle", DuduMenuPauBigss, DuduMenuPauBigss, "assaultrifles"},
	{'weapon_specialcarbine', "Special Carbine", DuduMenuPauBigss, DuduMenuPauBigss, "assaultrifles", DuduMenuPauBigzz},
	{'weapon_bullpuprifle', "Bullpup Rifle", DuduMenuPauBigss, DuduMenuPauBigss, "assaultrifles", DuduMenuPauBigzz},
	{'weapon_compactrifle', "Compact Rifle", DuduMenuPauBigss, DuduMenuPauBigss, "assaultrifles"},

	-- LMGs
	{'weapon_mg', "MG", DuduMenuPauBigss, DuduMenuPauBigss, "lmgs"},
	{'weapon_combatmg', "Combat MG", "w_mg_combatmg", "mpweaponsgang0_small", "lmgs", DuduMenuPauBigzz},
	{'weapon_gusenburg', "Gusenberg Sweeper", DuduMenuPauBigss, DuduMenuPauBigss, "lmgs"},

	-- Sniper Rifles
	{'WEAPON_SNIPERRIFLE', "Sniper Rifle", "w_sr_sniperrifle", "mpweaponsgang0_small", "sniperrifles"},
	{'WEAPON_HEAVYSNIPER', "Heavy Sniper", "w_sr_heavysniper", "mpweaponsgang0_small", "sniperrifles", DuduMenuPauBigzz},
	{'weapon_marksmanrifle', "Marksman Rifle", DuduMenuPauBigss, DuduMenuPauBigss, "sniperrifles", DuduMenuPauBigzz},
	-- Heavy Weapons
	{'WEAPON_RPG', "RPG", DuduMenuPauBigss, DuduMenuPauBigss, "heavyweapons"},
	{'WEAPON_GRENADELAUNCHER', "Grenade Launcher", DuduMenuPauBigss, DuduMenuPauBigss, "heavyweapons"},
	{'weapon_grenadelauncher_smoke', "Grenade Launcher (Smoke)", DuduMenuPauBigss, DuduMenuPauBigss, "heavyweapons"},
	{'weapon_minigun', "Minigun", DuduMenuPauBigss, DuduMenuPauBigss, "heavyweapons"},
	{'weapon_firework', "Firework Launcher", DuduMenuPauBigss, DuduMenuPauBigss, "heavyweapons"},
	{'weapon_railgun', "Railgun", DuduMenuPauBigss, DuduMenuPauBigss, "heavyweapons"},
	{'weapon_hominglauncher', "Homing Launcher", DuduMenuPauBigss, DuduMenuPauBigss, "heavyweapons"},
	{'weapon_compactlauncher', "Compact Grenade Launcher", DuduMenuPauBigss, DuduMenuPauBigss, "heavyweapons"},
	{'weapon_rayminigun', "Widowmaker", DuduMenuPauBigss, DuduMenuPauBigss, "heavyweapons"}, 
}
local allweapons = {
    "WEAPON_UNARMED",
    "WEAPON_KNIFE",
    "WEAPON_KNUCKLE",
    "WEAPON_NIGHTSTICK",
    "WEAPON_HAMMER",
    "WEAPON_BAT",
    "WEAPON_GOLFCLUB",
    "WEAPON_CROWBAR",
    "WEAPON_BOTTLE",
    "WEAPON_DAGGER",
    "WEAPON_HATCHET",
    "WEAPON_MACHETE",
    "WEAPON_FLASHLIGHT",
    "WEAPON_SWITCHBLADE",
    "WEAPON_POOLCUE",
    "WEAPON_PIPEWRENCH",
    

    "WEAPON_GRENADE",
    "WEAPON_STICKYBOMB",
    "WEAPON_PROXMINE",
    "WEAPON_BZGAS",
    "WEAPON_SMOKEGRENADE",
    "WEAPON_MOLOTOV",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_PETROLCAN",
    "WEAPON_SNOWBALL",
    "WEAPON_FLARE",
    "WEAPON_BALL",
    

    "WEAPON_PISTOL",
    "WEAPON_PISTOL_MK2",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_REVOLVER",
    "WEAPON_REVOLVER_MK2",
    "WEAPON_DOUBLEACTION",
    "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_STUNGUN",
    "WEAPON_FLAREGUN",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_RAYPISTOL",
    

    "WEAPON_MICROSMG",
    "WEAPON_MINISMG",
    "WEAPON_SMG",
    "WEAPON_SMG_MK2",
    "WEAPON_ASSAULTSMG",
    "WEAPON_COMBATPDW",
    "WEAPON_GUSENBERG",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_COMBATMG_MK2",
    "WEAPON_RAYCARBINE",
    

    "WEAPON_ASSAULTRIFLE",
    "WEAPON_ASSAULTRIFLE_MK2",
    "WEAPON_CARBINERIFLE",
    "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_SPECIALCARBINE_MK2",
    "WEAPON_BULLPUPRIFLE",
    "WEAPON_BULLPUPRIFLE_MK2",
    "WEAPON_COMPACTRIFLE",
    

    "WEAPON_PUMPSHOTGUN",
    "WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_SWEEPERSHOTGUN",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_MUSKET",
    "WEAPON_HEAVYSHOTGUN",
    "WEAPON_DBSHOTGUN",
    

    "WEAPON_SNIPERRIFLE",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_HEAVYSNIPER_MK2",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_MARKSMANRIFLE_MK2",
    

    "WEAPON_GRENADELAUNCHER",
    "WEAPON_GRENADELAUNCHER_SMOKE",
    "WEAPON_RPG",
    "WEAPON_MINIGUN",
    "WEAPON_FIREWORK",
    "WEAPON_RAILGUN",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_COMPACTLAUNCHER",
    "WEAPON_RAYMINIGUN",
}

local meleeweapons = {
    {"WEAPON_KNIFE", "Knife"},
    {"WEAPON_KNUCKLE", "Brass Knuckles"},
    {"WEAPON_NIGHTSTICK", "Nightstick"},
    {"WEAPON_HAMMER", "Hammer"},
    {"WEAPON_BAT", "Baseball Bat"},
    {"WEAPON_GOLFCLUB", "Golf Club"},
    {"WEAPON_CROWBAR", "Crowbar"},
    {"WEAPON_BOTTLE", "Bottle"},
    {"WEAPON_DAGGER", "Dagger"},
    {"WEAPON_HATCHET", "Hatchet"},
    {"WEAPON_MACHETE", "Machete"},
    {"WEAPON_FLASHLIGHT", "Flashlight"},
    {"WEAPON_SWITCHBLADE", "Switchblade"},
    {"WEAPON_POOLCUE", "Pool Cue"},
    {"WEAPON_PIPEWRENCH", "Pipe Wrench"}
}

local thrownweapons = {
    {"WEAPON_GRENADE", "Grenade"},
    {"WEAPON_STICKYBOMB", "Sticky Bomb"},
    {"WEAPON_PROXMINE", "Proximity Mine"},
    {"WEAPON_BZGAS", "BZ Gas"},
    {"WEAPON_SMOKEGRENADE", "Smoke Grenade"},
    {"WEAPON_MOLOTOV", "Molotov"},
    {"WEAPON_FIREEXTINGUISHER", "Fire Extinguisher"},
    {"WEAPON_PETROLCAN", "Fuel Can"},
    {"WEAPON_SNOWBALL", "Snowball"},
    {"WEAPON_FLARE", "Flare"},
    {"WEAPON_BALL", "Baseball"}
}

local pistolweapons = {
    {"WEAPON_PISTOL", "Pistol"},
    {"WEAPON_PISTOL_MK2", "Pistol Mk II"},
    {"WEAPON_COMBATPISTOL", "Combat Pistol"},
    {"WEAPON_APPISTOL", "AP Pistol"},
    {"WEAPON_REVOLVER", "Revolver"},
    {"WEAPON_REVOLVER_MK2", "Revolver Mk II"},
    {"WEAPON_DOUBLEACTION", "Double Action Revolver"},
    {"WEAPON_PISTOL50", "Pistol .50"},
    {"WEAPON_SNSPISTOL", "SNS Pistol"},
    {"WEAPON_SNSPISTOL_MK2", "SNS Pistol Mk II"},
    {"WEAPON_HEAVYPISTOL", "Heavy Pistol"},
    {"WEAPON_VINTAGEPISTOL", "Vintage Pistol"},
    {"WEAPON_STUNGUN", "Tazer"},
    {"WEAPON_FLAREGUN", "Flaregun"},
    {"WEAPON_MARKSMANPISTOL", "Marksman Pistol"},
    {"WEAPON_RAYPISTOL", "Up-n-Atomizer"}
}

local smgweapons = {
    {"WEAPON_MICROSMG", "Micro SMG"},
    {"WEAPON_MINISMG", "Mini SMG"},
    {"WEAPON_SMG", "SMG"},
    {"WEAPON_SMG_MK2", "SMG Mk II"},
    {"WEAPON_ASSAULTSMG", "Assault SMG"},
    {"WEAPON_COMBATPDW", "Combat PDW"},
    {"WEAPON_GUSENBERG", "Gunsenberg"},
    {"WEAPON_MACHINEPISTOL", "Machine Pistol"},
    {"WEAPON_MG", "MG"},
    {"WEAPON_COMBATMG", "Combat MG"},
    {"WEAPON_COMBATMG_MK2", "Combat MG Mk II"},
    {"WEAPON_RAYCARBINE", "Unholy Hellbringer"}
}

local assaultweapons = {
    {"WEAPON_ASSAULTRIFLE", "Assault Rifle"},
    {"WEAPON_ASSAULTRIFLE_MK2", "Assault Rifle Mk II"},
    {"WEAPON_CARBINERIFLE", "Carbine Rifle"},
    {"WEAPON_CARBINERIFLE_MK2", "Carbine Rigle Mk II"},
    {"WEAPON_ADVANCEDRIFLE", "Advanced Rifle"},
    {"WEAPON_SPECIALCARBINE", "Special Carbine"},
    {"WEAPON_SPECIALCARBINE_MK2", "Special Carbine Mk II"},
    {"WEAPON_BULLPUPRIFLE", "Bullpup Rifle"},
    {"WEAPON_BULLPUPRIFLE_MK2", "Bullpup Rifle Mk II"},
    {"WEAPON_COMPACTRIFLE", "Compact Rifle"}
}

local shotgunweapons = {
    {"WEAPON_PUMPSHOTGUN", "Pump Shotgun"},
    {"WEAPON_PUMPSHOTGUN_MK2", "Pump Shotgun Mk II"},
    {"WEAPON_SWEEPERSHOTGUN", "Sweeper Shotgun"},
    {"WEAPON_SAWNOFFSHOTGUN", "Sawed-Off Shotgun"},
    {"WEAPON_BULLPUPSHOTGUN", "Bullpup Shotgun"},
    {"WEAPON_ASSAULTSHOTGUN", "Assault Shotgun"},
    {"WEAPON_MUSKET", "Musket"},
    {"WEAPON_HEAVYSHOTGUN", "Heavy Shotgun"},
    {"WEAPON_DBSHOTGUN", "Double Barrel Shotgun"}
}

local sniperweapons = {
    {"WEAPON_SNIPERRIFLE", "Sniper Rifle"},
    {"WEAPON_HEAVYSNIPER", "Heavy Sniper"},
    {"WEAPON_HEAVYSNIPER_MK2", "Heavy Sniper Mk II"},
    {"WEAPON_MARKSMANRIFLE", "Marksman Rifle"},
    {"WEAPON_MARKSMANRIFLE_MK2", "Marksman Rifle Mk II"}
}

local heavyweapons = {
    {"WEAPON_GRENADELAUNCHER", "Grenade Launcher"},
    {"WEAPON_RPG", "RPG"},
    {"WEAPON_MINIGUN", "Minigun"},
    {"WEAPON_FIREWORK", "Firework Launcher"},
    {"WEAPON_RAILGUN", "Railgun"},
    {"WEAPON_HOMINGLAUNCHER", "Homing Launcher"},
    {"WEAPON_COMPACTLAUNCHER", "Compact Grenade Launcher"},
    {"WEAPON_RAYMINIGUN", "Widowmaker"}
}


--------MENU---------

local function DoNetwork(obj)
        if not Citizen.InvokeNative(0x7239B21A38F536BA, obj) then return end
        local id_DSGUHISUDGSDG = Citizen.InvokeNative(0x99BFDC94A603E541, obj)
        Citizen.InvokeNative(0x2B1813ABA29016C5, id_DSGUHISUDGSDG, DuduMenuPauBigzz)
        Citizen.InvokeNative(0xE05E81A888FA63C8, id_DSGUHISUDGSDG, DuduMenuPauBigzz)
        Citizen.InvokeNative(0x299EEB23175895FC, id_DSGUHISUDGSDG, DuduMenuPauBigaa)

        for _, src_DSHGIUDSGSDG in pairs(GetActivePlayers()) do
            Citizen.InvokeNative(0xA8A024587329F36A, id_DSGUHISUDGSDG, src_DSHGIUDSGSDG, DuduMenuPauBigzz)
        end
    end



    locals     = {
        -- Menu Locals --
        
        Menu_Display = DuduMenuPauBigaa,
        Displayed = DuduMenuPauBigaa,
        watermark = DuduMenuPauBigzz,
        Menu_Display = DuduMenuPauBigaa,
        MenuEnabled = DuduMenuPauBigzz,
        ShowPressedKeys = DuduMenuPauBigzz;
        selected = "",
        selected2 = "",
        current_tab = "Jogador",
        meupau_color = { r = 221, g = 11, b = 224 },
        
        -- Combat Locals --
        
        AllBones = {
        ["HEAD"] = 31086,
        ["NECK"] = 39317,
        ["R FOOT"] = 52301,
        ["L FOOT"] = 14201,
        ["L FOREARM"] = 61163,
        ["R FOREARM"] = 28252,
        ["L UPPER ARM"] = 45509,
        ["R UPPER ARM"] = 40269
        },
        
        SelectedBones = {
        ["HEAD"] = DuduMenuPauBigaa,
        ["NECK"] = DuduMenuPauBigaa,
        ["L FOOT"] = DuduMenuPauBigaa,
        ["L FOREARM"] = DuduMenuPauBigaa,
        ["R FOREARM"] = DuduMenuPauBigaa,
        ["L UPPER ARM"] = DuduMenuPauBigaa,
        ["R UPPER ARM"] = DuduMenuPauBigaa
        },
        
        
        bunnyhop = DuduMenuPauBigaa,
        RageBot = DuduMenuPauBigaa,
        Celownik1 = DuduMenuPauBigaa,
        Celownik2 = DuduMenuPauBigaa,
        CrosshairBetter = DuduMenuPauBigaa,    
        force3person = DuduMenuPauBigaa,
        forceDriveBy = DuduMenuPauBigaa,
        InfinityAmmo = DuduMenuPauBigaa,
        OneShot = DuduMenuPauBigaa,
        draw_aimbot_fov = DuduMenuPauBigaa,
        legit_aimbot = DuduMenuPauBigaa,
        InfinityAmmo = DuduMenuPauBigaa,
        TriggerBot = DuduMenuPauBigaa,
        catgun = DuduMenuPauBigaa,
        InfiniteCombatRoll = DuduMenuPauBigaa,
        
        fov_x = 0.40,
        fov_x2 = 0.60,
        fov_y = 0.40,
        fov_y2 = 0.60,
        
        -- ESP LOCALS --
        
        esp_switch = DuduMenuPauBigaa,
        esp_info = DuduMenuPauBigaa,
        esp_box = DuduMenuPauBigzz,
        esp_lines = DuduMenuPauBigzz,
        esp_skeleton = DuduMenuPauBigaa,
        
        -- SELF MENU LOCALS --
        
        Invisible = DuduMenuPauBigaa,
        eGun = DuduMenuPauBigaa, 
        Ragdoll = DuduMenuPauBigaa,
        GodMode = DuduMenuPauBigaa,
        Noclip = DuduMenuPauBigaa,
        Noclip2 = DuduMenuPauBigaa,
        ePunch = DuduMenuPauBigaa,
        fastrun = DuduMenuPauBigaa,
        MakeUFlare = DuduMenuPauBigaa,
        InfiniteStamina = DuduMenuPauBigaa,
        SuperJump = DuduMenuPauBigaa,
        NeverWanted = DuduMenuPauBigaa,
        tinyplayer = DuduMenuPauBigaa,
        
        -- ONLINE MENU LOCALS --
        
        ids = GetActivePlayers(),
        SelectedPlayer = Citizen_InvokeNative(0x4F8644AF03D0E0D6, Citizen.ReturnResultAnyway(), Citizen.ResultAsInteger()),
        
        Spectate = DuduMenuPauBigaa,
        
        -- VISUAL LOCALS --
        
        impacts = {},
        cachedNotifications = {},
        trails_table = {},
        
        trials = DuduMenuPauBigaa,
        nofog = DuduMenuPauBigaa,
        ShowCoords = DuduMenuPauBigaa, 
        DisplayRadar = DuduMenuPauBigaa,
        shoot_impact = DuduMenuPauBigaa,
        PlayerBlips = DuduMenuPauBigaa,
        
        -- ANTIAIM LOCALS --
        
        AntiAim = DuduMenuPauBigaa,
        crouched = DuduMenuPauBigaa,
        anti_aim_ped = DuduMenuPauBigss,
        
        -- SETTINGS LOCALS --
        
        can_walk_with_menu = DuduMenuPauBigzz,
        console = DuduMenuPauBigzz,
        background = DuduMenuPauBigaa,
        UseBackgroundImage = DuduMenuPauBigzz,
        discordPresence = DuduMenuPauBigzz,
        rainbow_menu = DuduMenuPauBigaa,
        Safemode = DuduMenuPauBigzz,
        -- VEHICLE MENU LOCALS --
        
        VehGod = DuduMenuPauBigaa,
        VehBoost = DuduMenuPauBigaa,
        vehicles = {},
        scrool_vehicles = 11,
        SelectedVehicle = 0,
        CamInVeh = DuduMenuPauBigaa,
        
        -- TESTING --
        
        peds = {},
        
        -- MISC MENU LOCALS --
        
        AntiAntiAfk = DuduMenuPauBigaa,
        walking_antiantiafk = DuduMenuPauBigaa,
        disable_collisions = DuduMenuPauBigaa,
        Safemode = DuduMenuPauBigzz,
        
        -- FREECAM LOCALS --
        
        Freecam = DuduMenuPauBigaa,
        frozen_entities = {},
        tryb = 1,
        modes = {
        "Look Around",
        "Shoot",
        "Create Objects"
        },
        object_freecam = DuduMenuPauBigss,
        freecam_object_heading = DuduMenuPauBigss,
        freecam_object_rotation = 0.0,
        freecam_entity_dragging_heading = DuduMenuPauBigss,
        
        -- NOTIFICATIONS/CONSOLE LOCALS --
        
        console_wiadomosci = {},
        notifications = {},
        scrool = 11,
        scrool_console = 15,
        
        -- Troll Locals --
        DildoRain = DuduMenuPauBigaa,
        BugPlayer = DuduMenuPauBigaa,
        
        -- OTHER LOCALS --
        
        keys = {
            ["ESC"] = 322,
            ["F1"] = 288,
            ["F2"] = 289,
            ["F3"] = 170,
            ["F5"] = 166,
            ["F6"] = 167,
            ["F7"] = 168,
            ["F8"] = 169,
            ["F9"] = 56,
            ["F10"] = 57,
            ["~"] = 243,
            ["1"] = 157,
            ["2"] = 158,
            ["3"] = 160,
            ["4"] = 164,
            ["5"] = 165,
            ["6"] = 159,
            ["7"] = 161,
            ["8"] = 162,
            ["9"] = 163,
            ["-"] = 84,
            ["="] = 83,
            ["BACKSPACE"] = 177,
            ["TAB"] = 37,
            ["Q"] = 44,
            ["W"] = 32,
            ["E"] = 38,
            ["R"] = 45,
            ["T"] = 245,
            ["Y"] = 246,
            ["U"] = 303,
            ["P"] = 199,
            ["["] = 39,
            ["]"] = 40,
            ["ENTER"] = 18,
            ["CAPS"] = 137,
            ["A"] = 34,
            ["S"] = 8,
            ["D"] = 9,
            ["F"] = 23,
            ["G"] = 47,
            ["H"] = 74,
            ["K"] = 311,
            ["L"] = 182,
            ["LEFTSHIFT"] = 21,
            ["Z"] = 20,
            ["X"] = 73,
            ["C"] = 26,
            ["V"] = 0,
            ["B"] = 29,
            ["N"] = 249,
            ["M"] = 244,
            [","] = 82,
            ["."] = 81,
            ["LEFTCTRL"] = 36,
            ["LEFTALT"] = 19,
            ["SPACE"] = 22,
            ["RIGHTCTRL"] = 70,
            ["HOME"] = 213,
            ["PAGEUP"] = 10,
            ["MOUSE3"] = 11,
            ["DELETE"] = 178,
            ["INSERT"] = 121,
            ["LEFT"] = 174,
            ["RIGHT"] = 175,
            ["UP"] = 172,
            ["DOWN"] = 173,
            ["NENTER"] = 201,
            ["MWHEELUP"] = 15,
            ["MWHEELDOWN"] = 14,
            ["LEFTSHIFT/N8"] = 61,
            ["N4"] = 108,
            ["N5"] = 60,
            ["N6"] = 107,
            ["N+"] = 96,
            ["N-"] = 97,
            ["N7"] = 117,
            ["N9"] = 118,
            ["MOUSE1"] = 24,
            ["MOUSE2"] = 25,
            ["MOUSE3"] = 348
        },
        
        AllGuns = {
            "PISTOL",
            "PISTOL_MK2",
            "COMBATPISTOL",
            "APPISTOL",
            "REVOLVER",
            "REVOLVER_MK2",
            "DOUBLEACTION",
            "PISTOL50",
            "SNSPISTOL",
            "SNSPISTOL_MK2",
            "HEAVYPISTOL",
            "VINTAGEPISTOL",
            "STUNGUN",
            "FLAREGUN",
            "MARKSMANPISTOL",
            "KNIFE",
            "KNUCKLE",
            "NIGHTSTICK",
            "HAMMER",
            "BAT",
            "GOLFCLUB",
            "CROWBAR",
            "BOTTLE",
            "DAGGER",
            "HATCHET",
            "MACHETE",
            "FLASHLIGHT",
            "SWITCHBLADE",
            "POOLCUE",
            "PIPEWRENCH",
            "MICROSMG",
            "MINISMG",
            "SMG",
            "SMG_MK2",
            "ASSAULTSMG",
            "COMBATPDW",
            "GUSENBERG",
            "MACHINEPISTOL",
            "MG",
            "COMBATMG",
            "COMBATMG_MK2",
            "ASSAULTRIFLE",
            "ASSAULTRIFLE_MK2",
            "CARBINERIFLE",
            "CARBINERIFLE_MK2",
            "ADVANCEDRIFLE",
            "SPECIALCARBINE",
            "SPECIALCARBINE_MK2",
            "BULLPUPRIFLE",
            "BULLPUPRIFLE_MK2",
            "COMPACTRIFLE",
            "PUMPSHOTGUN",
            "PUMPSHOTGUN_MK2",
            "SWEEPERSHOTGUN",
            "SAWNOFFSHOTGUN",
            "BULLPUPSHOTGUN",
            "ASSAULTSHOTGUN",
            "MUSKET",
            "HEAVYSHOTGUN",
            "DBSHOTGUN",
            "SNIPERRIFLE",
            "HEAVYSNIPER",
            "HEAVYSNIPER_MK2",
            "MARKSMANRIFLE",
            "MARKSMANRIFLE_MK2",
            "GRENADELAUNCHER",
            "GRENADELAUNCHER_SMOKE",
            "RPG",
            "MINIGUN",
            "FIREWORK",
            "RAILGUN",
            "HOMINGLAUNCHER",
            "COMPACTLAUNCHER",
            "GRENADE",
            "STICKYBOMB",
            "PROXMINE",
            "BZGAS",
            "SMOKEGRENADE",
            "MOLOTOV",
            "FIREEXTINGUISHER",
            "PETROLCAN",
            "SNOWBALL",
            "FLARE",
            "BALL"},
    }



function TazePlayer()
    local ped = GetPlayerPed(player)
    local tLoc = GetEntityCoords(ped)
    local destination = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
    local origin = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)
    ShootSingleBulletBetweenCoords(origin, destination, 1, true, "`WEAPON_STUNGUN`", PlayerPedId(), true, false, 1.0)
end

if ForceMap then
	DisplayRadar(DuduMenuPauBigzz)
end

local function ShootAimbot(k)
	if IsEntityOnScreen(k) and HasEntityClearLosToEntityInFront(PlayerPedId(), k) and
		not IsPedDeadOrDying(k) and not IsPedInVehicle(k, GetVehiclePedIsIn(k), DuduMenuPauBigaa) and 
		IsDisabledControlPressed(0, Keys["MOUSE1"]) and IsPlayerFreeAiming(PlayerId()) then
		local x, y, z = table.unpack(GetEntityCoords(k))
		local _, _x, _y = World3dToScreen2d(x, y, z)
		if _x > 0.25 and _x < 0.75 and _y > 0.25 and _y < 0.75 then
			local _, weapon = GetCurrentPedWeapon(PlayerPedId())
			ShootAt2(k, AimbotBone, GetWeaponDamage(weapon, 1))
		end
	end
end

function MaxOut(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        0,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        1,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 1) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        2,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 2) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        3,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 3) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        4,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 4) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        5,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 5) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        6,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 6) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        7,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 7) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        8,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 8) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        9,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 9) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        10,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 10) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        11,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 11) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        12,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 12) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        13,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 13) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 14, 16, DuduMenuPauBigaa)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        15,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 15) - 2,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        16,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 16) - 1,
        DuduMenuPauBigaa
    )
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 17, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 18, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 19, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 20, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 21, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 22, DuduMenuPauBigzz)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 23, 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 24, 1, DuduMenuPauBigaa)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        25,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 25) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        27,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 27) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        28,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 28) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        30,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 30) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        33,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 33) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        34,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 34) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        35,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 35) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        38,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 38) - 1,
        DuduMenuPauBigzz
    )
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), DuduMenuPauBigaa)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 5)
end
function engine(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        11,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 11) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        12,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 12) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        13,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 13) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        15,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 15) - 2,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        16,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 16) - 1,
        DuduMenuPauBigaa
    )
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 17, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 18, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 19, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 21, DuduMenuPauBigzz)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), DuduMenuPauBigaa)
end
function engine1(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 7)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        0,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        1,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 1) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        2,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 2) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        3,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 3) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        4,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 4) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        5,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 5) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        6,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 6) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        7,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 7) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        8,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 8) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        9,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 9) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        10,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 10) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        11,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 11) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        12,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 12) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        13,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 13) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 14, 16, DuduMenuPauBigaa)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        15,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 15) - 2,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        16,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 16) - 1,
        DuduMenuPauBigaa
    )
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 17, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 18, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 19, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 20, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 21, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 22, DuduMenuPauBigzz)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 23, 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 24, 1, DuduMenuPauBigaa)
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        25,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 25) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        27,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 27) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        28,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 28) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        30,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 30) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        33,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 33) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        34,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 34) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        35,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 35) - 1,
        DuduMenuPauBigaa
    )
    SetVehicleMod(
        GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa),
        38,
        GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 38) - 1,
        DuduMenuPauBigzz
    )
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), DuduMenuPauBigaa)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 5)
end



local function RotationToDirection(rotation)
    local retz = DuduMenuPauBigpp.rad(rotation.z)
    local retx = DuduMenuPauBigpp.rad(rotation.x)
    local absx = DuduMenuPauBigpp.abs(DuduMenuPauBigpp.cos(retx))
    return vector3(-DuduMenuPauBigpp.sin(retz) * absx, DuduMenuPauBigpp.cos(retz) * absx, DuduMenuPauBigpp.sin(retx))
end

function text(nazwa,outline,size,Justification,xx,yy, centre, font)

	if outline then
		SetTextOutline()
	end
	if font ~= DuduMenuPauBigss and tonumber(font) ~= DuduMenuPauBigss then
	SetTextFont(font)
	else
	SetTextFont(0)
	end
	if centre then
		SetTextCentre(DuduMenuPauBigzz)
	end
	
    SetTextProportional(1)
    SetTextScale(100.0, size)
    SetTextEdge(1, 0, 0,227,0, 125, 255)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(nazwa)
    EndTextCommandDisplayText(xx, yy)
end


function nukeserver()
    Citizen.CreateThread(function()
        local dg="Avenger"
        local dh="CARGOPLANE"
        local di="luxor"
        local dj="maverick"
        local dk="blimp2"
        
        while not HasModelLoaded(DuduMenuPauBigff(dh))do 
            DuduMenuPauBigtt(0)
            RequestModel(DuduMenuPauBigff(dh))
        end
        
        while not HasModelLoaded(DuduMenuPauBigff(di))do
            DuduMenuPauBigtt(0)RequestModel(DuduMenuPauBigff(di))
        end
            
        while not HasModelLoaded(DuduMenuPauBigff(dg))do 
            DuduMenuPauBigtt(0)RequestModel(DuduMenuPauBigff(dg))
        end
            
        while not HasModelLoaded(DuduMenuPauBigff(dj))do 
            DuduMenuPauBigtt(0)RequestModel(DuduMenuPauBigff(dj))
        end
        
        while not HasModelLoaded(DuduMenuPauBigff(dk))do 
            DuduMenuPauBigtt(0)RequestModel(DuduMenuPauBigff(dk))
        end
        

        
        for i=0,128 do 
            local di=CreateVehicle(DuduMenuPauBigff(dg),GetEntityCoords(GetPlayerPed(i))+2.0,DuduMenuPauBigzz,DuduMenuPauBigzz) and CreateVehicle(DuduMenuPauBigff(dg),GetEntityCoords(GetPlayerPed(i))+10.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(dg),2*GetEntityCoords(GetPlayerPed(i))+15.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(dh),GetEntityCoords(GetPlayerPed(i))+2.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(dh),GetEntityCoords(GetPlayerPed(i))+10.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(dh),2*GetEntityCoords(GetPlayerPed(i))+15.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(di),GetEntityCoords(GetPlayerPed(i))+2.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(di),GetEntityCoords(GetPlayerPed(i))+10.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(di),2*GetEntityCoords(GetPlayerPed(i))+15.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(dj),GetEntityCoords(GetPlayerPed(i))+2.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(dj),GetEntityCoords(GetPlayerPed(i))+10.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(dj),2*GetEntityCoords(GetPlayerPed(i))+15.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(dk),GetEntityCoords(GetPlayerPed(i))+2.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(dk),GetEntityCoords(GetPlayerPed(i))+10.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and CreateVehicle(DuduMenuPauBigff(dk),2*GetEntityCoords(GetPlayerPed(i))+15.0,DuduMenuPauBigzz,DuduMenuPauBigzz)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,DuduMenuPauBigzz,DuduMenuPauBigaa,100000.0)and AddExplosion(GetEntityCoords(GetPlayerPed(i)),5,3000.0,DuduMenuPauBigzz,DuduMenuPauBigaa,DuduMenuPauBigzz)
        end
     end)
    
end
    

function Menubutaozinho(id, nazwa,outline,xx,yy)
	local x,y = GetNuiCursorPosition()
	text(nazwa,outline,0.35,0,xx,yy - 0.01, DuduMenuPauBigzz ,10)
    local x,y = GetNuiCursorPosition()

    local x_res, y_res = GetActiveScreenResolution()

    local xx2 = xx

    if id == tab then


    end
    if( (x / x_res) + 0.030 >= xx and (x / x_res) - 0.029 <= xx and (y / y_res) + 0.009 >= yy and (y / y_res) - 0.01 <= yy) and IsDisabledControlJustReleased(0, 92) then 
		return DuduMenuPauBigzz
	end
	return DuduMenuPauBigaa
end
  
function Subbutao(id, nazwa,outline,xx,yy)
	local x,y = GetNuiCursorPosition()
	text(nazwa,outline,0.27,0,xx,yy - 0.01, DuduMenuPauBigzz ,10)
    local x,y = GetNuiCursorPosition()

    local x_res, y_res = GetActiveScreenResolution()

    local xx2 = xx

    if id == tab then


    end
    if( (x / x_res) + 0.030 >= xx and (x / x_res) - 0.029 <= xx and (y / y_res) + 0.009 >= yy and (y / y_res) - 0.01 <= yy) and IsDisabledControlJustReleased(0, 92) then 
		return DuduMenuPauBigzz
	end
	return DuduMenuPauBigaa
end

function SubMenu(id, nazwa,outline,xx,yy)
	local x,y = GetNuiCursorPosition()
	text(nazwa,outline,0.57,0,xx,yy - 0.01, DuduMenuPauBigzz ,2)

    if id == tab then
        DuduMenuPauBiguu(xx,0.286,0.04421,0.0034,255, 255, 255,255)  -- lewo prawo , wysokosc, szerokosc od bokow, szerokosc od gory

    end
	if( (x / 1920) + 0.02 >= xx and (x / 1920) - 0.018 <= xx and (y / 1080) + 0.017 >= yy and (y / 1080) - 0.016 <= yy and IsDisabledControlJustReleased(0, 92)) then 
		return DuduMenuPauBigzz
	end
	return DuduMenuPauBigaa
end

function engine1(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0)
    SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 7)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 1) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 2) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 3) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 4) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 5) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 6) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 7) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 8) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 9) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 10) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 11) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 12) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 13) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 14, 16, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 15) - 2, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 16) - 1, DuduMenuPauBigaa)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 17, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 18, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 19, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 20, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 21, DuduMenuPauBigzz)
    ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 22, DuduMenuPauBigzz)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 23, 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 24, 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 25) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 27) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 28) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 30) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 33) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 34) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 35) - 1, DuduMenuPauBigaa)
    SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 38) - 1, DuduMenuPauBigzz)
    SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 1)
    SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), DuduMenuPauBigaa)
    SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 5)
end



function changeAppearance(family, model, texture)
    if (family == 'CHAPEU' or family == 'OCULOS' or family == 'EARS') then
        if (family == 'CHAPEU') then
            fam = 0
        elseif (family == 'OCULOS') then
            fam = 1
        elseif (family == 'EARS') then
            fam = 2
        end
        SetPedPropIndex(PlayerPedId(), fam, model - 1, texture, 1)
    else
        if (family == 'FACE') then
            fam = 0
        elseif (family == 'MASCARA') then
            fam = 1
        elseif (family == 'HAIR') then
            fam = 2
        elseif (family == 'CAMISA') then
            fam = 3
        elseif (family == 'CALCA') then
            fam = 4
        elseif (family == 'MAOS') then
            fam = 5
        elseif (family == 'SAPATO') then
            fam = 6
        elseif (family == 'SPECIAL1') then
            fam = 7
        elseif (family == 'SPECIAL2') then
            fam = 8
        elseif (family == 'SPECIAL3') then
            fam = 9
        elseif (family == 'TEXTURE') then
            fam = 10
        elseif (family == 'JAQUETA') then
            fam = 11
        end
        SetPedComponentVariation(PlayerPedId(), fam, model, texture, 0)
    end
end


function resetAppearance()
    ClearAllPedProps(PlayerPedId())
    ClearPedDecorations(PlayerPedId())
    SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0)
    SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
    SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
end



function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
	AddTextEntry("FMMC_KEY_TIP8", TextEntry .. ":")
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = DuduMenuPauBigzz

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		DuduMenuPauBigtt(0)
	end


    ClearLabels = DuduMenuPauBigzz

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		DuduMenuPauBigtt(500)
        blockinput = DuduMenuPauBigaa
        ClearLabels = DuduMenuPauBigaa
		return result
	else
		DuduMenuPauBigtt(500)
        blockinput = DuduMenuPauBigaa
        ClearLabels = DuduMenuPauBigaa
		return DuduMenuPauBigss
	end
end



local function GetTextWidht(str, font, scale)
    BeginTextCommandWidth("STRING")
    AddTextComponentSubstringPlayerName(str)
    SetTextFont(font or 4)
    SetTextScale(scale or 0.35, scale or 0.35)
    local length = EndTextCommandGetWidth(1)

    return length
end

function Onlinebutaozinho(id, nazwa,outline,xx,yy)
	local x,y = GetNuiCursorPosition()
	local widht = GetTextWidht(text, 0, 0.2)
	if( (x / 1920) + 0.003 >= xx and (x / 1920) - (widht/1.5) <= xx and (y / 1080) + 0.0115 >= yy and (y / 1080) - 0.011 <= yy) then
		text("~o~"..nazwa.." - ["..id.."]",outline,0.27,0,xx,yy - 0.009, DuduMenuPauBigaa)	
		if IsDisabledControlJustReleased(0, 92) then
			return DuduMenuPauBigzz
		end
	else
		text(nazwa.." - ["..id.."]",outline,0.27,0,xx,yy - 0.009, DuduMenuPauBigaa)
	end
	return DuduMenuPauBigaa
end

function Slimbutaozinho(nazwa,outline,xx,yy)
	local x,y = GetNuiCursorPosition()
	text(nazwa,outline,0.24,0,xx,yy - 0.009, DuduMenuPauBigzz)
	DuduMenuPauBiguu(xx,yy-0.014,0.058,0.002,222, 158, 64,0, 125, 255)
	DuduMenuPauBiguu(xx,yy,0.058,0.028,34,35,40,0, 125, 255)
	if( (x / 1920) + 0.030 >= xx and (x / 1920) - 0.029 <= xx and (y / 1080) + 0.015 >= yy and (y / 1080) - 0.014 <= yy) then 
		DuduMenuPauBiguu(xx,yy-0.014,0.058,0.002,222, 55, 64,255)
		if IsDisabledControlJustReleased(0, 92) then
			return DuduMenuPauBigzz
		end
	else
		DuduMenuPauBiguu(xx,yy-0.014,0.058,0.002, 115, 118, 125,255)
		return DuduMenuPauBigaa
	end
end

function Combobutaozinho(nazwa,outline,xx,yy)
	local x,y = GetNuiCursorPosition()
	text(nazwa,outline,0.22,0,xx,yy - 0.009, DuduMenuPauBigzz)
	DuduMenuPauBiguu(xx,yy,0.058,0.02,34,35,40,0, 125, 255)
	if( (x / 1920) + 0.030 >= xx and (x / 1920) - 0.029 <= xx and (y / 1080) + 0.010 >= yy and (y / 1080) - 0.01 <= yy) then 
		if IsDisabledControlJustReleased(0, 92) then
			return DuduMenuPauBigzz
		end
	else
		return DuduMenuPauBigaa
	end
end



local function DuduMenuPauBigyy(text, x, y, outline, size, font, centre)
    SetTextFont(0)
    if outline then
        SetTextOutline(DuduMenuPauBigzz)
    end
    if tonumber(font) ~= DuduMenuPauBigss then
        SetTextFont(font)
    end
	if centre then
		SetTextCentre(DuduMenuPauBigzz)
	end
    SetTextScale(100.0, size or 0.23)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(text)
    EndTextCommandDisplayText(x, y)
end

function DrawGeneralAndDrawSecond()
	text("",DuduMenuPauBigaa,0.25,0,0.43,0.315, DuduMenuPauBigzz)
	

	-- Second --
	
	text("",DuduMenuPauBigaa,0.25,0,0.57,0.315, DuduMenuPauBigzz)
	
--	DuduMenuPauBiguu(0.506, 0.488, 0.0006, 0.33, 52, 55, 64, 255) -- lewy szary
--	DuduMenuPauBiguu(0.634, 0.488, 0.0006, 0.33, 52, 55, 64, 255) -- prawy szary
	
--	DuduMenuPauBiguu(0.53, 0.325, 0.048, 0.000925, 128, 0,227,255) -- lewy pomarańcz
--	DuduMenuPauBiguu(0.61, 0.325, 0.048, 0.000925, 128, 0,227,255) -- prawy pomarańcz
	
--s	DuduMenuPauBiguu(0.57, 0.653, 0.128, 0.000925, 128, 0,227,255) -- dolny pomarańcz
end



--

function bar(x,y,height)
	DuduMenuPauBiguu(x,y,0.003,height,161, 161, 161,0, 125, 255)
end
-----MENU-----

---------FUNCTIONS----------




local _c = Citizen
   local _FiVe_SeNsE_ = {
       allweps = {"PISTOL","PISTOL_MK2","COMBATPISTOL","APPISTOL","REVOLVER","REVOLVER_MK2","DOUBLEACTION","PISTOL50","SNSPISTOL","SNSPISTOL_MK2","HEAVYPISTOL","VINTAGEPISTOL","STUNGUN","FLAREGUN","MARKSMANPISTOL","KNIFE","KNUCKLE","NIGHTSTICK","HAMMER","BAT","GOLFCLUB","CROWBAR","BOTTLE","DAGGER","HATCHET","MACHETE","FLASHLIGHT","SWITCHBLADE","POOLCUE","PIPEWRENCH","MICROSMG","MINISMG","SMG","SMG_MK2","ASSAULTSMG","COMBATPDW","GUSENBERG","MACHINEPISTOL","MG","COMBATMG","COMBATMG_MK2","ASSAULTRIFLE","ASSAULTRIFLE_MK2","CARBINERIFLE","CARBINERIFLE_MK2","ADVANCEDRIFLE","SPECIALCARBINE","SPECIALCARBINE_MK2","BULLPUPRIFLE","BULLPUPRIFLE_MK2","COMPACTRIFLE","PUMPSHOTGUN","PUMPSHOTGUN_MK2","SWEEPERSHOTGUN","SAWNOFFSHOTGUN","BULLPUPSHOTGUN","ASSAULTSHOTGUN","MUSKET","HEAVYSHOTGUN","DBSHOTGUN","SNIPERRIFLE","HEAVYSNIPER","HEAVYSNIPER_MK2","MARKSMANRIFLE","MARKSMANRIFLE_MK2","GRENADELAUNCHER","GRENADELAUNCHER_SMOKE","RPG","MINIGUN","FIREWORK","RAILGUN","HOMINGLAUNCHER","COMPACTLAUNCHER","GRENADE","STICKYBOMB","PROXMINE","BZGAS","SMOKEGRENADE","MOLOTOV","FIREEXTINGUISHER","PETROLCAN","SNOWBALL","FLARE","BALL" },
       allwepwithWEAPON = {"waeapon_dagger","weapon_bat","weapon_bottle","weapon_crowbar","weapon_flashlight","weapon_unarmed","weapon_golfclub","weapon_hammer","weapon_hatchet","weapon_knuckle","weapon_knife","weapon_machete","weapon_switchblade","weapon_nightstick","weapon_wrench","weapon_battleaxe","weapon_poolcue","weapon_stone_hatchet","weapon_pistol","weapon_pistol_mk2","weapon_combatpistol","weapon_appistol","weapon_stungun","weapon_pistol50","weapon_snspistol","weapon_snspistol_mk2","weapon_heavypistol","weapon_vintagepistol","weapon_flaregun","weapon_marksmanpistol","weapon_revolver","weapon_revolver_mk2","weapon_doubleaction","weapon_raypistol","weapon_ceramicpistol","weapon_navyrevolver","weapon_gadgetpistol","weapon_microsmg","weapon_smg","weapon_smg_mk2","weapon_assaultsmg","weapon_combatpdw","weapon_machinepistol","weapon_minismg","weapon_raycarbine","weapon_pumpshotgun","weapon_pumpshotgun_mk2","weapon_sawnoffshotgun","weapon_assaultshotgun","weapon_bullpupshotgun","weapon_musket","weapon_heavyshotgun","weapon_dbshotgun","weapon_autoshotgun","weapon_combatshotgun","weapon_assaultrifle","weapon_assaultrifle_mk2","weapon_carbinerifle","weapon_carbinerifle_mk2","weapon_advancedrifle","weapon_specialcarbine","weapon_specialcarbine_mk2","weapon_bullpuprifle","weapon_bullpuprifle_mk2","weapon_compactrifle","weapon_militaryrifle","weapon_mg","weapon_combatmg","weapon_combatmg_mk2","weapon_gusenberg","weapon_sniperrifle","weapon_heavysniper","weapon_heavysniper_mk2","weapon_marksmanrifle","weapon_marksmanrifle_mk2","weapon_rpg","weapon_grenadelauncher","weapon_grenadelauncher_smoke","weapon_minigun","weapon_firework","weapon_railgun","weapon_hominglauncher","weapon_compactlauncher","weapon_rayminigun","weapon_grenade","weapon_bzgas","weapon_molotov","weapon_stickybomb","weapon_proxmine","weapon_snowball","weapon_pipebomb","weapon_ball","weapon_smokegrenade","weapon_flare","weapon_petrolcan","weapon_fireextinguisher","weapon_hazardcan",},
       allwepwithWEAPONGlife = {"WT_RIFLE_ADV","WT_PIST_AP","WT_RIFLE_ASL","WT_RIFLE_ASL2","WT_SG_ASL","WT_SMG_ASL","WT_AUTOSHGN","WT_BAT","WT_BALL","WT_BATTLEAXE","WT_BOTTLE","WT_BULLRIFLE","WT_BULLRIFLE2","WT_SG_BLP","WT_BZGAS","WT_RIFLE_CBN","WT_RIFLE_CBN2","M60","M60 MK II","WT_COMBATPDW","WT_PIST_CBT","WT_CMPGL","WT_CMPRIFLE","WT_CROWBAR","Dagger","WT_DBSHGN","WT_REV_DA","WT_FIRE","WT_FWRKLNCHR","WT_FLARE","WT_FLAREGUN","WT_FLASHLIGHT","WT_GOLFCLUB","WT_GNADE","WT_GL","WT_GUSENBERG","WT_HAMMER","WT_HATCHET","WT_HEAVYPSTL","WT_HVYSHOT","AWP","AWP MK II","WT_HOMLNCH","WT_KNIFE","WT_KNUCKLE","WT_MACHETE","WT_MCHPIST","WT_MKPISTOL","WT_MKRIFLE","WT_MKRIFLE2","WT_MG","WT_SMG_MCR","WT_MINIGUN","WT_MINISMG","WT_MOLOTOV","WT_MUSKET","WT_NGTSTK","WT_PETROL","WT_PIPEBOMB","WT_PIST","WT_PIST_50","WT_PIST2","WT_POOLCUE","WT_PRXMINE","WT_SG_PMP","WT_SG_PMP2","WT_RAILGUN","WT_REVOLVER","WT_REVOLVER2","WT_RPG","WT_SG_SOF","WT_SMG","WT_SMG2","WT_GNADE_SMK","WT_SNIP_RIF","WT_SNWBALL","WT_SNSPISTOL","WT_SNSPISTOL2","WT_RIFLE_SCBN","WT_SPCARBINE2","WT_GNADE_STK","WT_STUN","WT_SWBLADE","WT_UNARMED","WT_VPISTOL","WT_WRENCH","WT_RAYPISTOL","WT_RAYCARBINE","WT_SHATCHET","WT_CERPST","WT_REV_NV","WT_CMBSHGN","WT_MLTRYRFL",},
       natives = {}, us = {tab = 'Player'}, menu = {loader = DuduMenuPauBigzz}, pos = {}, friends = {}, 
       Keybinds = {
           ['Noclip'] = {'-', 1337},
           ['GLife-Noclip'] = {'-', 1337},
           ['Freecam'] = {'-', 1337},
           ['FillAmmo'] = {'-', 1337},
           ['RepairVehicle'] = {'-', 1337},
           ['Glifefarm'] = {'-', 1337},
           ['Godmode'] = {'-', 1337},
           ['Heal'] = {'-', 1337},
           ['Armor'] = {'-', 1337},
           ['Fastrun'] = {'-', 1337},
           ['Maxtune'] = {'-', 1337},
           ['FlipVehicle'] = {'-', 1337},
           ['Revive'] = {'-', 1337},
           ['TeleporToWaypoint'] = {'-', 1337},
           ['TeleportZombies'] = {'-', 1337},
           --['SpawnZombies'] = {'-', 1337},
           ['SetZombieHP'] = {'-', 1337},
           ['PanicKey'] = {'-', 1337},
           ['AutoKillZomb'] = {'-', 1337},		
   
       },
       _shit_ThisDuduMenuPauBigppematicShit = {
           _ud_abs = DuduMenuPauBigpp.abs,
           _ud_atan2 = DuduMenuPauBigpp.atan2,
           _ud_ceil = DuduMenuPauBigpp.ceil,
           _ud_cos = DuduMenuPauBigpp.cos,
           _ud_deg = DuduMenuPauBigpp.deg,
           _ud_pi = DuduMenuPauBigpp.pi,
           _ud_rad = DuduMenuPauBigpp.rad,
           _ud_random = DuduMenuPauBigpp.random,
           _ud_sin = DuduMenuPauBigpp.sin,
           _ud_sqrt = DuduMenuPauBigpp.sqrt,
           _ud_floor = DuduMenuPauBigpp.floor,  
           _ud_clamp = DuduMenuPauBigpp.clamp,
           _ud_vectorthree = vector3,
           _ud_Ppairs = pairs,
           _ud_Iipairs = ipairs,
       },
       _shitlol_ThisStringShit = {
           _ud_format =format,
           _ud_upper =upper,
           _ud_len =len,
           _ud_lower =lower,
           _ud_sub =sub,
           _ud_print = print,
           _ud_gmatch =gmatch,
       },
       _shitmeh_ThisCoroutineShit = {
           _ud_wrap = coroutine.wrap,
           _ud_yield = coroutine.yield,
           _ud_metatable = setmetatable,
       },
       _shitfuck_ThisTableShit = {
           _ud_tremove= table.remove,
           _ud_tinsert= table.insert,
           _ud_tunpack= table.unpack,
           _ud_msgpack= msgpack.pack,
           _ud_msgunpack= msgpack.unpack,
       },
       n = {
           _ud_string = tostring, 
           _ud_num = tonumber,
           _ud_DuduMenuPauBigtt = _c.DuduMenuPauBigtt,
           _ud_thr = _c.CreateThread,
           _ud_inv = _c.InvokeNative,
           _ud_rra = _c.ReturnResultAnyway,
           _ud_int = _c.PointerValueInt,
           _ud_pvv = _c.PointerValueVector,
           _ud_raf = _c.ResultAsFloat,
           _ud_ras = _c.ResultAsString,
           _ud_ral = _c.ResultAsLong,
           _ud_rav = _c.ResultAsVector,
           _ud_rai = _c.ResultAsInteger,
           _ud_pvf = _c.PointerValueFloat,
           _ud_rao = _c.ResultAsObject,
           _ud_ii = _c.PointerValueIntInitialized,
           _ud_pvi = _c.PointerValueInt,
       },

       _MeuPauMenu_ThisIsshitwithall = {
        boundingplayers = DuduMenuPauBigzz, 
        CORNERplayers = DuduMenuPauBigzz,
        healthplayers = DuduMenuPauBigzz, 
        armorplayers = DuduMenuPauBigzz,
        glowplayers = DuduMenuPauBigzz,
        vehicletab = DuduMenuPauBigzz,
        menuenabled = DuduMenuPauBigzz,
        HealthDynamicColor = DuduMenuPauBigzz,
        HudColor = DuduMenuPauBigaa,
        ArmorDynamicColor = DuduMenuPauBigzz,
        newboundplayers = DuduMenuPauBigzz,
        newhealthplayers = DuduMenuPauBigzz,
        newarmorplayers = DuduMenuPauBigzz,
    
    }
    
     
    }



function SpectatePlayer(player)
    local playerPed = PlayerPedId()
    Spectating = not Spectating
    local targetPed = GetPlayerPed(player)

    if (Spectating) then
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, DuduMenuPauBigaa))

        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(DuduMenuPauBigzz, targetPed)

    else
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, DuduMenuPauBigaa))

        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(DuduMenuPauBigaa, targetPed)

    end
end



local function DuduMenuPauBigyy3D(x, y, z, text, r, g, b)
    Citizen.InvokeNative(0xAA0008F3BBB8F416, x, y, z, 0)
    Citizen.InvokeNative(0x66E0276CC5F6B9DA, 0)
    Citizen.InvokeNative(0x038C1F517D7FDCF8, 0)
    Citizen.InvokeNative(0x07C837F9A01C34C9, 0.0, 0.20)
    Citizen.InvokeNative(0xBE6B23FFA53FB442, r, g, b, 0, 125, 255)
    Citizen.InvokeNative(0x465C84BC39F1C351, 0, 0, 0,227,255)
    Citizen.InvokeNative(0x441603240D202FA6, 2, 0, 0, 0, 150)
    Citizen.InvokeNative(0x1CA3E9EAC9D93E5E)
    Citizen.InvokeNative(0x2513DFB0FB8400FE)
    Citizen.InvokeNative(0x25FBB336DF1804CB, "STRING")
    Citizen.InvokeNative(0xC02F4DBFB51D988B, 1)
    Citizen.InvokeNative(0x6C188BE134E074AA, text)
    Citizen.InvokeNative(0xCD015E5BB0D96A57, 0.0, 0.0)
    Citizen.InvokeNative(0xFF0B610F6BE0D7AF)
end

function ScreenText(text, font, centered, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional()
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0,227,255)
	SetTextEdge(1, 0, 0,227,0, 125, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centered)
	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x, y)
end
local function Playerbutaozinhos(text, x, y, outline)
    local cursor_x, cursor_y = GetNuiCursorPosition()
    local widht, height = GetActiveScreenResolution()
    cursor_x = cursor_x / widht
    cursor_y = cursor_y / height
    local widht = GetTextWidht(text, 0, 0.2)
    if
        ((cursor_x) + 0.03 >= x + to_add_X and (cursor_x) - 0.1 <= x + to_add_X and (cursor_y) + 0.009 >= y + to_add_Y and
            (cursor_y) - 0.009 <= y + to_add_Y)
     then
        DuduMenuPauBigyy(text, x + to_add_X - 0.074, y + to_add_Y - 0.005, outline, 0.31, 10, DuduMenuPauBigaa)
    else
        DuduMenuPauBigyy(text, x + to_add_X - 0.074, y + to_add_Y - 0.005, outline, 0.31, 10, DuduMenuPauBigaa)
    end
    if
        ((cursor_x) + 0.03 >= x + to_add_X and (cursor_x) - 0.1 <= x + to_add_X and (cursor_y) + 0.009 >= y + to_add_Y and
            (cursor_y) - 0.009 <= y + to_add_Y and
            IsDisabledControlJustReleased(0, 92))
     then
        return DuduMenuPauBigzz
    else
        return DuduMenuPauBigaa
    end
end

function ShowInfo(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(DuduMenuPauBigzz)
end


local function Playerbutaozinhos2(text, x, y, outline)
    local cursor_x, cursor_y = GetNuiCursorPosition() 
    local widht, height = GetActiveScreenResolution()
    cursor_x = cursor_x / widht
    cursor_y = cursor_y / height
    
    local widht = GetTextWidht(text, 0, 0.2)

    if( (cursor_x) + 0.03 >= x+to_add_X and (cursor_x) - 0.1 <= x+to_add_X and (cursor_y) + 0.009 >= y+to_add_Y and (cursor_y) - 0.009 <= y+to_add_Y) then
        SetTextColour(menucolor.r,menucolor.g,menucolor.b, 0, 125, 255)
        DuduMenuPauBigyy(text, x+to_add_X-0.028, y+to_add_Y-0.011, outline, 0.3, 4, DuduMenuPauBigaa)
    else
        DuduMenuPauBigyy(text, x+to_add_X-0.218, y+to_add_Y-0.011, outline, 0.3, 4, DuduMenuPauBigaa)
    end


    if( (cursor_x) + 0.03 >= x+to_add_X and (cursor_x) - 0.1 <= x+to_add_X and (cursor_y) + 0.009 >= y+to_add_Y and (cursor_y) - 0.009 <= y+to_add_Y and IsDisabledControlJustReleased(0, 92)) then 
        return DuduMenuPauBigzz
    else
        return DuduMenuPauBigaa
    end
end


function meucuuuuuuu(x, y, a9, aa, r, g, b, ab)
    resX, resY = GetActiveScreenResolution()
    local aC, aB = a9 / resX, aa / resY
    local _x, _y = x / resX + aC / 2, y / resY + aB / 2
    DuduMenuPauBiguu(_x, _y, aC, aB, r, g, b, ab)
end
local function ShootAt(target, bone)
    local boneTarget = GetPedBoneCoords(target, GetEntityBoneIndexByName(target, bone), 0.0, 0.0, 0.0)
    SetPedShootsAtCoord(PlayerPedId(), boneTarget, DuduMenuPauBigzz)
end
local function ShootAt2(target, bone, damage)
    local boneTarget = GetPedBoneCoords(target, GetEntityBoneIndexByName(target, bone), 0.0, 0.0, 0.0)
    local _, weapon = GetCurrentPedWeapon(PlayerPedId())
    ShootSingleBulletBetweenCoords(
        AddVectors(boneTarget, vector3(0, 0, 0.1)),
        boneTarget,
        damage,
        DuduMenuPauBigzz,
        weapon,
        PlayerPedId(),
        DuduMenuPauBigzz,
        DuduMenuPauBigzz,
        1000.0
    )
end

function DrawLineBox(entity, r, g, b, a)
	if entity then
		local model = GetEntityModel(entity)
		local min, max = GetModelDimensions(model)
		local top_front_right = GetOffsetFromEntityInWorldCoords(entity, max)
		local top_back_right = GetOffsetFromEntityInWorldCoords(entity, vector3(max.x, min.y, max.z))
		local bottom_front_right = GetOffsetFromEntityInWorldCoords(entity, vector3(max.x, max.y, min.z))
		local bottom_back_right = GetOffsetFromEntityInWorldCoords(entity, vector3(max.x, min.y, min.z))
		local top_front_left = GetOffsetFromEntityInWorldCoords(entity, vector3(min.x, max.y, max.z))
		local top_back_left = GetOffsetFromEntityInWorldCoords(entity, vector3(min.x, min.y, max.z))
		local bottom_front_left = GetOffsetFromEntityInWorldCoords(entity, vector3(min.x, max.y, min.z))
		local bottom_back_left = GetOffsetFromEntityInWorldCoords(entity, min)
	

		DrawLine(top_front_right, top_back_right, r, g, b, a)
		DrawLine(top_front_right, bottom_front_right, r, g, b, a)
		DrawLine(bottom_front_right, bottom_back_right, r, g, b, a)
		DrawLine(top_back_right, bottom_back_right, r, g, b, a)

		DrawLine(top_front_left, top_back_left, r, g, b, a)
		DrawLine(top_back_left, bottom_back_left, r, g, b, a)
		DrawLine(top_front_left, bottom_front_left, r, g, b, a)
		DrawLine(bottom_front_left, bottom_back_left, r, g, b, a)

		DrawLine(top_front_right, top_front_left, r, g, b, a)
		DrawLine(top_back_right, top_back_left, r, g, b, a)
		DrawLine(bottom_front_left, bottom_front_right, r, g, b, a)
		DrawLine(bottom_back_left, bottom_back_right, r, g, b, a)
	end
end

local function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = DuduMenuPauBigpp.floor(DuduMenuPauBigpp.sin(curtime * frequency + 0) * 127 + 128)
    result.g = DuduMenuPauBigpp.floor(DuduMenuPauBigpp.sin(curtime * frequency + 2) * 127 + 128)
    result.b = DuduMenuPauBigpp.floor(DuduMenuPauBigpp.sin(curtime * frequency + 4) * 127 + 128)

    return result
end



function RapePlayer(player)

	local rmodel = "u_m_y_staggrm_01"
	local ped = GetPlayerPed(player)
	local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(player), 0.0, 8.0, 0.5)
	local x = coords.x
	local y = coords.y
	local z = coords.z

	RequestModel(DuduMenuPauBigff(rmodel))
	RequestAnimDict("rcmpaparazzo_2")

	while not HasModelLoaded(DuduMenuPauBigff(rmodel)) and not killmenu do
		DuduMenuPauBigtt(0)
	end

	while not HasAnimDictLoaded("rcmpaparazzo_2") and not killmenu do
		DuduMenuPauBigtt(0)
	end

	local nped = CreatePed(31, rmodel, x, y, z, 0.0, DuduMenuPauBigzz, DuduMenuPauBigzz)
	SetPedComponentVariation(nped, 4, 0, 0, 0)

	SetPedKeepTask(nped)
	TaskPlayAnim(nped, "rcmpaparazzo_2", "shag_loop_a", 2.0, 2.5, -1,49, 0, 16, 0, 0)

	AttachEntityToEntity(nped, ped, 0, 0.0, -0.3, 0.0, 0.0, 0.0, 0.0, DuduMenuPauBigzz, DuduMenuPauBigzz, DuduMenuPauBigzz, DuduMenuPauBigzz, 0, DuduMenuPauBigzz)

end
local function text4(name,outline,size,Justification,xx,yy, font)

    if outline then

        SetTextOutline()

    end

    if font ~= DuduMenuPauBigss and tonumber(font) ~= DuduMenuPauBigss then

    SetTextFont(font)

    else

    SetTextFont(6)

    end

    SetTextProportional(1)

    SetTextScale(100.0, size)

    SetTextEdge(1, 0, 0,227,0 ,125, 255)

    BeginTextCommandDisplayText("STRING")

    AddTextComponentSubstringWebsite(name)

    EndTextCommandDisplayText(xx, yy)

end




local function Menuboxzinha(name,xx,yy,yy2,bool)

    local MbutaozinhoSpriteScale_DSGJHSDIGSDG = { x = 0.050, y = 0.20 }

    local x,y = GetNuiCursorPosition()

    local x_res, y_res = GetActiveScreenResolution()

    local xx2 = xx-0.015

    if bool then


    --DrawSprites("mpleaderboard", "leaderboard_voteblank_icon", xx2, yy2, MbutaozinhoSpriteScale_DSGJHSDIGSDG.x, MbutaozinhoSpriteScale_DSGJHSDIGSDG.y, 0.0, 52, 50, 54, 255)
    DuduMenuPauBiguu(xx2,yy2,0.0050,0.0078,0, 125, 255, 255)

    else
        DuduMenuPauBiguu(xx2,yy2,0.0050,0.01,30,30,30,255)
        DuduMenuPauBiguu(xx2,yy2,0.0050,0.01,30,30,30,255)

    --DrawSprites("mpleaderboard", "leaderboard_voteblank_icon", xx2, yy2, MbutaozinhoSpriteScale_DSGJHSDIGSDG.x, MbutaozinhoSpriteScale_DSGJHSDIGSDG.y-0., 0.0, 52, 50,54, 255)

    end

    --[[if bool then DuduMenuPauBiguu(xx2, yy2, 0.0075, 0.013, 52, 50, 54, 255)DuduMenuPauBiguu(xx2, yy2, 0.006, 0.012, 39, 38, 39, 255)DrawSprites("commonmenu", "shop_tick_icon", xx2, yy2, MbutaozinhoSpriteScale_DSGJHSDIGSDG.x, MbutaozinhoSpriteScale_DSGJHSDIGSDG.y, 0.0, 129, 142, 25, 255)else DuduMenuPauBiguu(xx2, yy2, 0.0075, 0.013, 52, 50, 54, 255)DuduMenuPauBiguu(xx2, yy2, 0.006, 0.012, 39, 38, 39, 255)end]]

    text4(name,DuduMenuPauBigaa,0.40,0,xx,yy - 0.020, 6)

    if( (x / x_res) + 0.030 >= xx and (x / x_res) - 0.029 <= xx and (y / y_res) + 0.009 >= yy and (y / y_res) - 0.01 <= yy) and IsDisabledControlJustReleased(0, 92) then 

        bool = not bool

        
    

        return DuduMenuPauBigzz

end

    return DuduMenuPauBigaa


end 





local function boxzinha(name,xx,yy,yy2,bool)

    local MbutaozinhoSpriteScale_DSGJHSDIGSDG = { x = 0.050, y = 0.20 }

    local x,y = GetNuiCursorPosition()

    local x_res, y_res = GetActiveScreenResolution()

    local xx2 = xx-0.015

    if bool then


    --DrawSprites("mpleaderboard", "leaderboard_voteblank_icon", xx2, yy2, MbutaozinhoSpriteScale_DSGJHSDIGSDG.x, MbutaozinhoSpriteScale_DSGJHSDIGSDG.y, 0.0, 52, 50, 54, 255)
    DuduMenuPauBiguu(xx2,yy2,0.0050,0.0078,255, 0, 0, 255)

    else
        DuduMenuPauBiguu(xx2,yy2,0.0050,0.01,30,30,30,255)
        DuduMenuPauBiguu(xx2,yy2,0.0050,0.01,30,30,30,255)

    --DrawSprites("mpleaderboard", "leaderboard_voteblank_icon", xx2, yy2, MbutaozinhoSpriteScale_DSGJHSDIGSDG.x, MbutaozinhoSpriteScale_DSGJHSDIGSDG.y-0., 0.0, 52, 50,54, 255)

    end

    --[[if bool then DuduMenuPauBiguu(xx2, yy2, 0.0075, 0.013, 52, 50, 54, 255)DuduMenuPauBiguu(xx2, yy2, 0.006, 0.012, 39, 38, 39, 255)DrawSprites("commonmenu", "shop_tick_icon", xx2, yy2, MbutaozinhoSpriteScale_DSGJHSDIGSDG.x, MbutaozinhoSpriteScale_DSGJHSDIGSDG.y, 0.0, 129, 142, 25, 255)else DuduMenuPauBiguu(xx2, yy2, 0.0075, 0.013, 52, 50, 54, 255)DuduMenuPauBiguu(xx2, yy2, 0.006, 0.012, 39, 38, 39, 255)end]]

    text4(name,DuduMenuPauBigaa,0.40,0,xx,yy - 0.020, 6)

    if( (x / x_res) + 0.030 >= xx and (x / x_res) - 0.029 <= xx and (y / y_res) + 0.009 >= yy and (y / y_res) - 0.01 <= yy) and IsDisabledControlJustReleased(0, 92) then 

        bool = not bool

        
    

        return DuduMenuPauBigzz

end

    return DuduMenuPauBigaa


end 




function CagePlayer(player)
	local ped = GetPlayerPed(player)
	local coords = GetEntityCoords(ped)
	local inveh = IsPedInAnyVehicle(ped)

	if inveh then
		
		obj = CreateObject(DuduMenuPauBigff("prop_const_fence03b_cr"), coords.x -6.8, coords.y + 1, coords.z - 1.5, 0, 1, 1)
		SetEntityHeading(obj, 90.0)
		
		CreateObject(DuduMenuPauBigff("prop_const_fence03b_cr"), coords.x - 0.6, coords.y + 6.8, coords.z - 1.5, 0, 1, 1)
		
	    CreateObject(DuduMenuPauBigff("prop_const_fence03b_cr"), coords.x - 0.6, coords.y - 4.8, coords.z - 1.5, 0, 1, 1)

		obj2 = CreateObject(DuduMenuPauBigff("prop_const_fence03b_cr"), coords.x + 4.8, coords.y + 1, coords.z - 1.5, 0, 1, 1)
		SetEntityHeading(obj2, 90.0)
		
		obj = CreateObject(DuduMenuPauBigff("prop_const_fence03b_cr"), coords.x -6.8, coords.y + 1, coords.z + 1.3, 0, 1, 1)
		SetEntityHeading(obj, 90.0)
		
		CreateObject(DuduMenuPauBigff("prop_const_fence03b_cr"), coords.x - 0.6, coords.y + 6.8, coords.z + 1.3, 0, 1, 1)
		
	    CreateObject(DuduMenuPauBigff("prop_const_fence03b_cr"), coords.x - 0.6, coords.y - 4.8, coords.z + 1.3, 0, 1, 1)

		obj2 = CreateObject(DuduMenuPauBigff("prop_const_fence03b_cr"), coords.x + 4.8, coords.y + 1, coords.z + 1.3, 0, 1, 1)
		SetEntityHeading(obj2, 90.0)
	else

	local obj = CreateObject(DuduMenuPauBigff("prop_fnclink_03gate5"), coords.x - 0.6, coords.y - 1, coords.z - 1, 1, 1, 1)
	FreezeEntityPosition(obj, DuduMenuPauBigzz)
	local obj2 = CreateObject(DuduMenuPauBigff("prop_fnclink_03gate5"), coords.x - 0.55, coords.y - 1.05, coords.z - 1, 1, 1, 1)
	SetEntityHeading(obj2, 90.0)
	FreezeEntityPosition(obj2, DuduMenuPauBigzz)
	local obj3 = CreateObject(DuduMenuPauBigff("prop_fnclink_03gate5"), coords.x - 0.6, coords.y + 0.6, coords.z - 1, 1, 1, 1)
	FreezeEntityPosition(obj3, DuduMenuPauBigzz)
	local obj4 = CreateObject(DuduMenuPauBigff("prop_fnclink_03gate5"), coords.x + 1.05, coords.y - 1.05, coords.z - 1, 1, 1, 1)
	SetEntityHeading(obj4, 90.0)
	FreezeEntityPosition(obj4, DuduMenuPauBigzz)
	local obj5 = CreateObject(DuduMenuPauBigff("prop_fnclink_03gate5"), coords.x - 0.6, coords.y - 1, coords.z + 1.5, 1, 1, 1)
	FreezeEntityPosition(obj5, DuduMenuPauBigzz)
	local obj6 = CreateObject(DuduMenuPauBigff("prop_fnclink_03gate5"), coords.x - 0.55, coords.y - 1.05, coords.z + 1.5, 1, 1, 1)
	SetEntityHeading(obj6, 90.0)
	FreezeEntityPosition(obj6, DuduMenuPauBigzz)
	local obj7 = CreateObject(DuduMenuPauBigff("prop_fnclink_03gate5"), coords.x - 0.6, coords.y + 0.6, coords.z + 1.5, 1, 1, 1)
	FreezeEntityPosition(obj7, DuduMenuPauBigzz)
	local obj8 = CreateObject(DuduMenuPauBigff("prop_fnclink_03gate5"), coords.x + 1.05, coords.y - 1.05, coords.z + 1.5, 1, 1, 1)
	SetEntityHeading(obj8, 90.0)
	FreezeEntityPosition(obj8, DuduMenuPauBigzz)

	end
end
function CopyOutfit(player)
local model = GetEntityModel(GetPlayerPed(player))
Citizen.InvokeNative(SetPlayerModel, PlayerId(), model)
DuduMenuPauBigtt(100)
Citizen.InvokeNative(ClonePedToTarget, GetPlayerPed(player),PlayerPedId())
end

function DrawTxt(text, x, y, scale, size)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(scale, size)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DuduMenuPauBigyy(x, y)
end

local function GetKeyboardInput(text)
	if not text then text = "Input" end
    DisplayOnscreenKeyboard(0, "", "", "", "", "", "", 30)
    while (UpdateOnscreenKeyboard() == 0) do
		DrawTxt(text, 0.32, 0.37, 0.0, 0.4)
        DisableAllControlActions(0)
        -- Dont crash the menu when user hits esc
        if IsDisabledControlPressed(0, Keys["ESC"]) then return "" end
        DuduMenuPauBigtt(0)
    end
    if (GetOnscreenKeyboardResult()) then
        local result = GetOnscreenKeyboardResult()
        DuduMenuPauBigtt(0)
        return result
    end
end


local function SpawnVeh(model, PlaceSelf, SpawnEngineOn)
    RequestModel(DuduMenuPauBigff(model))
    DuduMenuPauBigtt(500)
    if HasModelLoaded(DuduMenuPauBigff(model)) then
        local coords = GetEntityCoords(PlayerPedId())
        local xf = GetEntityForwardX(PlayerPedId())
        local yf = GetEntityForwardY(PlayerPedId())
        local heading = GetEntityHeading(PlayerPedId())
        local veh = CreateVehicle(DuduMenuPauBigff(model), coords.x + xf * 5, coords.y + yf * 5, coords.z, heading, 1, 1)
        if PlaceSelf then SetPedIntoVehicle(PlayerPedId(), veh, -1) end
        if SpawnEngineOn then SetVehicleEngineOn(veh, 1, 1) end
        return veh
    end  
end


	local function GetServerIPWithoutPort_UDGYUSDGFDGF(...)
		local ip_UDYUDSGYKFDG = GetServerIP_uqweuiodaopiu()
		if ip_UDYUDSGYKFDG == DuduMenuPauBigss then
		return 'nieznaleziono ip'
		else
		returnsub(ip_UDYUDSGYKFDG, 0,find(ip_UDYUDSGYKFDG, ":") - 1)
		end
	end
	
local function GetServerPort_UDGUYSDFGKFD(...)
local s_ufdhsgudigsdfg = GetServerIP_uqweuiodaopiu()
local xd_duhsfigdsf, xd2_duhsuydhgksdfg =find(s_ufdhsgudigsdfg, ":")
local to_return_DSUGHIDSG =sub(s_ufdhsgudigsdfg, xd_duhsfigdsf + 1)
return to_return_DSUGHIDSG
end

local function GetYourId_oiaioaoiwdiopopmas(...)
return Citizen.InvokeNative(0x4d97bcc7, Citizen.InvokeNative(0x4F8644AF03D0E0D6), Citizen.ReturnResultAnyway(), Citizen.ResultAsInteger())
end

local function GetPlayerId_OIDHUFIDSUGLFD(...)
return Citizen.InvokeNative(0x4d97bcc7, ..., Citizen.ReturnResultAnyway(), Citizen.ResultAsInteger())
end
function roupinha()
    resetAppearance()
    local model = "mp_m_freemode_01"
    RequestModel(DuduMenuPauBigff(model))
    DuduMenuPauBigtt(1)
    if HasModelLoaded(DuduMenuPauBigff(model)) then
        SetPlayerModel(PlayerId(), DuduMenuPauBigff(model))
    end
end
local function a0(a1, W, a2)
    if a1 == "HATS" or a1 == "GLASSES" or a1 == "EARS" then
        if a1 == "HATS" then
            fam_DUHSGOSDIUGIHOSDG = 0
        elseif a1 == "GLASSES" then
            fam_DUHSGOSDIUGIHOSDG = 1
        elseif a1 == "EARS" then
            fam_DUHSGOSDIUGIHOSDG = 2
        end
        Citizen.InvokeNative(
            0x93376B65A266EB5F,
            Citizen.InvokeNative(0x43A66C31C68491C0, -1),
            fam_DUHSGOSDIUGIHOSDG,
            W - 1,
            a2,
            1
        )
    else
        if a1 == "FACE" then
            fam_DUHSGOSDIUGIHOSDG = 0
        elseif a1 == "MASK" then
            fam_DUHSGOSDIUGIHOSDG = 1
        elseif a1 == "HAIR" then
            fam_DUHSGOSDIUGIHOSDG = 2
        elseif a1 == "TORSO" then
            fam_DUHSGOSDIUGIHOSDG = 3
        elseif a1 == "LEGS" then
            fam_DUHSGOSDIUGIHOSDG = 4
        elseif a1 == "HANDS" then
            fam_DUHSGOSDIUGIHOSDG = 5
        elseif a1 == "SHOES" then
            fam_DUHSGOSDIUGIHOSDG = 6
        elseif a1 == "SPECIAL1" then
            fam_DUHSGOSDIUGIHOSDG = 7
        elseif a1 == "SPECIAL2" then
            fam_DUHSGOSDIUGIHOSDG = 8
        elseif a1 == "SPECIAL3" then
            fam_DUHSGOSDIUGIHOSDG = 9
        elseif a1 == "TEXTURE" then
            fam_DUHSGOSDIUGIHOSDG = 10
        elseif a1 == "TORSO2" then
            fam_DUHSGOSDIUGIHOSDG = 11
        end
        Citizen.InvokeNative(
            0x262B14F48D29DE80,
            Citizen.InvokeNative(0x43A66C31C68491C0, -1),
            fam_DUHSGOSDIUGIHOSDG,
            W,
            a2,
            0
        )
    end
end
function resetAppearancee()
    roupinha()
    changeAppearance("MAOS", 1, 1)
    a0("HATS", 96, 0)
    changeAppearance("CAMISA", 40, 0)
    changeAppearance("JAQUETA", 15, 0)
    changeAppearance("CALCA", 16, 8)
    changeAppearance("SAPATO", 6, 0)
    changeAppearance("MASCARA", 35, 0)
    changeAppearance("SPECIAL2", 15, 0)
end
function DelVeh(Z)
    SetEntityAsMissionEntity(Z, 1, 1)
    DeleteEntity(Z)
end
function CargoplaneServer()
    local playerlist = GetActivePlayers()
    
    local model = "cargoplane"

    if HasModelLoaded(DuduMenuPauBigff(model)) then

    else
        RequestModel(DuduMenuPauBigff(model))
        DuduMenuPauBigtt(500)
    end

            local coords = GetEntityCoords(GetPlayerPed(currPlayer))
    
            local busone = CreateVehicle(DuduMenuPauBigff(model), coords.x + 5.0, coords.y + 1.0, coords.z, 0.0, 1, 1)
            local bustwo = CreateVehicle(DuduMenuPauBigff(model), coords.x + 5.0, coords.y + 1.0, coords.z, 0.0, 1, 1)
            local currPlayer = playerlist[i]
            local coords = GetEntityCoords(GetPlayerPed(currPlayer))
    
            local busone = CreateVehicle(DuduMenuPauBigff(model), coords.x + 5.0, coords.y + 1.0, coords.z, 0.0, 1, 1)
            local bustwo = CreateVehicle(DuduMenuPauBigff(model), coords.x + 5.0, coords.y + 1.0, coords.z, 0.0, 1, 1)
        
    end

    

function engine1(veh)
    SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 0)
SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 11) - 1, arwet)
SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 12) - 1, arwet)
SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 13) - 1, arwet)
SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 15) - 2, arwet)
SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 16) - 1, arwet)
ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 17, DuduMenuPauBigzz)
ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 18, DuduMenuPauBigzz)
ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 19, DuduMenuPauBigzz)
ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), 21, DuduMenuPauBigzz)
SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), arwet), arwet)
end


local function text4(name,outline,size,Justification,xx,yy, font)

    if outline then

        SetTextOutline()

    end

    if font ~= DuduMenuPauBigss and tonumber(font) ~= DuduMenuPauBigss then

    SetTextFont(font)

    else

    SetTextFont(6)

    end

    SetTextProportional(1)

    SetTextScale(100.0, size)

    SetTextEdge(1, 0, 0,227,255)

    BeginTextCommandDisplayText("STRING")

    AddTextComponentSubstringWebsite(name)

    EndTextCommandDisplayText(xx, yy)

end



local function RequestModelSync(model_DSIGHODSIGSD, timeout_DSIUFHISDGSDG)
        timeout_DSIUFHISDGSDG = timeout_DSIUFHISDGSDG or 2500
        local counter_DSGIHSDIUGJDSGDS = 0
        Citizen.InvokeNative(0x963D27A58DF860AC, Citizen.InvokeNative(0xD24D37CC275948CC, model_DSIGHODSIGSD))

        while not Citizen.InvokeNative(0x98A4EB5D89A0C952, Citizen.InvokeNative(0xD24D37CC275948CC, model_DSIGHODSIGSD)) do
            Citizen.InvokeNative(0x963D27A58DF860AC, model_DSIGHODSIGSD)
            counter_DSGIHSDIUGJDSGDS = counter_DSGIHSDIUGJDSGDS + 100
            DuduMenuPauBigtt(0)
            if counter_DSGIHSDIUGJDSGDS >= timeout_DSIUFHISDGSDG then return DuduMenuPauBigaa end
        end

        return DuduMenuPauBigzz
    end
    function ExplodePlayer(target)

        local ped = GetPlayerPed(target)

        local coords = GetEntityCoords(ped)

        AddExplosion(coords.x + 1, coords.y + 1, coords.z + 1, 36, 1.0, DuduMenuPauBigzz, DuduMenuPauBigaa, 0.0)



    end
	
local function SpawnSwastika(ent_DSIUHGIUSDGDS, offZ)

                CreateThread(function()
                    local where = GetOffsetFromEntityInWorldCoords(ent_DSIUHGIUSDGDS, 0.0, 0.0, 0.0)

                    if not Citizen.InvokeNative(0x524AC5ECEA15343E, ent_DSIUHGIUSDGDS) then
                        where = vector3(where.x, where.y, where.z + 5.0)
                    end

                    if offZ then
                        where = vector3(where.x, where.y, where.z + offZ)
                    end

                    local column = {
                        ["up"] = {},
                        ["across"] = {}
                    }

                    for i = 0, 7 do
                        column["up"][i + 1] = {
                            x = 0.0,
                            y = 0.0,
                            z = 1.0 + (2.6 * (i + 1)),
                            _p_ = 90.0,
                            _y_ = 0.0,
                            _r_ = 0.0
                        }
                    end

                    for i = 0, 8 do
                        column["across"][i + 1] = {
                            x = 10.4 + (-2.6 * i),
                            y = 0.0,
                            z = 11.6,
                            _p_ = 90.0,
                            _y_ = 0.0,
                            _r_ = 0.0
                        }
                    end

                    local arms = {
                        ["bottom_right"] = {},
                        ["across_up"] = {},
                        ["top_left"] = {},
                        ["across_down"] = {}
                    }

                    for i = 0, 4 do
                        arms["bottom_right"][i] = {
                            x = -2.6 * i,
                            y = 0.0,
                            z = 1.0,
                            _p_ = 90.0,
                            _y_ = 0.0,
                            _r_ = 0.0
                        }

                        arms["top_left"][i] = {
                            x = 2.6 * i,
                            y = 0.0,
                            z = 22.2,
                            _p_ = 90.0,
                            _y_ = 0.0,
                            _r_ = 0.0
                        }

                        arms["across_down"][i + 1] = {
                            x = 10.4,
                            y = 0.0,
                            z = 12.6 - (2.25 * (i + 1)),
                            _p_ = 90.0,
                            _y_ = 0.0,
                            _r_ = 0.0
                        }
                    end

                    for i = 0, 3 do
                        arms["across_up"][i + 1] = {
                            x = -10.4,
                            y = 0.0,
                            z = 11.6 + (2.6 * (i + 1)),
                            _p_ = 90.0,
                            _y_ = 0.0,
                            _r_ = 0.0
                        }
                    end

                    local positions = {column["up"], column["across"], arms["bottom_right"], arms["across_up"], arms["top_left"], arms["across_down"]}
                    RequestModelSync("prop_container_05a")

                    for _DSGISUDGSD, seg in pairs(positions) do
                        for _DSGISUDGSD, v in pairs(seg) do
                           local obj = Citizen.InvokeNative(0x509D5878EB39E842, Citizen.InvokeNative(0xD24D37CC275948CC, "prop_container_05a"), where.x, where.y, where.z + (offZ or 0), DuduMenuPauBigzz, DuduMenuPauBigzz, DuduMenuPauBigzz)
                            DoNetwork(obj)
                            Citizen.InvokeNative(0x6B9BBD38AB0796DF, obj, ent_DSIUHGIUSDGDS, Citizen.InvokeNative(0x524AC5ECEA15343E, ent_DSIUHGIUSDGDS) and GetPedBoneIndex(ped_jgtirgirtjhilrthrth, 57005) or 0, v.x, v.y, v.z + (offZ or 0), v._p_, v._y_, v._r_, DuduMenuPauBigaa, DuduMenuPauBigzz, DuduMenuPauBigaa, DuduMenuPauBigaa, 1, DuduMenuPauBigzz)
                            DuduMenuPauBigtt(80)
                        end
                    end
                end)
            end

            function GetRamedByVehicle(custom_vehicle, playa)
                    if custom_vehicle then
                        RequestModel(DuduMenuPauBigff(custom_vehicle))
                        while not HasModelLoaded(DuduMenuPauBigff(custom_vehicle)) do
                            DuduMenuPauBigtt(0)
                        end	
                        
                        local coords = GetEntityCoords(GetPlayerPed(playa))
                        local veh = CreateVehicle(DuduMenuPauBigff(custom_vehicle), coords.x, coords.y, coords.z , 1, 1, 1)
                        local rotation = GetEntityRotation(playa)
                        
                        SetVehicleEngineOn(veh, DuduMenuPauBigzz, DuduMenuPauBigzz, DuduMenuPauBigzz)
                        SetEntityRotation(veh, rotation, 0.0, 0.0, 0.0, DuduMenuPauBigzz)
                        SetVehicleForwardSpeed(veh, 500.0)
                    end
                end

            local function KeyInput(TextEntry, ExampleText, MaxStringLength)
                Citizen.InvokeNative(0x32CA01C3, "FMMC_KEY_TIP1", "~r~".. TextEntry .. ":")
                Citizen.InvokeNative(0x00DC833F2568DBF6, 1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
                blockinput_dihgs8ourigdfg = DuduMenuPauBigzz
            
                while Citizen.InvokeNative(0x0CF2B696BBF945AE) ~= 1 and Citizen.InvokeNative(0x0CF2B696BBF945AE) ~= 2 do
                    DuduMenuPauBigtt(0)
                end
            
                if Citizen.InvokeNative(0x0CF2B696BBF945AE) ~= 2 then
                    local dfjs8erfdfg = GetOnscreenKeyboardResult()
                    DuduMenuPauBigtt(500)
                    blockinput_dihgs8ourigdfg = DuduMenuPauBigaa
                    return dfjs8erfdfg
                else
                    DuduMenuPauBigtt(500)
                    blockinput_dihgs8ourigdfg = DuduMenuPauBigaa
                    return DuduMenuPauBigss
                end
            end
    
                    

            local function carrinho()	
                PlaceSelf = DuduMenuPauBigzz
                local playerPed = GetPlayerPed(-1)
                local placa = KeyInput("Sua Indentidade ~r~ OBRIGATORIO PARA NAO TOMAR BAN:", "", 20)
                local model = KeyInput("Nome Do Veiculo", "", 20)
        
                        SpawnVeh(model, PlaceSelf, SpawnEngineOn)
                        local playerVeh = GetVehiclePedIsIn(playerPed, DuduMenuPauBigzz)
        
                        SetVehicleNumberPlateText(playerVeh,placa )
        
                    end

local function warp()

    local cA = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 15.0, 0, 70)
    if not DoesEntityExist(cA) then
        return
    end
    local dO = -1
    TaskWarpPedIntoVehicle(PlayerPedId(), cA, dO)
    DuduMenuPauBigtt(100)
    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa))
    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), DuduMenuPauBigaa)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0)

end











            local function TeleportToWaypoint()
                local entity = PlayerPedId()
                if IsPedInAnyVehicle(entity, DuduMenuPauBigaa) then
                    entity = GetVehiclePedIsUsing(entity)
                end
                local success = DuduMenuPauBigaa
                local blipFound = DuduMenuPauBigaa
                local blipIterator = GetBlipInfoIdIterator()
                local blip = GetFirstBlipInfoId(8)
                
                while DoesBlipExist(blip) do
                    if GetBlipInfoIdType(blip) == 4 then
                        cx, cy, cz = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector()))--GetBlipInfoIdCoord(blip)
                        blipFound = DuduMenuPauBigzz
                        break
                    end
                    blip = GetNextBlipInfoId(blipIterator)
                    DuduMenuPauBigtt(0)
                end
                
                if blipFound then
                    local groundFound = DuduMenuPauBigaa
                    local yaw = GetEntityHeading(entity)
                    
                    for i = 0, 1000, 1 do
                        SetEntityCoordsNoOffset(entity, cx, cy, ToFloat(i), DuduMenuPauBigaa, DuduMenuPauBigaa, DuduMenuPauBigaa)
                        SetEntityRotation(entity, 0, 0, 0, 0, 0)
                        SetEntityHeading(entity, yaw)
                        SetGameplayCamRelativeHeading(0)
                        DuduMenuPauBigtt(0)
                        if GetGroundZFor_3dCoord(cx, cy, ToFloat(i), cz, DuduMenuPauBigaa) then
                            cz = ToFloat(i)
                            groundFound = DuduMenuPauBigzz
                            break
                        end
                    end
                    if not groundFound then
                        cz = -300.0
                    end
                    success = DuduMenuPauBigzz

                else
                

                
                end
                
                if success then
                    SetEntityCoordsNoOffset(entity, cx, cy, cz, DuduMenuPauBigaa, DuduMenuPauBigaa, DuduMenuPauBigzz)
                    SetGameplayCamRelativeHeading(0)
                    if IsPedSittingInAnyVehicle(PlayerPedId()) then
                        if GetPedInVehicleSeat(GetVehiclePedIsUsing(PlayerPedId()), -1) == PlayerPedId() then
                            SetVehicleOnGroundProperly(GetVehiclePedIsUsing(PlayerPedId()))
                        end
                    end
                end
            
            end
              
            

      
            function GetScreenSize()
                local x, y = GetActiveScreenResolution()
                return {x = x, y = y}
            end
            function Rectangle(x, y, a9, aa, r, g, b, ab)
                local ac, ad = GetActiveScreenResolution()
                local ae, af = 1 / ac, 1 / ad
                local ag, ah = ae * x, af * y
                local ai, aj = ae * a9, af * aa
                DuduMenuPauBiguu(ag + ai / 2, ah + aj / 2, ai, aj, r, g, b, ab)
            end
            function hsvToRgb(aa, ak, al, ab)
                local r, g, b
                local l = DuduMenuPauBigpp.floor(aa * 6)
                local am = aa * 6 - l
                local an = al * (1 - ak)
                local ao = al * (1 - am * ak)
                local ap = al * (1 - (1 - am) * ak)
                l = l % 6
                if l == 0 then
                    r, g, b = al, ap, an
                elseif l == 1 then
                    r, g, b = ao, al, an
                elseif l == 2 then
                    r, g, b = an, al, ap
                elseif l == 3 then
                    r, g, b = an, ao, al
                elseif l == 4 then
                    r, g, b = ap, an, al
                elseif l == 5 then
                    r, g, b = al, an, ao
                end
                return DuduMenuPauBigpp.floor(r * 255 + 0.5), DuduMenuPauBigpp.floor(g * 255 + 0.5), DuduMenuPauBigpp.floor(b * 255 + 0.5), DuduMenuPauBigpp.floor(ab * 255)
            end
            function Gradient(x, y, a9, aa, aq, r, g, b, ab, ar, as, at, au)
                if aq then
                    for l = 0, a9, 2 do
                        if l > a9 then
                            break
                        end
                        local ab = DuduMenuPauBigpp.floor((au - ab) / a9 * l + ab)
                        Rectangle(x + l, y, l < a9 - 1 and 2 or 1, aa, ar, as, at, DuduMenuPauBigpp.abs(ab))
                    end
                else
                    for l = 0, aa, 2 do
                        if l > aa then
                            break
                        end
                        local ab = DuduMenuPauBigpp.floor((au - ab) / aa * l + ab)
                        Rectangle(x, y + l, a9, l < aa - 1 and 2 or 1, ar, as, at, DuduMenuPauBigpp.abs(ab))
                    end
                end
            end
            function HSVGradient(x, y, a9, aa, aq, av, aw, ax, ay, az, aA)
                Rectangle(x, y, a9, aa, hsvToRgb(av, aw, ax, 1))
                if aq then
                    for l = 0, a9, 2 do
                        local aB, ak, al = (ay - av) / a9 * l + av, (az - aw) / a9 * l + aw, (aA - ax) / a9 * l + ax
                        Rectangle(x + l, y, 2, aa, hsvToRgb(aB, ak, al, 1))
                    end
                else
                    for l = 0, aa, 2 do
                        local aB, ak, al = (ay - av) / aa * l + av, (az - aw) / aa * l + aw, (aA - ax) / aa * l + ax
                        Rectangle(x, y + l, a9, 2, hsvToRgb(aB, ak, al, 1))
                    end
                end
            end
            function DuduMenuPauBiguuerinio(x, y, a9, aa, r, g, b, ab)
                resX, resY = GetActiveScreenResolution()
                local aC, aB = a9 / resX, aa / resY
                local _x, _y = x / resX + aC / 2, y / resY + aB / 2
                DuduMenuPauBiguu(_x, _y, aC, aB, r, g, b, ab)
            end
            function Mouse(aD)
                local x, y = GetNuiCursorPosition()
                local a9, aa = GetActiveScreenResolution()
                if aD then
                    x = x / a9
                    y = y / aa
                end
                return {x = x, y = y}
            end
            local function aE(m, x, y, aF, aG, aH, aI)
                SetTextScale(0.0, tonumber(aF))
                SetTextFont(aH)
                if aG then
                    SetTextOutline()
                end
                SetTextCentre(aI)
                BeginTextCommandDisplayText("STRING")
                AddTextComponentSubstringWebsite(m)
                EndTextCommandDisplayText(x, y)
                return EndTextCommandGetWidth(DuduMenuPauBigzz)
            end
            
	
local function ChangeModel(model)			
	local hash_SDGHISDGDS = Citizen.InvokeNative(0xD24D37CC275948CC, tostring(model))
	local player_SDIGJOSIDGSD = Citizen.InvokeNative(0x4F8644AF03D0E0D6)
				
    RequestModelSync(tostring(model))

    Citizen.InvokeNative(0x00A1CADD00108836, player_SDIGJOSIDGSD, hash_SDGHISDGDS)
	Citizen.InvokeNative(0x262B14F48D29DE80, Citizen.InvokeNative(0x43A66C31C68491C0, -1), 0, 0, 0, 0)
    Citizen.InvokeNative(0xE532F5D78798DAAB, hash_SDGHISDGDS)
end

local function KeyBoardInput(TextEntry, ExampleText, MaxStringLength)
	Citizen.InvokeNative(0x32CA01C3, "FMMC_KEY_TIP1", "~r~".. TextEntry .. ":")
	Citizen.InvokeNative(0x00DC833F2568DBF6, 1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
    blockinput_dihgs8ourigdfg = DuduMenuPauBigzz

    while Citizen.InvokeNative(0x0CF2B696BBF945AE) ~= 1 and Citizen.InvokeNative(0x0CF2B696BBF945AE) ~= 2 do
        DuduMenuPauBigtt(0)
    end

    if Citizen.InvokeNative(0x0CF2B696BBF945AE) ~= 2 then
        local dfjs8erfdfg = GetOnscreenKeyboardResult()
        DuduMenuPauBigtt(500)
        blockinput_dihgs8ourigdfg = DuduMenuPauBigaa
        return dfjs8erfdfg
    else
        DuduMenuPauBigtt(500)
        blockinput_dihgs8ourigdfg = DuduMenuPauBigaa
        return DuduMenuPauBigss
    end
end

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end
        
        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)
        
        local next = DuduMenuPauBigzz
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next
        
        enum.destructor, enum.handle = DuduMenuPauBigss, DuduMenuPauBigss
        disposeFunc(iter)
    end)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end
local h = {
    ThisIsSliders = {
        [1] = {max = 255, min = 0, value = 247},
        [2] = {max = 255, min = 0, value = 255},
        [3] = {max = 255, min = 0, value = 0},
        [4] = {max = 255, min = 0, value = 255},
        [5] = {max = 255, min = 0, value = 255},
        [6] = {max = 255, min = 0, value = 255},
        [7] = {max = 255, min = 0, value = 0},
        [8] = {max = 255, min = 0, value = 0},
        [9] = {max = 255, min = 0, value = 0},
        [10] = {max = 255, min = 0, value = 255},
        [11] = {max = 255, min = 0, value = 255},
        [12] = {max = 255, min = 0, value = 255},
        [13] = {max = 255, min = 0, value = 255},
        [14] = {max = 255, min = 0, value = 0},
        [15] = {max = 255, min = 0, value = 0},
        [16] = {max = 255, min = 0, value = 255},
        [17] = {max = 255, min = 0, value = 255},
        [18] = {max = 255, min = 0, value = 255},
        [19] = {max = 255, min = 0, value = 0},
        [20] = {max = 255, min = 0, value = 76},
        [21] = {max = 255, min = 0, value = 255},
        [22] = {max = 255, min = 0, value = 255},
        [23] = {max = 255, min = 0, value = 0},
        [24] = {max = 255, min = 0, value = 0}
    }
}
function text_szpachlan_szmata(nazwa_szpachlan_szmata,outline_szpachlan_szmata,size_szpachlan_szmata,Justification_szpachlan_szmata,x,y, czcionka, centre)
	if outline_szpachlan_szmata then
		SetTextOutline()
	end
	if czcionka ~= DuduMenuPauBigss and tonumber(czcionka) ~= DuduMenuPauBigss then
	SetTextFont(czcionka)
	else
	SetTextFont(0)
	end
	if centre then
	SetTextCentre(DuduMenuPauBigzz)
	end
    SetTextProportional(1)
    SetTextScale(100.0, size_szpachlan_szmata)
    SetTextEdge(1, 0, 0, 0, 255)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(nazwa_szpachlan_szmata)
    EndTextCommandDisplayText(x, y)
end
function bind()
    local klikniete = DuduMenuPauBigss
    local napis = DuduMenuPauBigss
    local zbindowane = DuduMenuPauBigaa
        while not zbindowane do
            DuduMenuPauBigtt(1)
            DuduMenuPauBiguu(0.5, 0.5, 0.25, 0.3, 30, 30, 30, 255)
            text_szpachlan_szmata("Aperte a tecla pra mudar a bind!",DuduMenuPauBigaa,0.35,0,0.425,0.48)
            for k, v in pairs(keys) do
                if IsDisabledControlPressed(0, v) then
                    klikniete = v
                    napis = k
                end
            end
            if klikniete ~= DuduMenuPauBigss then
                zbindowane = DuduMenuPauBigzz
                return klikniete, napis
            end
        end
    end
function ColorPicker(R, aJ, aK)
    colorpicker = DuduMenuPauBigzz
    open = DuduMenuPauBigaa
    local R = {
        HSV = {H = 0, S = 0, V = 0},
        RGB = {R = R, G = aJ, B = aK},
        Held = {Hue = DuduMenuPauBigaa, Value = DuduMenuPauBigaa},
        Opened = DuduMenuPauBigaa,
        Turned = DuduMenuPauBigzz
    }
    while R.Turned do
        DuduMenuPauBiggg(0, 1, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 2, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 142, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 322, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 106, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 25, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 24, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 257, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 32, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 31, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 30, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 34, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 23, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 22, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 16, DuduMenuPauBigzz)
        DuduMenuPauBiggg(0, 17, DuduMenuPauBigzz)
        local a9, aa = GetScreenSize().x, GetScreenSize().y
        Rectangle(0, 0, a9, aa, 24, 24, 24, 200)
        local aL, aM = a9 / 2 - 100, aa / 2 - 100
        Rectangle(aL - 2, aM - 2, 204, 228, 18, 18, 18, 255)
        Rectangle(aL - 1, aM - 1, 202, 226, 42, 42, 42, 255)
        Rectangle(aL, aM, 200, 224, 24, 24, 24, 255)
        Rectangle(aL, aM, 200, 5, R.RGB.R, R.RGB.G, R.RGB.B, 255)
        Rectangle(aL - 2 + 5, aM - 2 + 196, 194, 26, 18, 18, 18, 255)
        Rectangle(aL - 1 + 5, aM - 1 + 196, 192, 24, 42, 42, 42, 255)
        Rectangle(aL + 5, aM + 196, 190, 22, 24, 24, 24, 255)
        local r, g, b, ab = hsvToRgb(R.HSV.H, R.HSV.S, R.HSV.V, 1)
        aE("R: " .. r .. " G: " .. g .. " B: " .. b .. "", 0.451, 0.59, 0.29, DuduMenuPauBigzz, 4, DuduMenuPauBigaa)
        local r, g, b, ab = hsvToRgb(R.HSV.H, 1, 1, 1)
        Rectangle(aL + 10, aM + 10, 160, 180, r, g, b, 255)
        Gradient(aL + 10, aM + 10, 160, 180, DuduMenuPauBigzz, r, g, b, 255, 255, 255, 255, 0)
        Gradient(aL + 10, aM + 10, 160, 180, DuduMenuPauBigaa, 255, 255, 255, 0, 0, 0, 0, 255)
        HSVGradient(aL + 20 + 160, aM + 10, 10, 180, DuduMenuPauBigaa, 0, 1, 1, 1, 1, 1)
        local x, y = GetNuiCursorPosition()
        local a9, aa = GetScreenSize().x, GetScreenSize().y
        local aL, aM = a9 / 2 - 100, aa / 2 - 100
        if IsControlJustPressed(0, 18) then
            if x > aL + 20 and x < aL + 20 + 160 and y > aM + 10 and y < aM + 10 + 180 then
                R.Held.Value = DuduMenuPauBigzz
            end
            if x > aL + 20 + 160 and x < aL + 20 + 160 + 10 and y > aM + 10 and y < aM + 10 + 180 then
                R.Held.Hue = DuduMenuPauBigzz
            end
            if x < aL or x > aL + 200 or y < aM or y > aM + 200 then
                R.Opened = DuduMenuPauBigaa
            end
        end
        if IsDisabledControlPressed(0, 69) then
            if R.Held.Value then
                local aN = x - aL - 10
                local aO = y - aM - 60
                R.HSV.S = DuduMenuPauBigpp.clamp(aN / 180, 0, 1)
                R.HSV.V = DuduMenuPauBigpp.clamp(1 - aO / 160, 0, 1)
            end
            if R.Held.Hue then
                local aP = y - aM + -19
                R.HSV.H = DuduMenuPauBigpp.clamp(aP / 180, 0, 1)
            end
            local r, g, b, ab = hsvToRgb(R.HSV.H, R.HSV.S, R.HSV.V, 1)
            R.RGB.R, R.RGB.G, R.RGB.B = r, g, b
        else
            if R.Held.Value then
                R.Opened = DuduMenuPauBigaa
            end
            R.Held.Value = DuduMenuPauBigaa
            R.Held.Hue = DuduMenuPauBigaa
        end
        DuduMenuPauBiguuerinio(Mouse(DuduMenuPauBigaa).x - 2, Mouse(DuduMenuPauBigaa).y - 7, 3, 13, 0, 0, 0, 255)
        DuduMenuPauBiguuerinio(Mouse(DuduMenuPauBigaa).x - 7, Mouse(DuduMenuPauBigaa).y - 2, 13, 3, 0, 0, 0, 255)
        DuduMenuPauBiguuerinio(Mouse(DuduMenuPauBigaa).x - 1, Mouse(DuduMenuPauBigaa).y - 6, 1, 11, 255, 255, 255, 255)
        DuduMenuPauBiguuerinio(Mouse(DuduMenuPauBigaa).x - 6, Mouse(DuduMenuPauBigaa).y - 1, 11, 1, 255, 255, 255, 255)
        if IsDisabledControlJustPressed(0, 191) then
            open = DuduMenuPauBigzz
            colorpicker = DuduMenuPauBigaa
            R.Turned = DuduMenuPauBigaa
            return R.RGB.R, R.RGB.G, R.RGB.B
        end
        DuduMenuPauBigtt(0)
    end
end


local function corzinhagay()

    h.ThisIsSliders[7].value, h.ThisIsSliders[8].value, h.ThisIsSliders[9].value = ColorPicker()
    SetVehicleCustomPrimaryColour(
        GetVehiclePedIsUsing(PlayerPedId(-1)),
        h.ThisIsSliders[7].value,
        h.ThisIsSliders[8].value,
        h.ThisIsSliders[9].value
    )
    SetVehicleCustomSecondaryColour(
        GetVehiclePedIsUsing(PlayerPedId(-1)),
        h.ThisIsSliders[7].value,
        h.ThisIsSliders[8].value,
        h.ThisIsSliders[9].value
    )
end

local includeself = DuduMenuPauBigzz

local function ExplodeAll(self)
    local plist = GetActivePlayers()
    for i = 0, #plist do
        if not self and i == PlayerId() then i = i + 1 end
        ExplodePlayer(i)
    end
end


local function a0(a1, W, a2)
    if a1 == "HATS" or a1 == "GLASSES" or a1 == "EARS" then
        if a1 == "HATS" then
            fam_DUHSGOSDIUGIHOSDG = 0
        elseif a1 == "GLASSES" then
            fam_DUHSGOSDIUGIHOSDG = 1
        elseif a1 == "EARS" then
            fam_DUHSGOSDIUGIHOSDG = 2
        end
        Citizen.InvokeNative(
            0x93376B65A266EB5F,
            Citizen.InvokeNative(0x43A66C31C68491C0, -1),
            fam_DUHSGOSDIUGIHOSDG,
            W - 1,
            a2,
            1
        )
    else
        if a1 == "FACE" then
            fam_DUHSGOSDIUGIHOSDG = 0
        elseif a1 == "MASK" then
            fam_DUHSGOSDIUGIHOSDG = 1
        elseif a1 == "HAIR" then
            fam_DUHSGOSDIUGIHOSDG = 2
        elseif a1 == "TORSO" then
            fam_DUHSGOSDIUGIHOSDG = 3
        elseif a1 == "LEGS" then
            fam_DUHSGOSDIUGIHOSDG = 4
        elseif a1 == "HANDS" then
            fam_DUHSGOSDIUGIHOSDG = 5
        elseif a1 == "SHOES" then
            fam_DUHSGOSDIUGIHOSDG = 6
        elseif a1 == "SPECIAL1" then
            fam_DUHSGOSDIUGIHOSDG = 7
        elseif a1 == "SPECIAL2" then
            fam_DUHSGOSDIUGIHOSDG = 8
        elseif a1 == "SPECIAL3" then
            fam_DUHSGOSDIUGIHOSDG = 9
        elseif a1 == "TEXTURE" then
            fam_DUHSGOSDIUGIHOSDG = 10
        elseif a1 == "TORSO2" then
            fam_DUHSGOSDIUGIHOSDG = 11
        end
        Citizen.InvokeNative(
            0x262B14F48D29DE80,
            Citizen.InvokeNative(0x43A66C31C68491C0, -1),
            fam_DUHSGOSDIUGIHOSDG,
            W,
            a2,
            0
        )
    end
end

local function _()
    Citizen.InvokeNative(0xCD8A7537A9B52F06, Citizen.InvokeNative(0x43A66C31C68491C0, -1))
    Citizen.InvokeNative(0x0E5173C163976E38, Citizen.InvokeNative(0x43A66C31C68491C0, -1))
    Citizen.InvokeNative(0x262B14F48D29DE80, Citizen.InvokeNative(0x43A66C31C68491C0, -1), 1, 0, 0, 0)
    Citizen.InvokeNative(0x262B14F48D29DE80, Citizen.InvokeNative(0x43A66C31C68491C0, -1), 5, 0, 0, 0)
    Citizen.InvokeNative(0x262B14F48D29DE80, Citizen.InvokeNative(0x43A66C31C68491C0, -1), 9, 0, 0, 0)
end

local function atela()
    local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer))

    SetEntityCoordsNoOffset(PlayerPedId(), coords, 0.0, 0.0, 0.0) 


end
function TSE(is_server,event,...)
	local args=msgpack.pack({...})
	if is_server then
		DuduMenuPauBigwwInternal(event,args,args:len())
	else
		TriggerEventInternal(event,args,args:len())
	end
end
local function ClonePed(target)
    local ped = GetPlayerPed(target)
    local me = PlayerPedId()

    hat = GetPedPropIndex(ped, 0)
    hat_texture = GetPedPropTextureIndex(ped, 0)

    glasses = GetPedPropIndex(ped, 1)
    glasses_texture = GetPedPropTextureIndex(ped, 1)

    ear = GetPedPropIndex(ped, 2)
    ear_texture = GetPedPropTextureIndex(ped, 2)

    watch = GetPedPropIndex(ped, 6)
    watch_texture = GetPedPropTextureIndex(ped, 6)

    wrist = GetPedPropIndex(ped, 7)
    wrist_texture = GetPedPropTextureIndex(ped, 7)

    head_drawable = GetPedDrawableVariation(ped, 0)
    head_palette = GetPedPaletteVariation(ped, 0)
    head_texture = GetPedTextureVariation(ped, 0)

    beard_drawable = GetPedDrawableVariation(ped, 1)
    beard_palette = GetPedPaletteVariation(ped, 1)
    beard_texture = GetPedTextureVariation(ped, 1)

    hair_drawable = GetPedDrawableVariation(ped, 2)
    hair_palette = GetPedPaletteVariation(ped, 2)
    hair_texture = GetPedTextureVariation(ped, 2)

    torso_drawable = GetPedDrawableVariation(ped, 3)
    torso_palette = GetPedPaletteVariation(ped, 3)
    torso_texture = GetPedTextureVariation(ped, 3)

    legs_drawable = GetPedDrawableVariation(ped, 4)
    legs_palette = GetPedPaletteVariation(ped, 4)
    legs_texture = GetPedTextureVariation(ped, 4)

    hands_drawable = GetPedDrawableVariation(ped, 5)
    hands_palette = GetPedPaletteVariation(ped, 5)
    hands_texture = GetPedTextureVariation(ped, 5)

    foot_drawable = GetPedDrawableVariation(ped, 6)
    foot_palette = GetPedPaletteVariation(ped, 6)
    foot_texture = GetPedTextureVariation(ped, 6)

    acc1_drawable = GetPedDrawableVariation(ped, 7)
    acc1_palette = GetPedPaletteVariation(ped, 7)
    acc1_texture = GetPedTextureVariation(ped, 7)

    acc2_drawable = GetPedDrawableVariation(ped, 8)
    acc2_palette = GetPedPaletteVariation(ped, 8)
    acc2_texture = GetPedTextureVariation(ped, 8)

    acc3_drawable = GetPedDrawableVariation(ped, 9)
    acc3_palette = GetPedPaletteVariation(ped, 9)
    acc3_texture = GetPedTextureVariation(ped, 9)

    mask_drawable = GetPedDrawableVariation(ped, 10)
    mask_palette = GetPedPaletteVariation(ped, 10)
    mask_texture = GetPedTextureVariation(ped, 10)

    aux_drawable = GetPedDrawableVariation(ped, 11)
    aux_palette = GetPedPaletteVariation(ped, 11)
    aux_texture = GetPedTextureVariation(ped, 11)

    SetPedPropIndex(me, 0, hat, hat_texture, 1)
    SetPedPropIndex(me, 1, glasses, glasses_texture, 1)
    SetPedPropIndex(me, 2, ear, ear_texture, 1)
    SetPedPropIndex(me, 6, watch, watch_texture, 1)
    SetPedPropIndex(me, 7, wrist, wrist_texture, 1)

    SetPedComponentVariation(me, 0, head_drawable, head_texture, head_palette)
    SetPedComponentVariation(me, 1, beard_drawable, beard_texture, beard_palette)
    SetPedComponentVariation(me, 2, hair_drawable, hair_texture, hair_palette)
    SetPedComponentVariation(me, 3, torso_drawable, torso_texture, torso_palette)
    SetPedComponentVariation(me, 4, legs_drawable, legs_texture, legs_palette)
    SetPedComponentVariation(me, 5, hands_drawable, hands_texture, hands_palette)
    SetPedComponentVariation(me, 6, foot_drawable, foot_texture, foot_palette)
    SetPedComponentVariation(me, 7, acc1_drawable, acc1_texture, acc1_palette)
    SetPedComponentVariation(me, 8, acc2_drawable, acc2_texture, acc2_palette)
    SetPedComponentVariation(me, 9, acc3_drawable, acc3_texture, acc3_palette)
    SetPedComponentVariation(me, 10, mask_drawable, mask_texture, mask_palette)
    SetPedComponentVariation(me, 11, aux_drawable, aux_texture, aux_palette)
end

function DuduMenuPauBigpp.round(first, second)
    return tonumber(string.format("%." .. (second or 0) .. "f", first))
end
function ApplyForce(entity, direction)
    ApplyForceToEntity(
        entity,
        3,
        direction,
        0,
        0,
        0,
        DuduMenuPauBigaa,
        DuduMenuPauBigaa,
        DuduMenuPauBigzz,
        DuduMenuPauBigzz,
        DuduMenuPauBigaa,
        DuduMenuPauBigzz
    )
end
function respawnPed(id, cords, int)
	SetEntityCoordsNoOffset(id, cords.x, cords.y, cords.z, DuduMenuPauBigaa, DuduMenuPauBigaa, DuduMenuPauBigaa, DuduMenuPauBigzz)
	NetworkResurrectLocalPlayer(cords.x, cords.y, cords.z, int, DuduMenuPauBigzz, DuduMenuPauBigaa)
	SetPlayerInvincible(id, DuduMenuPauBigaa)
	TSE(DuduMenuPauBigaa, "playerSpawned", cords.x, cords.y, cords.z)
	ClearPedBloodDamage(id)
end
local function AddVectors(one, two)
    return vector3(one.x + two.x, one.y + two.y, one.z + two.z)
end
function SubVectors(vect1, vect2)
    return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
end
function ScaleVector(vect, mult)
    return vector3(vect.x * mult, vect.y * mult, vect.z * mult)
end
function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return DuduMenuPauBigpp.floor(num * mult + 0.5) / mult
end
function Oscillate(entity, position, angleFreq, dampRatio)
    local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq * angleFreq))
    local pos2 =
        AddVectors(ScaleVector(GetEntityVelocity(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
    local targetPos = SubVectors(pos1, pos2)
    ApplyForce(entity, targetPos)
end
function nativeRevive()
local coords = GetEntityCoords(PlayerPedId())
        NetworkResurrectLocalPlayer(coords, GetEntityHeading(PlayerPedId()), DuduMenuPauBigzz, DuduMenuPauBigaa)
        ClearPedBloodDamage(PlayerPedId())
        TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
        StopScreenEffect('DeathFailOut')
end

---------FUNCTIONS----------

function kontrols(Disable)
    DuduMenuPauBiggg(0, 1, DuduMenuPauBigzz)
    DuduMenuPauBiggg(0, 2, DuduMenuPauBigzz)
    DuduMenuPauBiggg(0, 142, DuduMenuPauBigzz)
    DuduMenuPauBiggg(0, 322, DuduMenuPauBigzz)
    DuduMenuPauBiggg(0, 106, DuduMenuPauBigzz)
    DuduMenuPauBiggg(0, 25, DuduMenuPauBigzz)
    DuduMenuPauBiggg(0, 24, DuduMenuPauBigzz)
    DuduMenuPauBiggg(0, 257, DuduMenuPauBigzz)
    DuduMenuPauBiggg(0, 23, DuduMenuPauBigzz)
    DuduMenuPauBiggg(0, 16, DuduMenuPauBigzz)
    DuduMenuPauBiggg(0, 17, DuduMenuPauBigzz)

end

function LeftBar()

	if Menubutaozinho("Self", "Self",DuduMenuPauBigzz,0.060,0.40) then
		tab = "Self"
	end

	if Menubutaozinho("Armas", "Armas",DuduMenuPauBigzz,0.060,0.45) then
		tab = "Armas"

	end

	if Menubutaozinho("Veiculos", "Veiculos",DuduMenuPauBigzz,0.060,0.50) then
		tab = "Veiculos"

	end

	if Menubutaozinho("Visu", "Visual",DuduMenuPauBigzz,0.060,0.55) then
		tab = "Visu"

	end

	if Menubutaozinho("Misc", "Misc",DuduMenuPauBigzz,0.060,0.60) then
		tab = "Misc"
	end



    if Menubutaozinho("Players", "Players",DuduMenuPauBigzz,0.060,0.65) then
		tab = "Players"
	end
	
    if Menubutaozinho("Desinjetar", "~r~Desinjetar",DuduMenuPauBigaa,0.060,0.70) then
        asd.toggleHandcuff()
    end 



   


	DrawGeneralAndDrawSecond()

end
local function StripPlayer(target)
    local ped = GetPlayerPed(target)
    RemoveAllPedWeapons(ped, DuduMenuPauBigaa)
end

local function GiveMaxAmmo(target)
    local ped = GetPlayerPed(target)
    for i = 1, #allweapons do
        AddAmmoToPed(ped, DuduMenuPauBigff(allweapons[i]), 9999)
    end
end


function tabs() 
	if tab == "Self" then
        DuduMenuPauBiguu(0.060,0.42,0.023,0.0015,255, 0, 0,255)
        DuduMenuPauBiguu(0.9225, 0.50, 0.15, 0.999, 15, 15, 15, 200)
        DuduMenuPauBigyy("~r~discord.gg/",0.85,0.95,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)
        DuduMenuPauBigyy("~r~by: !     'Dudu#2908",0.85,0.97,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)			
        --0.387
        --0.257        


        if butaozinho("Reviver",DuduMenuPauBigaa,0.925,0.300) then
            resetAppearancee()
            resetAppearance()
            local model = "mp_m_freemode_01"
            RequestModel(DuduMenuPauBigff(model))
            DuduMenuPauBigtt(1)
            if HasModelLoaded(DuduMenuPauBigff(model)) then
                SetPlayerModel(PlayerId(), DuduMenuPauBigff(model))
                resetAppearancee()
            end
        end		


        if butaozinho("Suicidio",DuduMenuPauBigaa,0.925,0.340) then

            SetEntityHealth(PlayerPedId(), 0)


        
        end      
        if butaozinho("Encher Vida",DuduMenuPauBigaa,0.925,0.380) then
            SetEntityHealth(PlayerPedId(), 400)      
        end  

        if butaozinho("TP Waypoint",DuduMenuPauBigaa,0.925,0.420) then
            TeleportToWaypoint()
        end 

        if butaozinho("SuperSoco",DuduMenuPauBigaa,0.925,0.460) then
            SetWeaponDamageModifier("weapon_unarmed", 18.0)
        end

        if butaozinho("Algemar/Desalgemar",DuduMenuPauBigaa,0.925,0.500) then
            vRP.toggleHandcuff()
        end 
        
        
        if boxzinha("Noclip",0.9,0.600,0.600,Nocrip) then
            Nocrip = not Nocrip
            if Nocrip then
                SetEntityVisible(PlayerPedId(), DuduMenuPauBigaa, DuduMenuPauBigaa)
            else
                SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
                SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), DuduMenuPauBigzz, DuduMenuPauBigaa)
                SetEntityVisible(PlayerPedId(), DuduMenuPauBigzz, DuduMenuPauBigaa)
            end
        end

        if boxzinha("Stamina Infinita",0.9,0.630,0.630,stamina) then
			
            stamina = not stamina

        end

        if boxzinha("Invisivel",0.9,0.660,0.660,Invv2) then
			
            Invv2 = not Invv2
            if Invv2 then
                SetEntityVisible(PlayerPedId(), DuduMenuPauBigaa, DuduMenuPauBigaa)
            else
                SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
                SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), DuduMenuPauBigzz, DuduMenuPauBigaa)
                SetEntityVisible(PlayerPedId(), DuduMenuPauBigzz, DuduMenuPauBigaa)
            end

        end
		
        if boxzinha("Magneto",0.9,0.690,0.690,magnetinho) then
			
            magnetinho = not magnetinho
            if magnetinho then
                ShowInfo("~r~Magneto ~r~key ~c~» ~g~[E]")
                Citizen.CreateThread(
                    function()
                        local ForceKey = keys["E"]
                        local Force = 0.5
                        local KeyPressed = DuduMenuPauBigaa
                        local KeyTimer = 0
                        local KeyDelay = 15
                        local ForceEnabled = DuduMenuPauBigaa
                        local StartPush = DuduMenuPauBigaa
                        function forcetick()
                            if (KeyPressed) then
                                KeyTimer = KeyTimer + 1
                                if (KeyTimer >= KeyDelay) then
                                    KeyTimer = 0
                                    KeyPressed = DuduMenuPauBigaa
                                end
                            end
                            if IsDisabledControlPressed(0, ForceKey) and not KeyPressed and not ForceEnabled then
                                KeyPressed = DuduMenuPauBigzz
                                ForceEnabled = DuduMenuPauBigzz
                            end
                            if (StartPush) then
                                StartPush = DuduMenuPauBigaa
                                local pid = PlayerPedId()
                                local CamRot = GetGameplayCamRot(2)
                                local force = 5
                                local Fx = -(DuduMenuPauBigpp.sin(DuduMenuPauBigpp.rad(CamRot.z)) * force * 10)
                                local Fy = (DuduMenuPauBigpp.cos(DuduMenuPauBigpp.rad(CamRot.z)) * force * 10)
                                local Fz = force * (CamRot.x * 0.2)
                                local PlayerVeh = GetVehiclePedIsIn(pid, DuduMenuPauBigaa)
                                for k in EnumerateVehicles() do
                                    SetEntityInvincible(k, DuduMenuPauBigaa)
                                    if IsEntityOnScreen(k) and k ~= PlayerVeh then
                                        ApplyForceToEntity(
                                            k,
                                            1,
                                            Fx,
                                            Fy,
                                            Fz,
                                            0,
                                            0,
                                            0,
                                            DuduMenuPauBigzz,
                                            DuduMenuPauBigaa,
                                            DuduMenuPauBigzz,
                                            DuduMenuPauBigzz,
                                            DuduMenuPauBigzz,
                                            DuduMenuPauBigzz
                                        )
                                    end
                                end
                                for k in EnumeratePeds() do
                                    if IsEntityOnScreen(k) and k ~= pid then
                                        ApplyForceToEntity(
                                            k,
                                            1,
                                            Fx,
                                            Fy,
                                            Fz,
                                            0,
                                            0,
                                            0,
                                            DuduMenuPauBigzz,
                                            DuduMenuPauBigaa,
                                            DuduMenuPauBigzz,
                                            DuduMenuPauBigzz,
                                            DuduMenuPauBigzz,
                                            DuduMenuPauBigzz
                                        )
                                    end
                                end
                            end
                            if IsDisabledControlPressed(0, ForceKey) and not KeyPressed and ForceEnabled then
                                KeyPressed = DuduMenuPauBigzz
                                StartPush = DuduMenuPauBigzz
                                ForceEnabled = DuduMenuPauBigaa
                            end
                            if (ForceEnabled) then
                                local pid = PlayerPedId()
                                local PlayerVeh = GetVehiclePedIsIn(pid, DuduMenuPauBigaa)
                                Markerloc = GetGameplayCamCoord() + (RotationToDirection(GetGameplayCamRot(2)) * 20)
                                DrawMarker(
                                    28,
                                    Markerloc,
                                    0.0,
                                    0.0,
                                    0.0,
                                    0.0,
                                    180.0,
                                    0.0,
                                    1.0,
                                    1.0,
                                    1.0,
                                    magneto_cor.r,
                                    magneto_cor.g,
                                    magneto_cor.b,
                                    120,
                                    DuduMenuPauBigaa,
                                    DuduMenuPauBigzz,
                                    2,
                                    DuduMenuPauBigss,
                                    DuduMenuPauBigss,
                                    DuduMenuPauBigaa
                                )
                                for k in EnumerateVehicles() do
                                    SetEntityInvincible(k, DuduMenuPauBigzz)
                                    if IsEntityOnScreen(k) and (k ~= PlayerVeh) then
                                        RequestControlOnce(k)
                                        FreezeEntityPosition(k, DuduMenuPauBigaa)
                                        Oscillate(k, Markerloc, 0.5, 0.3)
                                    end
                                end
                                for k in EnumeratePeds() do
                                    if IsEntityOnScreen(k) and k ~= PlayerPedId() then
                                        RequestControlOnce(k)
                                        SetPedToRagdoll(k, 4000, 5000, 0, DuduMenuPauBigzz, DuduMenuPauBigzz, DuduMenuPauBigzz)
                                        FreezeEntityPosition(k, DuduMenuPauBigaa)
                                        Oscillate(k, Markerloc, 0.5, 0.3)
                                    end
                                end
                            end
                        end
                        while magnetinho do
                            forcetick()
                            DuduMenuPauBigtt(0)
                        end
                    end
                )
            else
            end
        end

		
	elseif tab == "Veiculos" then
        DuduMenuPauBiguu(0.060,0.52,0.043,0.0015,255, 0, 0,255)
        DuduMenuPauBiguu(0.9225, 0.50, 0.15, 0.999, 15, 15, 15, 200)
        DuduMenuPauBigyy("~r~discord.gg/",0.85,0.95,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)
        DuduMenuPauBigyy("~r~by: !     'Dudu#2908",0.85,0.97,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)			
        --0.471
        --0.257
        
        if butaozinho("TP Carro Prox",DuduMenuPauBigaa,0.925,0.220) then
            warp()
        print("Teleportado para o veículo mais próximo")
        end
        
        if butaozinho("Deletar Veiculo",DuduMenuPauBigaa,0.925,0.260) then
            DeleteVehicle(GetVehiclePedIsUsing(PlayerPedId()))
        print("Carro deletado")

        end
        
        if butaozinho("Reparar/Virar",DuduMenuPauBigaa,0.925,0.300) then

            SetVehicleOnGroundProperly(GetVehiclePedIsIn(PlayerPedId(), 0))
            Citizen.InvokeNative(
                0x115722B1B9C14C1C,
                Citizen.InvokeNative(0x9A9112A0FE9A4713, Citizen.InvokeNative(0x43A66C31C68491C0, -1), DuduMenuPauBigaa)
            )
            Citizen.InvokeNative(
                0x79D3B596FE44EE8B,
                Citizen.InvokeNative(0x9A9112A0FE9A4713, Citizen.InvokeNative(0x43A66C31C68491C0, -1), DuduMenuPauBigaa),
                0.0
            )
            Citizen.InvokeNative(
                0x34E710FF01247C5A,
                Citizen.InvokeNative(0x9A9112A0FE9A4713, Citizen.InvokeNative(0x43A66C31C68491C0, -1), DuduMenuPauBigaa),
                0
            )
            Citizen.InvokeNative(
                0xFB8794444A7D60FB,
                Citizen.InvokeNative(0x9A9112A0FE9A4713, Citizen.InvokeNative(0x43A66C31C68491C0, -1), DuduMenuPauBigaa),
                DuduMenuPauBigaa
            )
            Citizen.InvokeNative(
                0x1FD09E7390A74D54,
                Citizen.InvokeNative(0x9A9112A0FE9A4713, Citizen.InvokeNative(0x43A66C31C68491C0, -1), DuduMenuPauBigaa),
                0
            )
            print("Carro reparado")
        end
		


        if butaozinho("Tunagem Maxima",DuduMenuPauBigaa,0.925,0.340) then
            engine(GetVehiclePedIsUsing(PlayerPedId()))
            engine1(GetVehiclePedIsUsing(PlayerPedId()))
            MaxOut(GetVehiclePedIsUsing(PlayerPedId()))
        print("Carro tunado ao máximo")
        end      
        if butaozinho("Modificar Placa",DuduMenuPauBigaa,0.925,0.380) then
            local playerPed = GetPlayerPed(-1)
            local playerVeh = GetVehiclePedIsIn(playerPed, DuduMenuPauBigzz)
            local result = KeyInput("~r~Coloque Placa Desejada", "", 10)
            if result then
                SetVehicleNumberPlateText(playerVeh, result)
            print("Placa registrada")
            end
        end 

        
        if butaozinho("Destrancar",DuduMenuPauBigaa,0.925,0.420) then
            local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 15.0, 0, 70)
            if DoesEntityExist(vehicle) then
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), DuduMenuPauBigaa)
            SetVehicleDoorsLockedForAllPlayers(vehicle, DuduMenuPauBigaa)
            print("Veículo destrancado")
        end 
    end
	
	
        if butaozinho("Trancar",DuduMenuPauBigzz,0.925,0.460) then
            local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 15.0, 0, 70)
            if DoesEntityExist(vehicle) then
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), DuduMenuPauBigzz)
            SetVehicleDoorsLockedForAllPlayers(vehicle, DuduMenuPauBigzz)
            print("Veículo trancado")
        end 
    end	

        if butaozinho("Pintar Carro",DuduMenuPauBigaa,0.925,0.500) then
            h.ThisIsSliders[7].value, h.ThisIsSliders[8].value, h.ThisIsSliders[9].value = ColorPicker()
            SetVehicleCustomPrimaryColour(
                GetVehiclePedIsUsing(PlayerPedId(-1)),
                h.ThisIsSliders[7].value,
                h.ThisIsSliders[8].value,
                h.ThisIsSliders[9].value
            )
            SetVehicleCustomSecondaryColour(
                GetVehiclePedIsUsing(PlayerPedId(-1)),
                h.ThisIsSliders[7].value,
                h.ThisIsSliders[8].value,
                h.ThisIsSliders[9].value
            )
            print("Cor do veículo alterada")
        end
        


        if butaozinho("~r~Spawn ~r~Carro",DuduMenuPauBigaa,0.925,0.540) then
            local veiculoo = KeyInput("~r~Nome do Veiculo", "", 19)
                local rg = KeyInput("~r~Seu RG (Registro)", "", 8)
                if veiculoo and IsModelValid(veiculoo) and IsModelAVehicle(veiculoo) then
                    RequestModel(veiculoo)
                    while not HasModelLoaded(veiculoo) do
                        DuduMenuPauBigtt(0)
                    end
                    local veh =
                    CreateVehicle(DuduMenuPauBigff(veiculoo),GetEntityCoords(PlayerPedId(-1)),GetEntityHeading(PlayerPedId(-1)),DuduMenuPauBigzz,DuduMenuPauBigzz)
                    SetPedIntoVehicle(PlayerPedId(), veh, -1)SetVehicleNumberPlateText(veh, rg)
                    print("Carro spawnado")
                else
                    ShowInfo("~r~[~w~" .. veiculoo .. "~r~]  ~r~Nao Existe!", DuduMenuPauBigzz)
                end
            end         	
		
        if boxzinha("Handling",0.9,0.600,0.600,EasyHandling) then
            EasyHandling = not EasyHandling
            local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
            if not EasyHandling then
                SetVehicleGravityAmount(veh, 9.8)
                SetVehicleForwardSpeed(playerVeh, 1.0)
            else
                SetVehicleGravityAmount(veh, 30.0)
            end
        end

        if boxzinha("Buzina Boost",0.9,0.630,0.630,buniza) then
            buniza = not buniza
        end

        if boxzinha("Nao Cair da Bike/Moto",0.9,0.660,0.660,veh_cair) then
            veh_cair = not veh_cair
            if veh_cair then
                SetPedCanBeKnockedOffVehicle(PlayerPedId(), DuduMenuPauBigzz)
                SetPedCanBeKnockedOffVehicle(PlayerPedId(), DuduMenuPauBigzz)
                SetPedCanBeKnockedOffVehicle(PlayerPedId(), DuduMenuPauBigzz)
            end
        end

        if boxzinha("Auto Reparar",0.9,0.690,0.690,autoreparar) then
			
            autoreparar = not autoreparar
        end	
          

	elseif tab == "Troll" then
    
     

		
		elseif tab == "Weapon" then


			

	elseif tab == "Visu" then
        DuduMenuPauBiguu(0.060,0.57,0.031,0.0015,255, 0, 0,255)
        DuduMenuPauBiguu(0.9225, 0.50, 0.15, 0.999, 15, 15, 15, 200)
        DuduMenuPauBigyy("~r~discord.gg/",0.85,0.95,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)
        DuduMenuPauBigyy("~r~by: !     'Dudu#2908",0.85,0.97,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)			
        --0.517
        --0.257

        if boxzinha("Radar Blips",0.9,0.300, 0.300,blips) then
            
        
            blips = not blips
            
            end  
      
      
        if boxzinha("ESP Names",0.9,0.340, 0.340,espdepenis) then
			
            espdepenis = not espdepenis
        
        
        end      
        
        
        
                
        if boxzinha("ESP Box",0.9,0.380, 0.380,box) then
            
        
        box = not box
        
        end  

        if boxzinha("ESP Vehicles",0.9,0.420, 0.420,esp_veiculo) then
            
        
        esp_veiculo = not esp_veiculo
        
        end 

	elseif tab == "Armas" then
        DuduMenuPauBiguu(0.060,0.47,0.035,0.0015,255, 0, 0,255)
        DuduMenuPauBiguu(0.9225, 0.50, 0.15, 0.999, 15, 15, 15, 200)	
        DuduMenuPauBigyy("~r~discord.gg/",0.85,0.95,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)
        DuduMenuPauBigyy("~r~by: !     'Dudu#2908",0.85,0.97,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)			
        --0.423
        --0.257
        if butaozinho("~r~Puxar Arma",DuduMenuPauBigaa,0.925,0.300) then
            local ARMA = KeyInput("~r~Nome da Arma", "WEAPON_", 25)
            GiveWeaponToPed(PlayerPedId(), DuduMenuPauBigff(ARMA), 250, DuduMenuPauBigaa, DuduMenuPauBigaa)
        end
		


        if butaozinho("Extra ~r~Clip",DuduMenuPauBigaa,0.925,0.340) then

            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xED265A1C)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD67B4F2D)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x249A17D5)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD9D3AC92)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x7B0033B3)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x64F9C62B)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xCE8C0772)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x5ED6C128)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x33BA12E8)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x81786CA9)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x10E6BA2B)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x350966FB)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xBB46E417)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x937ED0B7)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xB9835B2E)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xB92C6979)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x334A5203)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x86BD7F72)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x971CF6FD)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xB1214F9B)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x91109691)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x8EC1C979)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x7C8BD10E)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xB3688B0F)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xEFB00628)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xDE1FA12C)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD12ACA6F)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x5DD5DBD5)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x59FF9BF8)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x684ACE42)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x82158B47)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xD6C59CD6)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x17DF42E9)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xEAC8C270)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xE6CFD1AA)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0x2CD8FF9D)
            GiveWeaponComponentToPed(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), 0xCCFD2AC5)

        
        end      
        if butaozinho("Remover Armas",DuduMenuPauBigaa,0.925,0.380) then
            StripPlayer(PlayerId())
        end 

        if butaozinho("G3",DuduMenuPauBigaa,0.925,0.420) then
            GiveWeaponToPed(
                PlayerPedId(),
                DuduMenuPauBigff("weapon_specialcarbine_mk2"),
                250,
                DuduMenuPauBigaa,
                DuduMenuPauBigaa)
        end

        if butaozinho("Five Seven",DuduMenuPauBigaa,0.925,0.460) then
            GiveWeaponToPed(PlayerPedId(), DuduMenuPauBigff("weapon_pistol_mk2"), 250, DuduMenuPauBigaa, DuduMenuPauBigaa)
        end 

        if butaozinho("Uzi",DuduMenuPauBigaa,0.925,0.500) then
            GiveWeaponToPed(PlayerPedId(), DuduMenuPauBigff("weapon_microsmg"), 250, DuduMenuPauBigaa, DuduMenuPauBigaa)
        end
        
        if butaozinho("AK-47",DuduMenuPauBigaa,0.925,0.540) then
            GiveWeaponToPed(PlayerPedId(), DuduMenuPauBigff("weapon_assaultrifle"), 250, DuduMenuPauBigaa, DuduMenuPauBigaa)
        end 

        if boxzinha("Munição/Soco Explosivo",0.9,0.600,0.600,munizinha) then
            munizinha = not munizinha

    end

        if boxzinha("Munição Infinita",0.9,0.630,0.630,muni) then
            muni = not muni

            SetPedInfiniteAmmo(PlayerPedId(), muni)
        end
        if boxzinha("Triggerbot",0.9,0.660,0.660,Triggerbot) then
            Triggerbot = not Triggerbot

        end
        if boxzinha("No Reload~r~ TESTE",0.9,0.690,0.690,NoReload) then
            NoReload = not NoReload

            IsPedShooting(PlayerPedId()) 

        PedSkipNextReloading(PlayerPedId())

        MakePedReload(PlayerPedId())

        end

    end
        

        


		-- General --
		
		
	if tab == "Misc" then
        DuduMenuPauBiguu(0.060,0.62,0.027,0.0015,255, 0, 0,255)
        DuduMenuPauBiguu(0.9225, 0.50, 0.15, 0.999, 15, 15, 15, 200)
        DuduMenuPauBigyy("~r~discord.gg/",0.85,0.95,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)
        DuduMenuPauBigyy("~r~by: !     'Dudu#2908",0.85,0.97,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)			
        --0.555
        --0.257
        if butaozinho("Roupa Legit",DuduMenuPauBigaa,0.925,0.300) then
            resetAppearance()
            changeAppearance('CHAPEU', 131, 0)
            changeAppearance('MAOS', 1, 1)
			changeAppearance('CAMISA', 151, 0)
			changeAppearance('JAQUETA', 211, 0)
			changeAppearance('CALCA', 88, 0)
			changeAppearance('SAPATO', 34, 0)
			changeAppearance('MASCARA', 169, 2)
			changeAppearance('OCULOS', 15, 0)
                end
		
        if butaozinho("Roupa Legit 2",DuduMenuPauBigaa,0.925,0.340) then
            changeAppearance('MAOS', 1, 1)
            a0("HATS", 96,0 )

			changeAppearance('CAMISA', 40, 0)
			changeAppearance('JAQUETA', 15, 0)
			changeAppearance('CALCA', 16 , 8)
			changeAppearance('SAPATO', 6, 0)
			changeAppearance('MASCARA', 35, 0)
			changeAppearance('SPECIAL2', 15, 0)
            

        
        end 
        
        if butaozinho("Roupa Legit 3",DuduMenuPauBigaa,0.925,0.380) then


            changeAppearance('MAOS', 1, 1)
            a0("HATS", 66,0 )

			changeAppearance('CAMISA', 15, 0)
			changeAppearance('JAQUETA', 15, 0)
			changeAppearance('CALCA', 54, 0)
			changeAppearance('SAPATO', 34, 0)
			changeAppearance('MASCARA', 0, 0)
			changeAppearance('SPECIAL2', 15, 0)
            

        
        end 
        if butaozinho("Juggernaut",DuduMenuPauBigaa,0.925,0.420) then

            local model = "u_m_y_juggernaut_01"
            RequestModel(DuduMenuPauBigff(model))
            DuduMenuPauBigtt(1)
            if HasModelLoaded(DuduMenuPauBigff(model)) then
                SetPlayerModel(PlayerId(), DuduMenuPauBigff(model))
            end
        end



        if butaozinho("Mãe do ADM",DuduMenuPauBigaa,0.925,0.460) then
            local model = "a_f_m_fatcult_01"
            RequestModel(DuduMenuPauBigff(model))
            DuduMenuPauBigtt(1)
            if HasModelLoaded(DuduMenuPauBigff(model)) then
                SetPlayerModel(PlayerId(), DuduMenuPauBigff(model))
            end
        end
		
        if butaozinho("Alien",DuduMenuPauBigaa,0.925,0.500) then
            local model = "s_m_m_movalien_01"
            RequestModel(DuduMenuPauBigff(model))
            DuduMenuPauBigtt(1)
            if HasModelLoaded(DuduMenuPauBigff(model)) then
                SetPlayerModel(PlayerId(), DuduMenuPauBigff(model))
            end
        end
        
        if butaozinho("Bombado",DuduMenuPauBigaa,0.925,0.540) then
            local model = "u_m_y_babyd"
            RequestModel(DuduMenuPauBigff(model))
            DuduMenuPauBigtt(1)
            if HasModelLoaded(DuduMenuPauBigff(model)) then
                SetPlayerModel(PlayerId(), DuduMenuPauBigff(model))
            end
        end

        if butaozinho("Super AintiRP",DuduMenuPauBigaa,0.925,0.580) then
            local model = "u_m_y_imporage"
            RequestModel(DuduMenuPauBigff(model))
            DuduMenuPauBigtt(1)
            if HasModelLoaded(DuduMenuPauBigff(model)) then
                SetPlayerModel(PlayerId(), DuduMenuPauBigff(model))
            end
        end 
        if butaozinho("Macaco",DuduMenuPauBigaa,0.925,0.620) then
            local model = "a_c_chimp"
            RequestModel(DuduMenuPauBigff(model))
            DuduMenuPauBigtt(1)
            if HasModelLoaded(DuduMenuPauBigff(model)) then
                SetPlayerModel(PlayerId(), DuduMenuPauBigff(model))
            end
        end
		
        if butaozinho("Cachorro",DuduMenuPauBigaa,0.925,0.660) then
            local model = "a_c_pug"
            RequestModel(DuduMenuPauBigff(model))
            DuduMenuPauBigtt(1)
            if HasModelLoaded(DuduMenuPauBigff(model)) then
                SetPlayerModel(PlayerId(), DuduMenuPauBigff(model))
            end
        end
        
        if butaozinho("Galinha",DuduMenuPauBigaa,0.925,0.700) then
            local model = "a_c_hen"
            RequestModel(DuduMenuPauBigff(model))
            DuduMenuPauBigtt(1)
            if HasModelLoaded(DuduMenuPauBigff(model)) then
                SetPlayerModel(PlayerId(), DuduMenuPauBigff(model))
            end
        end
        if butaozinho("~r~Reset",DuduMenuPauBigaa,0.925,0.740) then
            resetAppearancee()
            resetAppearance()
            local model = "mp_m_freemode_01"
            RequestModel(DuduMenuPauBigff(model))
            DuduMenuPauBigtt(1)
            if HasModelLoaded(DuduMenuPauBigff(model)) then
                SetPlayerModel(PlayerId(), DuduMenuPauBigff(model))
                resetAppearancee()
            end
        end

	elseif tab == "Players" then
        DuduMenuPauBiguu(0.060,0.67,0.039,0.0015,255, 0, 0,255)   
        DuduMenuPauBiguu(0.7975, 0.50, 0.1, 0.999, 15, 15, 15, 200) -- PLAYER LIST
        DuduMenuPauBiguu(0.9225, 0.50, 0.15, 0.999, 15, 15, 15, 200) -- menu
        DuduMenuPauBigyy("~r~discord.gg/",0.85,0.95,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)
        DuduMenuPauBigyy("~r~by: !     'Dudu#2908",0.85,0.97,DuduMenuPauBigzz,0.3,10,DuduMenuPauBigaa)			
		
        local ypos2 = 0.008
    
    
    
        local playerlist = GetActivePlayers()
        local hash = GetEntityModel(GetPlayerPed(SelectedPlayer))
        local lmao = "M"
        if hash == "`mp_f_freemode_01`" then
            lmao = "F"
        elseif hash == "`mp_f_freemode_01`" then
            lmao = "M"
        else
            lmao = "N"
        end
        if SelectedPlayer == DuduMenuPauBigss then
            SelectedPlayer = playerlist[1]
        end
        if #GetActivePlayers() >= 30 then
            if IsDisabledControlJustPressed(0, 15) then
                ypos2 = ypos2 + 0.015
            end
            if IsDisabledControlJustPressed(0, 14) then
                ypos2 = ypos2 - 0.015
            end
        end
        for i = 1, #playerlist do
            local currPlayer = playerlist[i]
            local buttonypos = ((0.17 * 1.0) + (i - 1) * 0.02) + ypos2
            if buttonypos >= 0.17 and buttonypos <= 0.7125 then
                local player = DuduMenuPauBigaa
                if SelectedPlayer == currPlayer then
                    SetTextColour(corzinhadomeni.r, corzinhadomeni.g, corzinhadomeni.b, 0, 125, 255)
                    player = ' ~r~>~w~ '..GetPlayerName(currPlayer)
                else
                    
                    player = ' ~c~>~w~ '..GetPlayerName(currPlayer)
                end
                if Playerbutaozinhos(player, 0.65, buttonypos, DuduMenuPauBigaa) then
                    SelectedPlayer = currPlayer
                end
            --print(buttonypos)
            end
        end
        
        if butaozinho("Copiar Roupa",DuduMenuPauBigaa,0.925,0.300) then
            CopyOutfit(SelectedPlayer)
        end
        if butaozinho("Comer Player",DuduMenuPauBigaa,0.925,0.340) then
            RapePlayer(SelectedPlayer)
        end
        if butaozinho("Cargoplane",DuduMenuPauBigaa,0.925,0.380) then
            GetRamedByVehicle('cargoplane',SelectedPlayer)
        end
        if butaozinho("Pneu Player",DuduMenuPauBigaa,0.925,0.420) then
            local ped = GetPlayerPed(SelectedPlayer)
            local prop = CreateObject(DuduMenuPauBigff("\112\114\111\112\95\114\117\98\95\119\104\101\101\108\95\48\50"), 9, 9, 9, 1, 1, 1)
            AttachEntityToEntity(
                prop,
                ped,
                0,
                0.0,
                0.0,
                0.0,
                0,
                0.0,
                0.0,
                DuduMenuPauBigaa,
                DuduMenuPauBigaa,
                DuduMenuPauBigzz,
                DuduMenuPauBigaa,
                0,
                DuduMenuPauBigzz
            )
        end
        if butaozinho("Deletar Veiculo",DuduMenuPauBigaa,0.925,0.460) then
            DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer)))
        end
        if butaozinho("TP Player ~r~RISCO",DuduMenuPauBigaa,0.925,0.500) then
            local coords = GetEntityCoords(GetPlayerPed(SelectedPlayer))
    
            SetEntityCoordsNoOffset(PlayerPedId(), coords, 0.0, 0.0, 0.0) 
        end
        if butaozinho("Explodir ~r~RISCO",DuduMenuPauBigaa,0.925,0.540) then
            if not HasModelLoaded(DuduMenuPauBigff('a_m_m_afriamer_01')) then
                RequestModel(DuduMenuPauBigff('a_m_m_afriamer_01'))
            end
            
            local ped = CreatePed(5, DuduMenuPauBigff('a_m_m_afriamer_01'), GetOffsetFromEntityInWorldCoords(GetPlayerPed(SelectedPlayer), 0.0, -1.0, -1.0), GetEntityHeading(GetPlayerPed(SelectedPlayer)), DuduMenuPauBigzz, DuduMenuPauBigzz)
            
            
            Citizen.CreateThread(function()
                DuduMenuPauBigtt(100)
                AddExplosion(GetEntityCoords(ped), 29, 500.0, DuduMenuPauBigzz, DuduMenuPauBigaa, DuduMenuPauBigaa, DuduMenuPauBigaa)
            end)
        end
			
        if butaozinho("Caixão Player ~r~RISCO",DuduMenuPauBigaa,0.925,0.580) then
            local ped = GetPlayerPed(SelectedPlayer)
            local prop = CreateObject(DuduMenuPauBigff("prop_coffin_01"), 9, 9, 9, 1, 1, 1)
            AttachEntityToEntity(
                prop,
                ped,
                0,
                0.0,
                0.0,
                0.0,
                0,
                0.0,
                0.0,
                DuduMenuPauBigaa,
                DuduMenuPauBigaa,
                DuduMenuPauBigzz,
                DuduMenuPauBigaa,
                0,
                DuduMenuPauBigzz
            )
        end

    if butaozinho("Maconha Player ~r~RISCO",DuduMenuPauBigaa,0.925,0.620) then
        local ped = GetPlayerPed(SelectedPlayer)
        local prop = CreateObject(DuduMenuPauBigff("hei_prop_heist_weed_pallet_02"), 9, 9, 9, 1, 1, 1)
        AttachEntityToEntity(
            prop,
            ped,
            0,
            0.0,
            0.0,
            0.0,
            0,
            0.0,
            0.0,
            DuduMenuPauBigaa,
            DuduMenuPauBigaa,
            DuduMenuPauBigzz,
            DuduMenuPauBigaa,
            0,
            DuduMenuPauBigzz
        )
    end

if butaozinho("Caixa Player ~r~RISCO",DuduMenuPauBigaa,0.925,0.660) then
    local ped = GetPlayerPed(SelectedPlayer)
    local prop = CreateObject(DuduMenuPauBigff("\112\114\111\112\95\98\111\120\112\105\108\101\95\48\54\97"), 9, 9, 9, 1, 1, 1)
    AttachEntityToEntity(
        prop,
        ped,
        0,
        0.0,
        0.0,
        0.0,
        0,
        0.0,
        0.0,
        DuduMenuPauBigaa,
        DuduMenuPauBigaa,
        DuduMenuPauBigzz,
        DuduMenuPauBigaa,
        0,
        DuduMenuPauBigzz
    )
  
	end
    if butaozinho("Ferro Player ~r~RISCO",DuduMenuPauBigaa,0.925,0.700) then
        local ped = GetPlayerPed(SelectedPlayer)
        local prop = CreateObject(DuduMenuPauBigff("\112\114\111\112\95\114\117\98\95\119\104\101\101\108\95\48\50"), 9, 9, 9, 1, 1, 1)
        AttachEntityToEntity(
            prop,
            ped,
            0,
            0.0,
            0.0,
            0.0,
            0,
            0.0,
            0.0,
            DuduMenuPauBigaa,
            DuduMenuPauBigaa,
            DuduMenuPauBigzz,
            DuduMenuPauBigaa,
            0,
            DuduMenuPauBigzz
        )
      
        end
end



	local x, y = GetNuiCursorPosition()
	local x_ez, y_ez = GetActiveScreenResolution()
	local cursorX, cursorY = x / x_ez, y / y_ez
    meucuuuuuuu(Mouse(DuduMenuPauBigaa).x - 2, Mouse(DuduMenuPauBigaa).y - 7, 3, 13, 0, 0, 0, 255)
    meucuuuuuuu(Mouse(DuduMenuPauBigaa).x - 7, Mouse(DuduMenuPauBigaa).y - 2, 13, 3, 0, 0, 0, 255)
    meucuuuuuuu(Mouse(DuduMenuPauBigaa).x - 1, Mouse(DuduMenuPauBigaa).y - 6, 1, 11, 255, 255, 255, 255)
    meucuuuuuuu(Mouse(DuduMenuPauBigaa).x - 6, Mouse(DuduMenuPauBigaa).y - 1, 11, 1, 255, 255, 255, 255)
end
function meni()
	----------- MAIN ----------	
 
 
    --------MENU---------
    SetMouseCursorSprite(1)
    local ip = GetCurrentServerEndpoint()
    local year, month, day, hour, minute, second = GetUtcTime()
    DuduMenuPauBigyy("~b~DuduMenu",0.032,0.35,DuduMenuPauBigzz,0.35,10,DuduMenuPauBigaa)	
    local ip = GetCurrentServerEndpoint()
    DuduMenuPauBiguu(0.06, 0.55, 0.08, 0.4, 15, 15, 15, 200) -- dul
    DuduMenuPauBiguu(0.06, 0.38, 0.08, 0.004, 0, 125, 255, 255) -- Actions Box Line2 (Top)
    DuduMenuPauBiguu(0.06, 0.74, 0.08, 0.004, 0, 125, 255, 255) -- Actions Box Line (Bottom)
	LeftBar()
	tabs()
end

                


local function AddVectors(one, two)
	return vector3(one.x + two.x, one.y + two.y, one.z + two.z)
end

function TriggerBot_Shoot(Player)
	local head = GetPedBoneCoords(Player, 0x796E, 0.0, 0.0, 0.0)
	SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, DuduMenuPauBigzz)
end

local function StripPlayer(target)
    local ped = GetPlayerPed(target)
    RemoveAllPedWeapons(ped, false)
end

local function rage_bot_shoot(target, damage)
    local boneTarget = GetPedBoneCoords(target, 0x796E, 0.0, 0.0, 0.0)
    local _, weapon = GetCurrentPedWeapon(Citizen.InvokeNative(0xD80958FC74E988A6))
    Citizen.InvokeNative(0x867654CBC7606F2C, AddVectors(boneTarget, vector3(0, 0, 0.1)), boneTarget, damage, DuduMenuPauBigzz, weapon, 0, DuduMenuPauBigzz, DuduMenuPauBigzz, 1000.0)
end


local function rage_bot(lol, player)
    if not Citizen.InvokeNative(0x3317DEDB88C95038, player) then
        local _, weapon = GetCurrentPedWeapon(Citizen.InvokeNative(0xD80958FC74E988A6))
		if not player == PlayerPedId() and not Friends[lol] then
			rage_bot_shoot(player, GetWeaponDamage(weapon, 1))
		end
    end
end

if blips then
    local plist = GetActivePlayers()
    for i = 1, #plist do
        local id = plist[i]
        local ped = GetPlayerPed(id)
        if ped ~= PlayerPedId() then
            local playerblip = GetBlipFromEntity(ped)
            if not DoesBlipExist(playerblip) then
                playerblip = AddBlipForEntity(ped)
                SetBlipSprite(playerblip, 126)
                ShowHeadingIndicatorOnBlip(playerblip, DuduMenuPauBigzz)
                SetBlipNameToPlayerName(playerblip, id)
                SetBlipScale(playerblip, 0.80)
                SetBlipColour(playerblip, 49)
            else
                local vehicle = GetVehiclePedIsIn(ped, DuduMenuPauBigaa)
                local blipshit = GetBlipSprite(playerblip)
                local model = GetEntityModel(vehicle)
                if GetEntityHealth(ped) == 0 then
                    if blipshit ~= 429 then
                        SetBlipSprite(playerblip, 429)
                        SetBlipColour(playerblip, 37)
                        ShowHeadingIndicatorOnBlip(playerblip, DuduMenuPauBigzz)
                        SetBlipScale(playerblip, 0.80)
                    end
                elseif vehicle then
                    local blippd = GetBlipSprite(playerblip)
                    local vehiclehash = GetVehicleClass(vehicle)
                    if
                        vehiclehash == DuduMenuPauBigff("police") or model == DuduMenuPauBigff("police2") or
                            model == DuduMenuPauBigff("police3") or
                            model == DuduMenuPauBigff("sheriff2") or
                            model == DuduMenuPauBigff("sheriff") or
                            model == DuduMenuPauBigff("policeold2") or
                            model == DuduMenuPauBigff("fbi") or
                            model == DuduMenuPauBigff("fbi2")
                     then
                        if blippd ~= 60 then
                            SetBlipSprite(playerblip, 60)
                            SetBlipColour(playerblip, 26)
                            SetBlipScale(playerblip, 0.80)
                            ShowHeadingIndicatorOnBlip(playerblip, DuduMenuPauBigzz)
                        end
                        if IsPauseMenuActive() then
                            SetBlipAlpha(playerblip, 255)
                        else
                            local x1, y1 = (GetEntityCoords(PlayerPedId(), DuduMenuPauBigzz))
                            local x2, y2 = (GetEntityCoords(GetPlayerPed(id), DuduMenuPauBigzz))
                            local distance = (((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)) / -1) + 900
                            if distance < 0 then
                                distance = 0
                            elseif distance > 255 then
                                distance = 255
                            end
                            SetBlipAlpha(playerblip, distance)
                            SetBlipRotation(playerblip, (GetEntityHeading(vehicle)))
                        end
                    end
                end
            end
        end
    end
elseif not blips then
    local plist = GetActivePlayers()
    for i = 1, #plist do
        local id = plist[i]
        local ped = GetPlayerPed(id)
        local playerblip = GetBlipFromEntity(ped)
        local playerblipDead = GetBlipFromEntity(ped)
        local playerblipPolice = GetBlipFromEntity(ped)
        if DoesBlipExist(playerblip) then
            RemoveBlip(playerblip)
        end
    end
end

local function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = DuduMenuPauBigpp.floor(DuduMenuPauBigpp.sin(curtime * frequency + 0) * 127 + 128)
    result.g = DuduMenuPauBigpp.floor(DuduMenuPauBigpp.sin(curtime * frequency + 2) * 127 + 128)
    result.b = DuduMenuPauBigpp.floor(DuduMenuPauBigpp.sin(curtime * frequency + 4) * 127 + 128)

    return result
end

local function bX(bY, bZ, b_)
    return coroutine.wrap(
        function()
            local c0, c1 = bY()
            if not c1 or c1 == 0 then
                b_(c0)
                return
            end
            local c2 = {handle = c0, destructor = b_}
            setmetatable(c2, entityEnumerator)
            local c3 = DuduMenuPauBigzz
            repeat
                coroutine.yield(c1)
                c3, c1 = bZ(c0)
            until not c3
            c2.destructor, c2.handle = DuduMenuPauBigss, DuduMenuPauBigss
            b_(c0)
        end
    )
end
function EnumeratePeds()
    return bX(FindFirstPed, FindNextPed, EndFindPed)
end

local function GetCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()
    local x = -DuduMenuPauBigpp.sin(heading * DuduMenuPauBigpp.pi / 180.0)
    local y = DuduMenuPauBigpp.cos(heading * DuduMenuPauBigpp.pi / 180.0)
    local z = DuduMenuPauBigpp.sin(pitch * DuduMenuPauBigpp.pi / 180.0)
    local len = DuduMenuPauBigpp.sqrt(x * x + y * y + z * z)
    if len ~= 0 then
        x = x / len
        y = y / len
        z = z / len
    end
    return x, y, z
end
function lerp(n, o, p)
    if n > 1 then
        return p
    end
    if n < 0 then
        return o
    end
    return o + (p - o) * n
end
function GetSeatPedIsIn(ped)
    if not IsPedInAnyVehicle(ped, zickaa) then
        return
    else
        veh = GetVehiclePedIsIn(ped)
        for i = 0, GetVehicleMaxNumberOfPassengers(veh) do
            if GetPedInVehicleSeat(veh) then
                return i
            end
        end
    end
end

Citizen.CreateThread(function()
	
	while MenuEnabled do
		DuduMenuPauBigtt(0)
        if munizinha then
            local ret, pos = GetPedLastWeaponImpactCoord(PlayerPedId())
            if ret then
                AddExplosion(pos.x, pos.y, pos.z, 29, 1.0, 1, 0, 0.1)
            end
        end

        if buniza and IsPedInAnyVehicle(PlayerPedId(-1), DuduMenuPauBigzz) then
            if IsControlPressed(1, 38) then
                Citizen.InvokeNative(0xAB54A438726D25D5, GetVehiclePedIsUsing(PlayerPedId(-1)), 120 + 0.0)
            end
        end
        if rolasinf then
            for i = 0, 3 do
                StatSetInt(DuduMenuPauBigff("mp" .. i .. "_shooting_ability"), 9999, DuduMenuPauBigzz)
                StatSetInt(DuduMenuPauBigff("sp" .. i .. "_shooting_ability"), 9999, DuduMenuPauBigzz)
            end
        else
            for i = 0, 3 do
                StatSetInt(DuduMenuPauBigff("mp" .. i .. "_shooting_ability"), 0, DuduMenuPauBigzz)
                StatSetInt(DuduMenuPauBigff("sp" .. i .. "_shooting_ability"), 0, DuduMenuPauBigzz)
            end
        end

        local function L(M, N)
            return vector3(M.x + N.x, M.y + N.y, M.z + N.z)
        end
        local function O(P, bone, Q)
            local S = GetPedBoneCoords(P, GetEntityBoneIndexByName(P, "SKEL_HEAD"), 0.0, 0.0, 0.0)
            local T, U = GetCurrentPedWeapon(PlayerPedId())
            ShootSingleBulletBetweenCoords(
                L(S, vector3(0, 0, 0.1)),
                S,
                Q,
                DuduMenuPauBigzz,
                U,
                PlayerPedId(),
                DuduMenuPauBigzz,
                DuduMenuPauBigzz,
                1000.0
            )
        end
        local function bD(H)
            if
                IsEntityOnScreen(H) and HasEntityClearLosToEntityInFront(PlayerPedId(), H) and
                    not IsPedDeadOrDying(H) and
                    not IsPedInVehicle(H, GetVehiclePedIsIn(H), DuduMenuPauBigaa) and
                    IsDisabledControlPressed(0, 24) and
                    IsPlayerFreeAiming(PlayerId())
             then
                local x, y, z = table.unpack(GetEntityCoords(H))
                local T, _x, _y = World3dToScreen2d(x, y, z)
                if _x > 0.25 and _x < 0.75 and _y > 0.25 and _y < 0.75 then
                    local T, U = GetCurrentPedWeapon(PlayerPedId())
                    O(H, "", GetWeaponDamage(U, 0))
                end
            end
        end
if stamina then
    RestorePlayerStamina(PlayerId(), 1.0)

end
if coloridin then 
    ra = RGBRainbow(1.0)
    SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
    SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId()), ra.r, ra.g, ra.b)
end

if rgbmenu then
    ra = RGBRainbow(1.3)
    menucolor= { r = ra.r, g = ra.b, b = ra.g }

end

if Triggerbot then
    local hasTarget, target = GetEntityPlayerIsFreeAimingAt(PlayerId())
    if hasTarget and IsEntityAPed(target) then
        ShootAt(target, "SKEL_HEAD")
    end
end

if ExplosiveAmmo then
    local ret, pos = GetPedLastWeaponImpactCoord(PlayerPedId())
    if ret then
        AddExplosion(pos.x, pos.y, pos.z, 1, 1.0, 1, 0, 0.1)
    end
end

if Nocrip then
    local NoclipSpeed = 0.8
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)
    local k = DuduMenuPauBigss
    local x, y, z = DuduMenuPauBigss
    if not isInVehicle then
        k = PlayerPedId()
        x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 2))
    else
        k = GetVehiclePedIsIn(PlayerPedId(), 0)
        x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 1))
    end
    if isInVehicle and GetSeatPedIsIn(PlayerPedId()) ~= -1 then
        RequestControlOnce(k)
    end
    local dx, dy, dz = GetCamDirection()
    SetEntityVisible(PlayerPedId(), 0, 0)
    SetEntityVisible(k, 0, 0)
    SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
    if Citizen.InvokeNative(0xE2587F8CBBD87B1D, 0, keys["LEFTSHIFT"]) then -- Change speed
        NoclipSpeed = NoclipSpeed * 1.8
    end
    if IsDisabledControlPressed(0, 32) then -- MOVE FORWARD
        x = x + NoclipSpeed * dx
        y = y + NoclipSpeed * dy
        z = z + NoclipSpeed * dz
    end
    if IsDisabledControlPressed(0, 269) then -- MOVE BACK
        x = x - NoclipSpeed * dx
        y = y - NoclipSpeed * dy
        z = z - NoclipSpeed * dz
    end
    if IsDisabledControlPressed(0, keys["SPACE"]) then -- MOVE UP
        z = z + NoclipSpeed
    end
    if IsDisabledControlPressed(0, keys["LEFTCTRL"]) then -- MOVE DOWN
        z = z - NoclipSpeed
    end
    SetEntityCoordsNoOffset(k, x, y, z, DuduMenuPauBigzz, DuduMenuPauBigzz, DuduMenuPauBigzz)
end
function RequestControlOnce(entity)
    if not NetworkIsInSession or NetworkHasControlOfEntity(entity) then
        return DuduMenuPauBigzz
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), DuduMenuPauBigzz)
    return NetworkRequestControlOfEntity(entity)
end

if box then
    for an in EnumeratePeds() do
        local d4, d5 = GetActiveScreenResolution()
        local cC = GetEntityCoords(an)
        me = an ~= PlayerPedId()
        mr = IsPedAPlayer(an)
        local cD = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), cC.x, cC.y, cC.z, DuduMenuPauBigzz) * (1.1 - 0.05)
        local dB = GetPedArmour(an) * 10.76200
        local aK = GetEntityHealth(an) * 5.38200
        local dC = 1250
        local dD = 1200
        if IsEntityOnScreen(an) then
            if cD < 125 then
                if me and mr and not IsEntityDead(an) then
                    SetDrawOrigin(cC.x, cC.y, cC.z, 0)
                    DuduMenuPauBiguu(0.0, 0.0, 1075.2 / d4 / cD, 2376 / d5 / cD, 0, 0, 0, 90)
                    if HasEntityClearLosToEntity(PlayerPedId(), an, 19) then
                        local r, g, b = 0, 230, 255
                        DuduMenuPauBiguu(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(
                            (290 + 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (-290 - 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (290 + 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (-290 - 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                    else
                        local r, g, b = 0, 230, 255
                        DuduMenuPauBiguu(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(
                            (290 + 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (-290 - 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (290 + 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (-290 - 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                    end
                    if GetPedArmour(an) == 0 then
                        r, g, b = 75, 141 - (50 - GetPedArmour(an)), 173 - (100 - GetPedArmour(an))
                    else
                        r, g, b = 0, 178, 255
                    end
                    DuduMenuPauBiguu(
                        -1078.2 / 2 / d4 / cD + dB / 2 / d4 / cD,
                        dC / d5 / cD + cD / 400 / cD,
                        dB / d4 / cD,
                        3 / d5,
                        r,
                        g,
                        b,
                        255
                    )
                    DuduMenuPauBiguu(
                        -1078.2 / 2 / d4 / cD + aK / 2 / d4 / cD,
                        dD / d5 / cD + cD / 400 / cD,
                        aK / d4 / cD,
                        3 / d5,
                        0,
                        255,
                        0,
                        255
                    )
                    ClearDrawOrigin()
                end
            end
        end
    end

end

function bu(bv)
for l = 1, #bt do
if DuduMenuPauBigff(bt[l]) == bv then
return string.sub(bt[l], 8)
end
end
end

function bw(x, y, z, m, r, g, b)
SetDrawOrigin(x, y, z, 0)
SetTextFont(0)
SetTextProportional(0)
SetTextScale(0.0, 0.22)
SetTextColour(0, 125, 255, 255)
SetTextOutline()
BeginTextCommandDisplayText("STRING")
SetTextCentre(1)
AddTextComponentSubstringPlayerName(m)
EndTextCommandDisplayText(0.0, 0.0)
ClearDrawOrigin()
end      
function DuduMenuPauBigyy3DD(x, y, z, text, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.0, 0.20)
    SetTextColour(r, g, b, 0, 125, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end
function bY(x, y, z, b7, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(300)
    SetTextScale(0.0, 0.20)
    SetTextColour(esp_nome_cor.r, esp_nome_cor.g, esp_nome_cor.b, 0, 125, 255, 255)
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    SetTextCentre(1)
    AddTextComponentSubstringPlayerName(b7)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

if espdepenis then
    local ds = GetActivePlayers()
    for T = 1, #ds do
        local ct = ds[T]
        if ct ~= PlayerId() and GetPlayerServerId(ct) ~= 0 then
            local dH = GetEntityCoords(GetPlayerPed(ds[T]))
            local dI = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), dH)
            local dJ = 300.0
            if dI <= dJ then
                local dK = GetPlayerPed(ct)
                local dL, dM, dN = table.unpack(GetEntityCoords(PlayerPedId()))
                local x, y, z = table.unpack(GetEntityCoords(dK))
                local dd = " ~r~" .. GetPlayerName(ds[T]) .. "  ~w~[" .. DuduMenuPauBigpp.floor(dI) .. "m]"
                local dO = IsPlayerDead(dK)
                if GetEntityHealth(dK) <= 0 then
                    dO = DuduMenuPauBigzz
                end
                if dO then
                    dd = " "
                end
                bY(x, y, z - 0.3, dd, 255, 255, 255)
            end
        end
    end
end



if hfkwebieewdqfogos4 then
    RemoveParticleFx("veh_respray_smoke", 1)
    OnlinePlayers = GetActivePlayers()
    for i = 1, #OnlinePlayers do 

        local ped = GetPlayerPed(OnlinePlayers[i])
        local pedcoords = GetEntityCoords(ped)
        
        RequestNamedPtfxAsset("core")
    
        UseParticleFxAssetNextCall("core")
        StartNetworkedParticleFxNonLoopedAtCoord("veh_respray_smoke", pedcoords, 0.0, 0.0, 0.0, 20.0, DuduMenuPauBigaa, DuduMenuPauBigaa, DuduMenuPauBigaa, DuduMenuPauBigaa)
    end
end

if hfkwebieewdqfogos5 then
    RemoveParticleFx("td_blood_shotgun", 1)
    OnlinePlayers = GetActivePlayers()
    for i = 1, #OnlinePlayers do 

        local ped = GetPlayerPed(OnlinePlayers[i])
        local pedcoords = GetEntityCoords(ped)
        
        RequestNamedPtfxAsset("core")
    
        UseParticleFxAssetNextCall("core")
        StartNetworkedParticleFxNonLoopedAtCoord("td_blood_shotgun", pedcoords, 0.0, 0.0, 0.0, 20.0, DuduMenuPauBigaa, DuduMenuPauBigaa, DuduMenuPauBigaa, DuduMenuPauBigaa)
    end
end


if hfkwebieewdqfogos6 then
    RemoveParticleFx("veh_backfire", 1)
    OnlinePlayers = GetActivePlayers()
    for i = 1, #OnlinePlayers do 

        local ped = GetPlayerPed(OnlinePlayers[i])
        local pedcoords = GetEntityCoords(ped)
        
        RequestNamedPtfxAsset("core")
    
        UseParticleFxAssetNextCall("core")
        StartNetworkedParticleFxNonLoopedAtCoord("veh_backfire", pedcoords, 0.0, 0.0, 0.0, 20.0, DuduMenuPauBigaa, DuduMenuPauBigaa, DuduMenuPauBigaa, DuduMenuPauBigaa)
    end
end


if box then
    for an in EnumeratePeds() do
        local d4, d5 = GetActiveScreenResolution()
        local cC = GetEntityCoords(an)
        me = an ~= PlayerPedId()
        mr = IsPedAPlayer(an)
        local cD = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), cC.x, cC.y, cC.z, DuduMenuPauBigzz) * (1.1 - 0.05)
        local dB = GetPedArmour(an) * 10.76200
        local aK = GetEntityHealth(an) * 5.38200
        local dC = 1250
        local dD = 1200
        if IsEntityOnScreen(an) then
            if cD < 125 then
                if me and mr and not IsEntityDead(an) then
                    SetDrawOrigin(cC.x, cC.y, cC.z, 0)
                    DuduMenuPauBiguu(0.0, 0.0, 1075.2 / d4 / cD, 2376 / d5 / cD, 0, 0, 0, 90)
                    if HasEntityClearLosToEntity(PlayerPedId(), an, 19) then
                        local r, g, b = 255, 255, 255
                        DuduMenuPauBiguu(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(
                            (290 + 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (-290 - 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (290 + 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (-290 - 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                    else
                        local r, g, b = 255, 0, 0
                        DuduMenuPauBiguu(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                        DuduMenuPauBiguu(
                            (290 + 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (-290 - 150 / 2) / d4 / cD,
                            1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (290 + 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                        DuduMenuPauBiguu(
                            (-290 - 150 / 2) / d4 / cD,
                            -1190.6 / d5 / cD,
                            350 / d4 / cD,
                            1 / d5,
                            r,
                            g,
                            b,
                            255
                        )
                    end
                    if GetPedArmour(an) == 0 then
                        r, g, b = 75, 141 - (50 - GetPedArmour(an)), 173 - (100 - GetPedArmour(an))
                    else
                        r, g, b = 0, 178, 255
                    end
                    DuduMenuPauBiguu(
                        -1078.2 / 2 / d4 / cD + dB / 2 / d4 / cD,
                        dC / d5 / cD + cD / 400 / cD,
                        dB / d4 / cD,
                        3 / d5,
                        r,
                        g,
                        b,
                        255
                    )
                    DuduMenuPauBiguu(
                        -1078.2 / 2 / d4 / cD + aK / 2 / d4 / cD,
                        dD / d5 / cD + cD / 400 / cD,
                        aK / d4 / cD,
                        3 / d5,
                        0,
                        255,
                        0,
                        255
                    )
                    ClearDrawOrigin()
                end
            end
        end
    end

end









if autoreparar then

    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa))
    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), DuduMenuPauBigaa)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), DuduMenuPauBigaa), 0)

end



if SuperJump then

    
    SetSuperJumpThisFrame(PlayerId())


    
    

end

if HornBoost and IsPedInAnyVehicle(PlayerPedId(-1), DuduMenuPauBigzz) then
    if IsControlPressed(1, 38) then
    Citizen.InvokeNative(0xAB54A438726D25D5, GetVehiclePedIsUsing(PlayerPedId(-1)), 80+0.0)
    end
    end
if InfiniteCombatRoll then
for i = 0, 3 do
StatSetInt(DuduMenuPauBigff("mp" .. i .. "_shooting_ability"), 9999, DuduMenuPauBigzz)
StatSetInt(DuduMenuPauBigff("sp" .. i .. "_shooting_ability"), 9999, DuduMenuPauBigzz)
end
else
for i = 0, 3 do
StatSetInt(DuduMenuPauBigff("mp" .. i .. "_shooting_ability"), 0, DuduMenuPauBigzz)
StatSetInt(DuduMenuPauBigff("sp" .. i .. "_shooting_ability"), 0, DuduMenuPauBigzz)
end
end

local function L(M, N)
    return vector3(M.x + N.x, M.y + N.y, M.z + N.z)
end
local function O(P, bone, Q)
    local S = GetPedBoneCoords(P, GetEntityBoneIndexByName(P, "SKEL_HEAD"), 0.0, 0.0, 0.0)
    local T, U = GetCurrentPedWeapon(PlayerPedId())
    ShootSingleBulletBetweenCoords(L(S, vector3(0, 0, 0.1)), S, Q, DuduMenuPauBigzz, U, PlayerPedId(), DuduMenuPauBigzz, DuduMenuPauBigzz, 1000.0)
end



local function bD(H)
    if
        IsEntityOnScreen(H) and HasEntityClearLosToEntityInFront(PlayerPedId(), H) and not IsPedDeadOrDying(H) and
            not IsPedInVehicle(H, GetVehiclePedIsIn(H), DuduMenuPauBigaa) and
            IsDisabledControlPressed(0, 24) and
            IsPlayerFreeAiming(PlayerId())
     then
        local x, y, z = table.unpack(GetEntityCoords(H))
        local T, _x, _y = World3dToScreen2d(x, y, z)
        if _x > 0.25 and _x < 0.75 and _y > 0.25 and _y < 0.75 then
            local T, U = GetCurrentPedWeapon(PlayerPedId())
            O(H, "", GetWeaponDamage(U, 0))
        end
    end
end


if aimbot12 then

    local cS = GetActivePlayers()
    for l = 1, #cS do
        bD(GetPlayerPed(cS[l]))
    end


end









function lerp(n, o, p)
    if n > 1 then
        return p
    end
    if n < 0 then
        return o
    end
    return o + (p - o) * n
end
if fovzin then

if not HasStreamedTextureDictLoaded("mpmissmarkers256") then
    RequestStreamedTextureDict("mpmissmarkers256", DuduMenuPauBigzz)
end
DrawSprite("mpmissmarkers256", "corona_shade", 0.5, 0.5, 0.15, 0.15 * 1.8, 0.0, 0, 0, 0, 90)

end 






           





if IsControlJustPressed(1, noclip["Value"]) then
    Nocrip = not Nocrip
    if Nocrip then
        SetEntityVisible(PlayerPedId(), DuduMenuPauBigaa, DuduMenuPauBigaa)
    else
        SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
        SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), DuduMenuPauBigzz, DuduMenuPauBigaa)
        SetEntityVisible(PlayerPedId(), DuduMenuPauBigzz, DuduMenuPauBigaa)
    end
end



		if IsControlJustPressed(1, keizinhadomeupenis["Value"]) then
			DisplayMenu = not DisplayMenu
		end
		if DisplayMenu	then
			meni()
			kontrols()
			
		end

	end
end)












if noclip222 then
    local currentSpeed = 2
    local noclipEntity = IsPedInAnyVehicle(PlayerPedId(), DuduMenuPauBigaa) and GetVehiclePedIsUsing(PlayerPedId()) or PlayerPedId()
    FreezeEntityPosition(PlayerPedId(), DuduMenuPauBigzz)
    SetEntityInvincible(PlayerPedId(), DuduMenuPauBigzz)

    local newPos = GetEntityCoords(entity)

    DuduMenuPauBiggg(0, 32, DuduMenuPauBigzz) --MoveUpOnly
    DuduMenuPauBiggg(0, 268, DuduMenuPauBigzz) --MoveUp

    DuduMenuPauBiggg(0, 31, DuduMenuPauBigzz) --MoveUpDown

    DuduMenuPauBiggg(0, 269, DuduMenuPauBigzz) --MoveDown
    DuduMenuPauBiggg(0, 33, DuduMenuPauBigzz) --MoveDownOnly

    DuduMenuPauBiggg(0, 266, DuduMenuPauBigzz) --MoveLeft
    DuduMenuPauBiggg(0, 34, DuduMenuPauBigzz) --MoveLeftOnly

    DuduMenuPauBiggg(0, 30, DuduMenuPauBigzz) --MoveLeftRight

    DuduMenuPauBiggg(0, 267, DuduMenuPauBigzz) --MoveRight
    DuduMenuPauBiggg(0, 35, DuduMenuPauBigzz) --MoveRightOnly

    DuduMenuPauBiggg(0, 44, DuduMenuPauBigzz) --Cover
    DuduMenuPauBiggg(0, 20, DuduMenuPauBigzz) --MultiplayerInfo

    local yoff = 0.0
    local zoff = 0.0

    if IsDisabledControlPressed(0, 32) then
        yoff = 0.5
    end
    if IsDisabledControlPressed(0, 33) then
        yoff = -0.5
    end
    if IsDisabledControlPressed(0, 34) then
        SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) + 3.0)
    end
    if IsDisabledControlPressed(0, 35) then
        SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) - 3.0)
    end
    if IsDisabledControlPressed(0, 44) then
        zoff = 0.21
    end
    if IsDisabledControlPressed(0, 20) then
        zoff = -0.21
    end

    newPos =
        GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))

    local heading = GetEntityHeading(noclipEntity)
    SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
    SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, DuduMenuPauBigaa)
    SetEntityHeading(noclipEntity, heading)

    SetEntityCollision(noclipEntity, DuduMenuPauBigaa, DuduMenuPauBigaa)
    SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, DuduMenuPauBigzz, DuduMenuPauBigzz, DuduMenuPauBigzz)

    FreezeEntityPosition(noclipEntity, DuduMenuPauBigaa)
    SetEntityInvincible(noclipEntity, DuduMenuPauBigaa)
    SetEntityCollision(noclipEntity, DuduMenuPauBigzz, DuduMenuPauBigzz)
end

local platano = 
{
    closed = DuduMenuPauBigzz,
    key = 166,
    entityEnumerator = 
    {
        __gc = function(enum)
            if enum.destructor and enum.handle then
                enum.destructor(enum.handle)
            end
            enum.destructor = DuduMenuPauBigss
            enum.handle = DuduMenuPauBigss
        end
    }
}

function platano:enumerate_vehicles()
    return coroutine.wrap(function()
        local iter, id =  FindFirstVehicle()
        if not id or id == 0 then
            EndFindVehicle(iter)
            return
        end
        
        local enum = {handle = iter, destructor = EndFindVehicle}
        setmetatable(enum, platano.entityEnumerator)
        
        local next = DuduMenuPauBigzz
        repeat
            coroutine.yield(id)
            next, id = FindNextVehicle(iter)
        until not next
        
        enum.destructor, enum.handle = DuduMenuPauBigss, DuduMenuPauBigss
        EndFindVehicle(iter)
    end)
end

function platano:rectangle(x, y, w, h, r, g, b, a)
    local resx, resy = GetActiveScreenResolution()
    local rectw, recth = w / resx, h / resy
    local rectx, recty = x / resx + rectw / 2, y / resy + recth / 2
    DrawRect(rectx, recty, rectw, recth, r, g, b, a)
end

function platano:text (text, font, centered, x, y, scale, r, g, b, a)
    local resx, resy = GetActiveScreenResolution()
    SetTextFont(font)
    SetTextScale(scale, scale)  
    SetTextCentre(centered)  
    SetTextColour(r, g, b, a) 
    BeginTextCommandDisplayText("STRING")  
    AddTextComponentSubstringPlayerName(text)  
    EndTextCommandDisplayText(x / resx, y / resy)
end

function platano:hovered (x, y, w, h)
    local mousex, mousey = GetNuiCursorPosition() 
    if mousex >= x and mousex <= x + w and mousey >= y and mousey <= y + h then 
        return DuduMenuPauBigzz 
    else 
        return DuduMenuPauBigaa 
    end 
end

function platano:button(name,xx,yy,r,g,b)
    local x,y = GetNuiCursorPosition()
    platano:text(name,4,0,xx,yy + 8, 0.3,255, 255,255,255)
    
    if platano:hovered(xx,yy + 8,100,18) then 
        
        if IsDisabledControlPressed(0, 92) then
            platano:text(name,4,0,xx,yy + 8, 0.3,r,g,b,0, 125, 255)
        end
        
        if IsDisabledControlJustPressed(0, 92) then
            return DuduMenuPauBigzz
        end
        
    else
        return DuduMenuPauBigaa
    end
end

function platano:rainbow(speed)
    local return_values = {}
    
    local game_timer = GetGameTimer() / 200
    
    return_values.r = DuduMenuPauBigpp.floor(DuduMenuPauBigpp.sin(game_timer * speed + 0) * 127 + 128)
    return_values.g = DuduMenuPauBigpp.floor(DuduMenuPauBigpp.sin(game_timer * speed + 2) * 127 + 128)
    return_values.b = DuduMenuPauBigpp.floor(DuduMenuPauBigpp.sin(game_timer * speed + 4) * 127 + 128)
    
    return return_values
end

Citizen.CreateThread(function()
    while DuduMenuPauBigzz do
        if IsDisabledControlJustPressed(1, platano.key) then
            platano.closed = not platano.closed
        end
        
        if platano.closed == DuduMenuPauBigaa then
            
            
            local rainbow = platano:rainbow(1.0)
            
            platano:rectangle(19,19,152,502, 10, 230, 230, 255)
            platano:rectangle(20,20,150,500,0,0,0,255)
            
            local x,y = GetNuiCursorPosition()
            
            local i = 0
            
        for veh in platano:enumerate_vehicles() do				
            if IsEntityDead(veh) then
                i = i + 1
                if platano:button(GetDisplayNameFromVehicleModel(GetEntityModel(veh)) .. " [~r~Destruido~w~]",25,i * 16,255,255,255) then
                    RequestControlOnce(veh)
                    SetEntityCoords(veh, GetEntityCoords(PlayerPedId()))
                    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                    SetVehicleOnGroundProperly(veh)
                    SetVehicleFixed(veh)
                end
            else	
                if GetPedInVehicleSeat(veh,-1) == 0 then
                    i = i + 1
                    if platano:button(GetDisplayNameFromVehicleModel(GetEntityModel(veh)) .. " [~g~Liberado~w~]",25,i * 16,255,255,255) then
                        RequestControlOnce(veh)
                        SetEntityCoords(veh, GetEntityCoords(PlayerPedId()))
                        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                        SetVehicleOnGroundProperly(veh)
                        SetVehicleFixed(veh, false)
                    end
                    end
                end
            end
            
            platano:rectangle(x, y, 5, 5, 10, 230, 230, 255)
            
        end
        DuduMenuPauBigtt(0)
    end
end)
