-- Credits to w7rus, aviarita, duk, Jon.
local zz, ui_reference ,ui_get, ui_set, ui_set_visible, color_log, exec = nil, ui.reference, ui.get, ui.set, ui.set_visible, client.color_log, client.exec
local RR, RA, RL, RV, RC, RM, RS = {}, {}, {}, {}, {}, {}, {} -- References
local SR, SA, SL, SV, SC, SM, SS = {}, {}, {}, {}, {}, {}, {} -- Stored Values
local Copied1, Copied2, Copied3, Copied4, Copied5, Copied6, isRetard = false, false, false, false, false, false, false -- Trying to prevent Script/Cfg from breaking if the user has <2 iq.
local weapon_type = ui_reference("LEGIT", "Weapon type", "weapon type")
local OverrideKnife, KType = ui_reference("SKINS", "Knife options", "Override knife")  
local OverrideGloves, GType, GSkin = ui_reference("SKINS", "Glove options", "Override gloves") 
local LegitTab = {"Pistol", "Smg", "Rifle", "Shotgun", "Machine gun", "Sniper"}
local Weapons = {"m4a1", "m4a1_silencer", "ak47", "aug", "awp", "famas", "g3sg1", "galilar", "scar20", "sg556", "ssg08", "bizon", "mac10", "mp7", "mp9", "p90", "ump45", "mp5sd", "m249", "mag7", "negev", "nova", "sawedoff", "xm1014", "usp_silencer", "deagle", "elite", "fiveseven", "glock", "hkp2000", "p250", "tec9", "cz75a", "revolver", "knife"}
--------------------------------------------------------------------------------------------------------------RAGE-REF-----------------------------------------------------------------------------------------------------
RR.Enabled                                = ui_reference("RAGE", "Aimbot", "Enabled")                             RR.AutomaticScope                         = ui_reference("RAGE", "Aimbot", "Automatic scope")
RR.TargetSelection                        = ui_reference("RAGE", "Aimbot", "Target selection")                    RR.ReduceAimStep                          = ui_reference("RAGE", "Aimbot", "Reduce aim step")
RR.TargetHitbox                           = ui_reference("RAGE", "Aimbot", "Target hitbox")                       RR.LogMissesDueToSpread                   = ui_reference("RAGE", "Aimbot", "Log misses due to spread")
RR.AvoidLimbs                             = ui_reference("RAGE", "Aimbot", "Avoid limbs if moving")               RR.MaximumFov                             = ui_reference("RAGE", "Aimbot", "Maximum FOV")
RR.AvoidHead                              = ui_reference("RAGE", "Aimbot", "Avoid head if jumping")               RR.QuickStop                              = ui_reference("RAGE", "Other", "Quick stop")
RR.MultiPoint, zz, RR.MpMode              = ui_reference("RAGE", "Aimbot", "Multi-point")                         RR.QuickStopOptions                       = ui_reference("RAGE", "Other", "Quick stop options")
RR.MultiPointScale                        = ui_reference("RAGE", "Aimbot", "Multi-point scale")                   RR.PreferBodyAim                          = ui_reference("RAGE", "Other", "Prefer body aim")
RR.DynamicMultiPoint                      = ui_reference("RAGE", "Aimbot", "Dynamic multi-point")                 RR.AccuracyBoost                          = ui_reference("RAGE", "Other", "Accuracy boost")
RR.SafePoint                              = ui_reference("RAGE", "Aimbot", "Prefer Safe point")                   RR.AAimCorrection                         = ui_reference("RAGE", "Other", "Anti-Aim correction")
RR.LowFpsMitigations                      = ui_reference("RAGE", "Aimbot", "Low FPS mitigations")                 RR.RemoveRecoil                           = ui_reference("RAGE", "Other", "Remove recoil")
RR.AutomaticFire                          = ui_reference("RAGE", "Aimbot", "Automatic fire")                      RR.PreferBodyAimDisablers                 = ui_reference("RAGE", "Other", "Prefer body aim disablers")
RR.AutomaticPenetration                   = ui_reference("RAGE", "Aimbot", "Automatic penetration")               RR.DelayShotOnUnduck                      = ui_reference("RAGE", "Other", "Delay shot on unduck")
RR.SilentAim                              = ui_reference("RAGE", "Aimbot", "Silent aim")                          RR.DelayShotOnPeek                        = ui_reference("RAGE", "Other", "Delay shot on peek")
RR.MinHitchance                           = ui_reference("RAGE", "Aimbot", "Minimum hit chance")                  RR.DoubleTap                              = ui_reference("RAGE", "Other", "Double tap")
RR.MinDamage                              = ui_reference("RAGE", "Aimbot", "Minimum Damage")                      RR.DoubleTapMode                          = ui_reference("RAGE", "Other", "Double tap mode")
RR.OverrideAwp                            = ui_reference("RAGE", "Aimbot", "Override AWP")                        RR.RemoveSpread                           = ui_reference("RAGE", "Other", "Remove spread")
--------------------------------------------------------------------------------------------------------------ANTI-AIM-REF-------------------------------------------------------------------------------------------------
RA.Pitch                                  = ui_reference("AA", "Anti-aimbot angles", "Pitch")                     RA.Enabled                                = ui_reference("AA", "Fake lag", "Enabled")
RA.YawBase                                = ui_reference("AA", "Anti-aimbot angles", "Yaw base")                  RA.CustomizeTriggers                      = ui_reference("AA", "Fake lag", "Customize triggers")
RA.Yaw, RA.YawSlider                      = ui_reference("AA", "Anti-aimbot angles", "Yaw")                       RA.Triggers                               = ui_reference("AA", "Fake lag", "Triggers")
RA.YawJitter, RA.YawJSlider               = ui_reference("AA", "Anti-aimbot angles", "Yaw jitter")                RA.Amount                                 = ui_reference("AA", "Fake lag", "Amount")
RA.BodyYaw, RA.BodyYSlider                = ui_reference("AA", "Anti-aimbot angles", "Body yaw")                  RA.Variance                               = ui_reference("AA", "Fake lag", "Variance")
RA.FreeStandingBodyYaw                    = ui_reference("AA", "Anti-aimbot angles", "Freestanding body yaw")     RA.Limit                                  = ui_reference("AA", "Fake lag", "Limit")
RA.LowerBodyYawTarget                     = ui_reference("AA", "Anti-aimbot angles", "Lower body yaw target")     RA.FakeLagWhileShooting                   = ui_reference("AA", "Fake lag", "Fake lag while shooting")
RA.FakeYawLimit                           = ui_reference("AA", "Anti-aimbot angles", "Fake yaw limit")            RA.ResetOnBunnyHop                        = ui_reference("AA", "Fake lag", "Reset on bunny hop")
RA.EdgeYaw                                = ui_reference("AA", "Anti-aimbot angles", "Edge yaw")                  RA.SlowMotion                             = ui_reference("AA", "Other", "Slow motion")
RA.Enabled2                               = ui_reference("AA", "Anti-aimbot angles", "Enabled")                   RA.OnShotAntiAim                          = ui_reference("AA", "Other", "On shot anti-aim")
RA.FreeStanding                           = ui_reference("AA", "Anti-aimbot angles", "Freestanding")              RA.LegMovement                            = ui_reference("AA", "Other", "Leg movement")
RA.FreeStandingIgnoreDuck                 = ui_reference("AA", "Anti-aimbot angles", "Freestanding ignore duck")  RA.SlowMotionType                         = ui_reference("AA", "Other", "Slow motion type")
--------------------------------------------------------------------------------------------------------------LEGIT-REF----------------------------------------------------------------------------------------------------
RL.Enabled1                               = ui_reference("LEGIT", "Aimbot", "Enabled")                            RL.Stomach1                               = ui_reference("LEGIT", "Aimbot", "Stomach")
RL.Speed                                  = ui_reference("LEGIT", "Aimbot", "Speed")                              RL.Enabled2                               = ui_reference("LEGIT", "Triggerbot", "Enabled")
RL.SpeedInAttack                          = ui_reference("LEGIT", "Aimbot", "Speed (in attack)")                  RL.ReactionTime2                          = ui_reference("LEGIT", "Triggerbot", "Reaction time")
RL.SpeedScaleFov                          = ui_reference("LEGIT", "Aimbot", "Speed scale - FOV")                  RL.BurstFire, RL.BurstS                   = ui_reference("LEGIT", "Triggerbot", "Burst fire")
RL.MaximumLockOnTime                      = ui_reference("LEGIT", "Aimbot", "Maximum lock-on time")               RL.MinDamage                              = ui_reference("LEGIT", "Triggerbot", "Minimum damage")
RL.ReactionTime1                          = ui_reference("LEGIT", "Aimbot", "Reaction time")                      RL.AutomaticPenetration                   = ui_reference("LEGIT", "Triggerbot", "Automatic penetration")
RL.MaximumFov                             = ui_reference("LEGIT", "Aimbot", "Maximum FOV")                        RL.Head2                                  = ui_reference("LEGIT", "Triggerbot", "Head")
RL.Pitch, RL.RcsYaw                       = ui_reference("LEGIT", "Aimbot", "Recoil compensation (P/Y)")          RL.Chest2                                 = ui_reference("LEGIT", "Triggerbot", "Chest")
RL.QickStop                               = ui_reference("LEGIT", "Aimbot", "Quick stop")                         RL.Stomach2                               = ui_reference("LEGIT", "Triggerbot", "Stomach")
RL.AimThroughSmoke                        = ui_reference("LEGIT", "Aimbot", "Aim through smoke")                  RL.MinHitchance                           = ui_reference("LEGIT", "Triggerbot", "Minimum hit chance")
RL.AimWhileBlind                          = ui_reference("LEGIT", "Aimbot", "Aim while blind")                    RL.AccuracyBoostRange                     = ui_reference("LEGIT", "Other", "Accuracy boost range")
RL.Head1                                  = ui_reference("LEGIT", "Aimbot", "Head")                               RL.StandAloneRecoilCompensation           = ui_reference("LEGIT", "Other", "Standalone recoil compensation")
RL.Chest1                                 = ui_reference("LEGIT", "Aimbot", "Chest")                              RL.AccuracyBoost                          = ui_reference("LEGIT", "Other", "Accuracy boost")
--------------------------------------------------------------------------------------------------------------VISUALS-REF--------------------------------------------------------------------------------------------------
RV.Teammates                              = ui_reference("VISUALS", "Player ESP", "Teammates")                    RV.RemoveFlash                            = ui_reference("VISUALS", "Effects", "Remove flashbang effects")
RV.Dormant                                = ui_reference("VISUALS", "Player ESP", "Dormant")                      RV.InstantScope                           = ui_reference("VISUALS", "Effects", "Instant scope")
RV.BoundingBox, RC.Clr1                   = ui_reference("VISUALS", "Player ESP", "Bounding box")                 RV.BulletTracers, RC.Clr47                = ui_reference("VISUALS", "Effects", "Bullet tracers")
RV.HealthBar                              = ui_reference("VISUALS", "Player ESP", "Health bar")                   RV.BulletImpacts, RV.Duration             = ui_reference("VISUALS", "Effects", "Bullet impacts")
RV.Name, RC.Clr2                          = ui_reference("VISUALS", "Player ESP", "Name")                         RV.InaccuracyOverlay, RC.Clr25            = ui_reference("VISUALS", "Other ESP", "Inaccuracy overlay")
RV.Flags                                  = ui_reference("VISUALS", "Player ESP", "Flags")                        RV.RecoilOverlay                          = ui_reference("VISUALS", "Other ESP", "Recoil overlay")
RV.WeaponText                             = ui_reference("VISUALS", "Player ESP", "Weapon text")                  RV.Crosshair                              = ui_reference("VISUALS", "Other ESP", "Crosshair")
RV.WeaponIcon, RC.Clr3                    = ui_reference("VISUALS", "Player ESP", "Weapon icon")                  RV.Bomb, RC.Clr26                         = ui_reference("VISUALS", "Other ESP", "Bomb")
RV.Ammo, RC.Clr4                          = ui_reference("VISUALS", "Player ESP", "Ammo")                         RV.GrenadeTrajectory, RC.Clr27            = ui_reference("VISUALS", "Other ESP", "Grenade trajectory")
RV.Distance                               = ui_reference("VISUALS", "Player ESP", "Distance")                     RV.GrenadeProximityWarning                = ui_reference("VISUALS", "Other ESP", "Grenade proximity warning")
RV.Glow, RC.Clr5                          = ui_reference("VISUALS", "Player ESP", "Glow")                         RV.Spectators                             = ui_reference("VISUALS", "Other ESP", "Spectators")
RV.HitMarker                              = ui_reference("VISUALS", "Player ESP", "Hit marker")                   RV.PenetrationReticle                     = ui_reference("VISUALS", "Other ESP", "Penetration reticle")
RV.HitMarkerSound                         = ui_reference("VISUALS", "Player ESP", "Hit marker sound")             RV.Hostages, RC.Clr28                     = ui_reference("VISUALS", "Other ESP", "Hostages")
RV.VisualizeSounds, RC.Clr6               = ui_reference("VISUALS", "Player ESP", "Visualize sounds")             RV.SharedEsp                              = ui_reference("VISUALS", "Other ESP", "Shared ESP")
RV.LineOfSight, RC.Clr7                   = ui_reference("VISUALS", "Player ESP", "Line of sight")                RV.SharedEspWithOtherTeam                 = ui_reference("VISUALS", "Other ESP", "Shared ESP with other team")
RV.Money                                  = ui_reference("VISUALS", "Player ESP", "Money")                        RV.RestrictSharedEspUpdates               = ui_reference("VISUALS", "Other ESP", "Restrict shared ESP updates")
RV.Skeleton, RC.Clr8                      = ui_reference("VISUALS", "Player ESP", "Skeleton")                     RV.UpgradeTablet                          = ui_reference("VISUALS", "Other ESP", "Upgrade tablet")
RV.OOFA, RC.Clr9, RV.Pos, RV.Size         = ui_reference("VISUALS", "Player ESP", "Out of FOV arrow")             RV.DangerZoneItems                        = ui_reference("VISUALS", "Other ESP", "Danger Zone items")
RV.Player, RC.Clr10                       = ui_reference("VISUALS", "Colored models", "Player")                   RV.DroneGun, RC.Clr29                     = ui_reference("VISUALS", "Other ESP", "Drone gun")
RV.Pbw, RC.Clr11, RV.Cham1, RC.Clr12      = ui_reference("VISUALS", "Colored models", "Player behind wall")       RV.BlackHawk, RC.Clr30                    = ui_reference("VISUALS", "Other ESP", "Blackhawk")
RV.Teammate, RC.Clr13                     = ui_reference("VISUALS", "Colored models", "Teammate")                 RV.Drone, RC.Clr31                        = ui_reference("VISUALS", "Other ESP", "Drone")
RV.Tbw, RC.Clr14, RV.Cham2, RC.Clr15      = ui_reference("VISUALS", "Colored models", "Teammate behind wall")     RV.RandomCase, RC.Clr32                   = ui_reference("VISUALS", "Other ESP", "Random case")
RV.LPlayer, RC.Clr16, RV.Cham3, RC.Clr17  = ui_reference("VISUALS", "Colored models", "Local player")             RV.ToolCase, RC.Clr33                     = ui_reference("VISUALS", "Other ESP", "Tool case")
RV.LPlayerF, RC.Clr18, RV.Cham4, RC.Clr19 = ui_reference("VISUALS", "Colored models", "Local player fake")        RV.PistolCase, RC.Clr34                   = ui_reference("VISUALS", "Other ESP", "Pistol case")
RV.Hands, RC.Clr20, RV.Cham5, RC.Clr21    = ui_reference("VISUALS", "Colored models", "Hands")                    RV.ExplosiveCase, RC.Clr35                = ui_reference("VISUALS", "Other ESP", "Explosive case")
RV.DisableModelOcclusion                  = ui_reference("VISUALS", "Colored models", "Disable model occlusion")  RV.HeavyWeaponCase, RC.Clr36              = ui_reference("VISUALS", "Other ESP", "Heavy weapon case")
RV.Shadow, RC.Clr22                       = ui_reference("VISUALS", "Colored models", "Shadow")                   RV.LightWeaponCase, RC.Clr37              = ui_reference("VISUALS", "Other ESP", "Light weapon case")
RV.Props, RC.Clr48                        = ui_reference("VISUALS", "Colored models", "Props")                    RV.DuffleBag, RC.Clr38                    = ui_reference("VISUALS", "Other ESP", "Dufflebag")
RV.RemoveSmoke                            = ui_reference("VISUALS", "Effects", "Remove smoke grenades")           RV.Jammer, RC.Clr39                       = ui_reference("VISUALS", "Other ESP", "Jammer")
RV.RemoveFog                              = ui_reference("VISUALS", "Effects", "Remove fog")                      RV.Ammobox, RC.Clr40                      = ui_reference("VISUALS", "Other ESP", "Ammobox")
RV.RemoveSkybox                           = ui_reference("VISUALS", "Effects", "Remove skybox")                   RV.Armor, RC.Clr41                        = ui_reference("VISUALS", "Other ESP", "Armor")
RV.VisualRecoilAdjustment                 = ui_reference("VISUALS", "Effects", "Visual recoil adjustment")        RV.ParachutePack, RC.Clr42                = ui_reference("VISUALS", "Other ESP", "Parachute pack")
RV.TransparentWalls                       = ui_reference("VISUALS", "Effects", "Transparent walls")               RV.Briefcase, RC.Clr43                    = ui_reference("VISUALS", "Other ESP", "Briefcase")
RV.TransparentProps                       = ui_reference("VISUALS", "Effects", "Transparent props")               RV.TabletUpgradeZone, RC.Clr44            = ui_reference("VISUALS", "Other ESP", "Tablet upgrade drone")
RV.BrightnessAdjustment, RC.Clr49         = ui_reference("VISUALS", "Effects", "Brightness adjustment")           RV.TabletUpgradeDrone, RC.Clr45           = ui_reference("VISUALS", "Other ESP", "Tablet upgrade zone")
RV.RemoveScope                            = ui_reference("VISUALS", "Effects", "Remove scope overlay")            RV.CashStack, RC.Clr46                    = ui_reference("VISUALS", "Other ESP", "Cash stack")
RV.DisableTeammates                       = ui_reference("VISUALS", "Effects", "Disable rendering of teammates")  RV.Grenades, RC.Clr24                     = ui_reference("VISUALS", "Other ESP", "Grenades")
RV.DisablePostProcessing                  = ui_reference("VISUALS", "Effects", "Disable post processing")         RV.DroppedWeaponAmmo                      = ui_reference("VISUALS", "Other ESP", "Dropped weapon ammo")
RV.ForceThirdPersonAlive                  = ui_reference("VISUALS", "Effects", "Force third person (alive)")      RV.DroppedWeapon, RC.Clr23                = ui_reference("VISUALS", "Other ESP", "Dropped weapons")
RV.ForceThirdPersonDead                   = ui_reference("VISUALS", "Effects", "Force third person (dead)")       RV.Radar                                  = ui_reference("VISUALS", "Other ESP", "Radar")
--------------------------------------------------------------------------------------------------------------MISC-REF-----------------------------------------------------------------------------------------------------
RM.StandaloneQuickStop                    = ui_reference("MISC", "Movement", "Standalone quick stop")             RM.RevealCompetitiveRanks                 = ui_reference("MISC", "Miscellaneous", "Reveal competitive ranks")
RM.BunnyHop                               = ui_reference("MISC", "Movement", "Bunny hop")                         RM.AutoAcceptMatchmaking                  = ui_reference("MISC", "Miscellaneous", "Auto-accept matchmaking")
RM.AirStrafe                              = ui_reference("MISC", "Movement", "Air strafe")                        RM.AutomaticGrenadeRelease                = ui_reference("MISC", "Miscellaneous", "Automatic grenade release")
RM.AirStrafeDirection                     = ui_reference("MISC", "Movement", "Air strafe direction")              RM.PingSpike, zz, RM.PingVal              = ui_reference("MISC", "Miscellaneous", "Ping spike")
RM.AirStrafeSmoothing                     = ui_reference("MISC", "Movement", "Air strafe smoothing")              RM.OverrideFov                            = ui_reference("MISC", "Miscellaneous", "Override FOV")
RM.Zhop, zz, RM.Zy, RM.Zx                 = ui_reference("MISC", "Movement", "Z-Hop")                             RM.PersistentKillFeed                     = ui_reference("MISC", "Miscellaneous", "Persistent kill feed")
RM.PreSpeed                               = ui_reference("MISC", "Movement", "Pre-speed")                         RM.ZeusBot                                = ui_reference("MISC", "Miscellaneous", "Zeusbot")
RM.AirDuck                                = ui_reference("MISC", "Movement", "Air duck")                          RM.LogPurchases                           = ui_reference("MISC", "Miscellaneous", "Log weapon purchases")
RM.InfiniteDuck                           = ui_reference("MISC", "Movement", "Infinite duck")                     RM.RevealOverwatchPlayers                 = ui_reference("MISC", "Miscellaneous", "Reveal Overwatch players")
RM.FastWalk                               = ui_reference("MISC", "Movement", "Fast walk")                         RM.KnifeBot, RM.KnifeMode                 = ui_reference("MISC", "Miscellaneous", "Knifebot")
RM.BlockBot                               = ui_reference("MISC", "Movement", "Blockbot")                          RM.AutomaticWeapons, RM.ADelay            = ui_reference("MISC", "Miscellaneous", "Automatic weapons")
RM.EasyStrafe                             = ui_reference("MISC", "Movement", "Easy strafe")                       RM.OverrideZoomFov                        = ui_reference("MISC", "Miscellaneous", "Override Zoom FOV")
RM.JumpAtEdge                             = ui_reference("MISC", "Movement", "Jump at edge")                      RM.HideFromObs                            = ui_reference("MISC", "Settings", "Hide from OBS")
RM.ClanTagSpammer                         = ui_reference("MISC", "Miscellaneous", "Clan tag spammer")             RM.AntiUntrusted                          = ui_reference("MISC", "Settings", "Anti-untrusted")
RM.LogDamageDealt                         = ui_reference("MISC", "Miscellaneous", "Log damage dealt")             RM.LowFpsWarning                          = ui_reference("MISC", "Settings", "Low FPS warning")
--------------------------------------------------------------------------------------------------------------SKINS-REF----------------------------------------------------------------------------------------------------
RS.Quality                                = ui_reference("SKINS", "Weapon skin", "Quality")                       RS.Seed                                   = ui_reference("SKINS", "Weapon skin", "Seed")
RS.Enabled                                = ui_reference("SKINS", "Weapon skin", "Enabled")                       RS.List                                   = ui_reference("Skins", "Weapon Skin", "Skin")
RS.StatTrak                               = ui_reference("SKINS", "Weapon skin", "StatTrak")                      RS.FilterByWeapon                         = ui_reference("SKINS", "Weapon skin", "Filter by weapon")
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Enabled     = ui.new_checkbox   ("LUA", "A", "Enable Tab Mover")
local MultiSelect = ui.new_multiselect("LUA", "A", "Selected Tabs", "Rage", "Anti-Aim", "Legit", "Visuals", "Misc", "Skins")

local function Retard(Copied, TabName)
    if Copied ~= true then color_log(255, 30, 0, "Copy the " .. TabName .. " tab, before trying to paste it. You dumb fuck.") return true end
end

local function Done(type, tabName)
local theThingy = nil    
    if type == 1 then theThingy = "Copied " 
    elseif type == 2 then theThingy = "Pasted " 
    end
    color_log(4, 225, 0, theThingy .. tabName .. " Tab.")
end

local function SkinCheck(Type)
    if globals.mapname() == nil then color_log(0, 191, 230, 'Before trying to copy Skins tab, go into a local game and set "sv_cheats" to 1.') return end
    if client.get_cvar("sv_cheats") ~= "1" then color_log(0, 191, 230, 'Before trying to '.. Type ..' Skins tab, set "sv_cheats" to 1.') return end
    exec("jointeam 2; mp_restartgame 1; mp_warmup_end; mp_roundtime 60; mp_roundtime_defuse 60; mp_roundtime_hostage 60; bot_kick; mp_buytime 0; mp_humanteam any; mp_respawn_on_death_ct 1; mp_respawn_on_death_t 1") return true
end

local function GiveWeapon(weapon)
    exec("give weapon_"..weapon)
end

local function CopyRage()
    for k, v in pairs(RR) do
        SR[k] = ui_get(v)
    end
    Done(1, "Rage")
end

local function CopyAA()
    for k, v in pairs(RA) do
        SA[k] = ui_get(v)
    end
    Done(1, "Ant-Aim")
end

local function CopyLegit()
    for _, t in pairs(LegitTab) do
        ui_set(weapon_type, t)
        for k, v in pairs(RL) do
            SL[t .. k] = ui_get(v)
        end
    end
    Done(1, "Legit")
end

local function CopyVisuals()
    for k, v in pairs(RV) do
        SV[k] = ui_get(v)
    end
    for k, v in pairs(RC) do
        SC[k] = {ui_get(v)}
    end
    Done(1, "Visuals")
end

local function CopyMisc()
    for k, v in pairs(RM) do
        SM[k] = ui_get(v)
    end
    Done(1, "Misc")
end

local function CopySkins()
    if not SkinCheck("Copy") then return end
    local autistDelay = 0.2
    client.delay_call(2, function()
        SS[OverrideGloves] = ui_get(OverrideGloves)
        SS[OverrideKnife]  = ui_get(OverrideKnife)
        SS[GType]          = ui_get(GType)
        SS[GSkin]          = ui_get(GSkin)
        SS[KType]          = ui_get(KType)
        exec("ent_fire weapon_* kill")
        client.delay_call(autistDelay ,GiveWeapon, "knife")
    end)
    client.delay_call(2.5, function()
        for k, v in pairs(RS) do
            SS["ALTKNIFE" .. k] = ui_get(v)
        end
    end)
    client.delay_call(3.5, function()
        exec("jointeam 3; bot_kick; ent_fire weapon_* kill")
        for _, wep in pairs(Weapons) do
            client.delay_call(autistDelay ,GiveWeapon, wep)
            client.delay_call(autistDelay+0.1 ,function()
                for k, v in pairs(RS) do
                    SS[wep .. k] = ui_get(v)
                end
                exec("ent_fire weapon_* kill")
            end)
            autistDelay = autistDelay + 0.2
        end
    end)
    client.delay_call(12 ,function()
        exec("mp_restartgame 1")
        Done(1, "Skins")
    end)
end

local function PasteRage()
    if Retard(Copied1, "Rage") then return end
    for k, v in pairs(RR) do
        ui_set(v, SR[k])
    end
    Done(2, "Rage")
end

local function PasteAA()
    if Retard(Copied2, "Anti-Aim") then return end
    for k, v in pairs(RA) do
        ui_set(v, SA[k])
    end
    Done(2, "Anti-Aim")
end

local function PasteLegit()
    if Retard(Copied3, "Legit") then return end
    for _, t in pairs(LegitTab) do
        ui_set(weapon_type, t)
        for k, v in pairs(RL) do
            ui_set(v, SL[t .. k])
        end
    end
    Done(2, "Legit")
end

local function PasteVisuals()
    if Retard(Copied4, "Visuals") then return end
    for k, v in pairs(RV) do
        ui_set(v, SV[k])
    end
    for k, v in pairs(RC) do
        ui_set(v, SC[k][1], SC[k][2], SC[k][3], SC[k][4])
    end
    Done(2, "Visuals")
end

local function PasteMisc()
    if Retard(Copied5, "Misc") then return end
    for k, v in pairs(RM) do
        ui_set(v, SM[k])
    end
    Done(2, "Misc")
end

local function PasteSkins()
    if Retard(Copied6, "Skins") then return end
    if not SkinCheck("Paste") then return end
    local autistDelay = 0.2
    client.delay_call(2, function()
        ui_set(OverrideGloves, SS[OverrideGloves])
        ui_set(OverrideKnife, SS[OverrideKnife])
        ui_set(GType, SS[GType])
        ui_set(GSkin, SS[GSkin])
        ui_set(KType, SS[KType])
        exec("ent_fire weapon_* kill")
        client.delay_call(autistDelay ,GiveWeapon, "knife")
    end)
    client.delay_call(2.5, function()
        for k, v in pairs(RS) do
            ui_set(v, SS["ALTKNIFE" .. k])
        end
    end)
    client.delay_call(3.5, function()
        exec("jointeam 3; bot_kick; ent_fire weapon_* kill")
        for _, wep in pairs(Weapons) do
            client.delay_call(autistDelay ,GiveWeapon, wep)
            client.delay_call(autistDelay+0.1 ,function()
                for k, v in pairs(RS) do
                    ui_set(v, SS[wep .. k])
                end
                exec("ent_fire weapon_* kill")
            end)
            autistDelay = autistDelay + 0.2
        end
    end)
    client.delay_call(12 ,function()
        Done(2, "Skins")
        exec("mp_restartgame 1")
    end)
end

local function Copy()
    local SelectedTabs = ui_get(MultiSelect)
    for i=1, #SelectedTabs do
        if SelectedTabs[i] == "Rage"     then CopyRage()    Copied1 = true end
        if SelectedTabs[i] == "Anti-Aim" then CopyAA()      Copied2 = true end
        if SelectedTabs[i] == "Legit"    then CopyLegit()   Copied3 = true end
        if SelectedTabs[i] == "Visuals"  then CopyVisuals() Copied4 = true end
        if SelectedTabs[i] == "Misc"     then CopyMisc()    Copied5 = true end
        if SelectedTabs[i] == "Skins"    then CopySkins()   Copied6 = true end
    end
end

local function Paste()
    local SelectedTabs = ui_get(MultiSelect)
    for i=1, #SelectedTabs do
        if SelectedTabs[i] == "Rage"     then PasteRage()    end
        if SelectedTabs[i] == "Anti-Aim" then PasteAA()      end
        if SelectedTabs[i] == "Legit"    then PasteLegit()   end
        if SelectedTabs[i] == "Visuals"  then PasteVisuals() end
        if SelectedTabs[i] == "Misc"     then PasteMisc()    end
        if SelectedTabs[i] == "Skins"    then PasteSkins()   end
    end
end

local Button1  = ui.new_button("LUA", "A", "Copy Selected Tabs", Copy)
local Button2  = ui.new_button("LUA", "A", "Paste Selected Tabs", Paste)

local function HandleMenu()
    if ui_get(Enabled) then
        ui_set_visible(MultiSelect, true)
        ui_set_visible(Button1, true)
        ui_set_visible(Button2, true)
    else
        ui_set_visible(MultiSelect, false)
        ui_set_visible(Button1, false)
        ui_set_visible(Button2, false)
        ui_set(MultiSelect, "-")
    end
end
HandleMenu()
ui.set_callback(Enabled, HandleMenu)
