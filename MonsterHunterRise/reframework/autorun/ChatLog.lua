local Pl
local Ed
local Kd
local St
local Reset

local function getPlayerManager()
    return sdk.get_managed_singleton("snow.player.PlayerManager")
end
local function getMasterPlayerID()
    return getPlayerManager():call("getMasterPlayerID")
end
local function getPlayerListPrivate()
    return getPlayerManager():get_field("PlayerListPrivate"):call("get_Item", getMasterPlayerID())
end
local function getPlayerData()
    return getPlayerManager():call("get_PlayerData"):call("get_Item", getMasterPlayerID())
end
local function getPlayer()
    return getPlayerManager():call("getPlayer", getMasterPlayerID())
end
local function getPlayerSkill()
    return getPlayerManager():call("get_PlayerSkill()"):call("get_Item", getMasterPlayerID())
end
local function getPlayerQuestDefine()
    return sdk.find_type_definition("snow.player.PlayerQuestDefine")
end

local function init()
    Reset                       = true
    local playerQuestDefine     = getPlayerQuestDefine()
    local _EquipSkillParameter  = getPlayerManager():get_field("_PlayerUserDataSkillParameter"):get_field("_EquipSkillParameter")
    local _OdangoSkillParameter = getPlayerManager():get_field("_PlayerUserDataSkillParameter"):get_field("_OdangoSkillParameter")
    return {
        EquipSkill_001   = { false, playerQuestDefine:get_field("SkillChallengeTime"):get_data(nil) },
        EquipSkill_002   = false,
        EquipSkill_003   = false,
        EquipSkill_004   = false,
        EquipSkill_008   = false,
        EquipSkill_009   = { false, false, false, 120 },
        EquipSkill_036   = { false, 720 },
        EquipSkill_042   = { false, _EquipSkillParameter:get_field("_EquipSkill_042_CtlAddTime") * 60 },
        EquipSkill_090   = { false, 0.35 },
        EquipSkill_091   = { false, 0 },
        EquipSkill_102   = { false, {
            _EquipSkillParameter:get_field("_EquipSkill_102_ActivationLv2"),
            _EquipSkillParameter:get_field("_EquipSkill_102_ActivationLv2"),
            _EquipSkillParameter:get_field("_EquipSkill_102_ActivationLv4"),
            _EquipSkillParameter:get_field("_EquipSkill_102_ActivationLv4"),
            _EquipSkillParameter:get_field("_EquipSkill_102_ActivationLv5") } },
        EquipSkill_105   = { false, 1800 },
        EquipSkill_204   = { false, 1800 },
        EquipSkill_206   = { false, playerQuestDefine:get_field("SkillChallengeTime"):get_data(nil) },
        EquipSkill_208   = { false, {
            _EquipSkillParameter:get_field("_EquipSkill_208_Lv1_Duration") * 60,
            _EquipSkillParameter:get_field("_EquipSkill_208_Lv2_Duration") * 60,
            _EquipSkillParameter:get_field("_EquipSkill_208_Lv3_Duration") * 60 } },
        EquipSkill_215   = { false, {
            _EquipSkillParameter:get_field("_EquipSkill_216_Lv1"):get_field("_Bow_Duration") * 60,
            _EquipSkillParameter:get_field("_EquipSkill_216_Lv2"):get_field("_Bow_Duration") * 60,
            _EquipSkillParameter:get_field("_EquipSkill_216_Lv3"):get_field("_Bow_Duration") * 60,
        } },
        EquipSkill_220   = false,
        EquipSkill_221   = { false, {
            _EquipSkillParameter:get_field("_EquipSkill_222_Lv1"),
            _EquipSkillParameter:get_field("_EquipSkill_222_Lv2"),
            _EquipSkillParameter:get_field("_EquipSkill_222_Lv3") } },
        EquipSkill_222   = { false, {
            (100 - _EquipSkillParameter:get_field("_EquipSkill_223"):get_field("_DamageReduceLv1")) / 100,
            (100 - _EquipSkillParameter:get_field("_EquipSkill_223"):get_field("_DamageReduceLv2")) / 100 },
            _EquipSkillParameter:get_field("_EquipSkill_223"):get_field("_AccumulatorMax") },
        EquipSkill_224   = false,
        EquipSkill_225   = false,
        EquipSkill_226   = false,
        EquipSkill_230   = false,
        EquipSkill_231   = false,
        EquipSkill_232   = { false, {
            _EquipSkillParameter:get_field("_EquipSkill_231_Lv1_WpOn_Timer") * 60,
            _EquipSkillParameter:get_field("_EquipSkill_231_Lv2_WpOn_Timer") * 60,
            _EquipSkillParameter:get_field("_EquipSkill_231_Lv3_WpOn_Timer") * 60 } },

        KitchenSkill_002 = { false, {
            _OdangoSkillParameter:get_field("_KitchenSkill_002_Lv1"):get_field("_EnableHP"),
            _OdangoSkillParameter:get_field("_KitchenSkill_002_Lv2"):get_field("_EnableHP"),
            _OdangoSkillParameter:get_field("_KitchenSkill_002_Lv3"):get_field("_EnableHP"),
            _OdangoSkillParameter:get_field("_KitchenSkill_002_Lv4"):get_field("_EnableHP") } },
        KitchenSkill_024 = false,
        KitchenSkill_027 = { false, {
            _OdangoSkillParameter:get_field("_KitchenSkill_027_Lv1"):get_field("_Time") * 3600,
            _OdangoSkillParameter:get_field("_KitchenSkill_027_Lv2"):get_field("_Time") * 3600,
            _OdangoSkillParameter:get_field("_KitchenSkill_027_Lv3"):get_field("_Time") * 3600,
            _OdangoSkillParameter:get_field("_KitchenSkill_027_Lv4"):get_field("_Time") * 3600 } },
        KitchenSkill_048 = { false, {
            _OdangoSkillParameter:get_field("_KitchenSkill_048_Lv1_Damage"),
            _OdangoSkillParameter:get_field("_KitchenSkill_048_Lv2_Damage"),
            _OdangoSkillParameter:get_field("_KitchenSkill_048_Lv3_Damage"),
            _OdangoSkillParameter:get_field("_KitchenSkill_048_Lv4_Damage") }, {
            _OdangoSkillParameter:get_field("_KitchenSkill_048_Lv1_Reduce"),
            _OdangoSkillParameter:get_field("_KitchenSkill_048_Lv2_Reduce"),
            _OdangoSkillParameter:get_field("_KitchenSkill_048_Lv3_Reduce"),
            _OdangoSkillParameter:get_field("_KitchenSkill_048_Lv4_Reduce") } }
    }
end

local function getState()
    local player     = getPlayerListPrivate()
    local playerData = getPlayerData()
    local playerBase = getPlayer()
    local PlayerInfo = sdk.get_managed_singleton("snow.gui.GuiManager"):get_field("<refGuiHud>k__BackingField"):get_field("PlayerInfo")
    return {
        playerHealth                 = playerData:call("get_vital()"),
        playerMaxHealth              = player:call("getVitalMax()"),
        playerRawRedHealth           = playerData:get_field("_r_Vital"),
        playerRedHealth              = player:call("getRedVital()"),
        playerStamina                = playerData:get_field("_stamina"),
        playerMaxStamina             = playerData:get_field("_staminaMax"),

        _ChallengeTimer              = playerData:get_field("_ChallengeTimer"),
        isDebuffState                = player:call("isDebuffState"),
        _PowerFreedomTimer           = playerBase:get_field("_PowerFreedomTimer"),
        _WholeBodyTimer              = playerData:get_field("_WholeBodyTimer"),
        _EquipSkill_036_Timer        = playerData:get_field("_EquipSkill_036_Timer"),
        _SlidingPowerupTimer         = playerData:get_field("_SlidingPowerupTimer"),
        isEquipSkill091              = playerBase:call("isEquipSkill091()"),
        _DieCount                    = playerData:get_field("_DieCount"),
        _CounterattackPowerupTimer   = playerData:get_field("_CounterattackPowerupTimer"),
        _DisasterTurnPowerUpTimer    = playerData:get_field("_DisasterTurnPowerUpTimer"),
        _FightingSpiritTimer         = playerData:get_field("_FightingSpiritTimer"),
        _EquipSkill208_AtkUpTimer    = playerData:get_field("_EquipSkill208_AtkUpTimer"),
        _EquipSkill216_BottleUpTimer = player:get_field("_EquipSkill216_BottleUpTimer"),
        isHaveSkillGuts              = PlayerInfo:get_field("isHaveSkillGuts"),
        _EquipSkill222_Timer         = playerData:get_field("_EquipSkill222_Timer"),
        _EquipSkill223Accumulator    = playerData:get_field("_EquipSkill223Accumulator"),
        isHateTarget                 = player:call("isHateTarget()"),
        _IsEquipSkill226Enable       = player:get_field("_IsEquipSkill226Enable"),
        _EquipSkill227State          = playerData:get_field("_EquipSkill227State"),
        get_IsEnableEquipSkill225    = player:call("get_IsEnableEquipSkill225()"),
        _EquipSkill229UseUpFlg       = player:get_field("_EquipSkill229UseUpFlg"),
        isActiveEquipSkill230        = player:call("isActiveEquipSkill230()"),
        _EquipSkill231_WireNumTimer  = playerData:get_field("_EquipSkill231_WireNumTimer"),
        _EquipSkill231_WpOffTimer    = playerData:get_field("_EquipSkill231_WpOffTimer"),

        isHaveKitchenGuts            = PlayerInfo:get_field("isHaveKitchenGuts"),
        _KitchenSkill027Timer        = playerData:get_field("_KitchenSkill027Timer"),
        _HornMusicDamageReduce       = playerData:get_field("_HornMusicDamageReduce"),
        _KitchenSkill048_Damage      = playerData:get_field("_KitchenSkill048_Damage")
    }
end

local function getSkillData()
    local Ed = { EquipSkill = {} }
    for i = 1, 146 do
        Ed.EquipSkill[i] = getPlayerSkill():call("getSkillData", i)
    end
    return Ed
end
local function getKitchenSkillData()
    local Kd = { KitchenSkill = {} }
    for i = 1, 56 do
        Kd.KitchenSkill[i] = getPlayerSkill():call("getKitchenSkillData", i)
    end
    return Kd
end

local function getChatManager()
    return sdk.get_managed_singleton("snow.gui.ChatManager")
end

local getGuidByName = sdk.find_type_definition("via.gui.message"):get_method("getGuidByName")
local message       = sdk.find_type_definition("via.gui.message"):get_method("get(System.Guid)")
local function getMessageByName(Name)
    local Guid = getGuidByName:call(nil, Name)
    return message:call(nil, Guid)
end

local getEquipSkillName            = sdk.find_type_definition("snow.data.DataShortcut"):get_method("getName(snow.data.DataDef.PlEquipSkillId)")
local getKitchenSkillName          = sdk.find_type_definition("snow.data.DataShortcut"):get_method("getName(snow.data.DataDef.PlKitchenSkillId)")
local GUI_COMMON_MEAL_SKILL_NOTICE = sdk.find_type_definition("snow.gui.COMMON"):get_field("GUI_COMMON_MEAL_SKILL_NOTICE"):get_data(nil)
local function AddChatInfomation(type, skillID, isSkillActive)
    local getName
    if type == 1 then
        getName = getEquipSkillName
    elseif type == 2 then
        getName = getKitchenSkillName
    end
    if isSkillActive then
        ChatLog = getMessageByName("ChatLog_Pl_Skill_01")
    elseif not isSkillActive then
        ChatLog = getMessageByName("ChatLog_Pl_Skill_02")
    end
    getChatManager():call("reqAddChatInfomation", string.gsub(ChatLog, "{0}", getName(nil, skillID)), GUI_COMMON_MEAL_SKILL_NOTICE)
end

sdk.hook(sdk.find_type_definition("snow.player.PlayerManager"):get_method("update"),
    function(args)
        local playerManager = getPlayerManager()
        if not playerManager or not playerManager:call("get_RefItemParameter()") then
            if not Reset then Pl = init() end
            return
        end

        local playerID = getMasterPlayerID()
        if not playerID or playerID > 4 then
            if not Reset then Pl = init() end
            return
        end

        local player = getPlayerListPrivate()
        if not player or not player:get_type_definition():is_a("snow.player.PlayerQuestBase") then
            if not Reset then Pl = init() end
            return
        end

        local playerData      = getPlayerData()
        local playerBase      = getPlayer()
        local playerSkillList = getPlayerSkill()
        if not playerData or not playerBase or not playerSkillList then
            if not Reset then Pl = init() end
            return
        end

        if not Pl then Pl = init() end
        Ed = getSkillData()
        Kd = getKitchenSkillData()
        St = getState()

        Reset = false

        if Ed.EquipSkill[2] then
            if not Pl.EquipSkill_001[1] and St._ChallengeTimer == Pl.EquipSkill_001[2] then
                Pl.EquipSkill_001[1] = true
                AddChatInfomation(1, 2, Pl.EquipSkill_001[1])
            elseif Pl.EquipSkill_001[1] and St._ChallengeTimer == 0 then
                Pl.EquipSkill_001[1] = false
                AddChatInfomation(1, 2, Pl.EquipSkill_001[1])
            end
        end
        if Ed.EquipSkill[3] then
            if not Pl.EquipSkill_002 and St.playerHealth == St.playerMaxHealth then
                Pl.EquipSkill_002 = true
                AddChatInfomation(1, 3, Pl.EquipSkill_002)
            elseif Pl.EquipSkill_002 and St.playerHealth < St.playerMaxHealth then
                Pl.EquipSkill_002 = false
                AddChatInfomation(1, 3, Pl.EquipSkill_002)
            end
        end
        if Ed.EquipSkill[4] then
            if not Pl.EquipSkill_003 then
                if St.get_IsEnableEquipSkill225 or St.playerRedHealth > 0 then
                    Pl.EquipSkill_003 = true
                    AddChatInfomation(1, 4, Pl.EquipSkill_003)
                end
            elseif Pl.EquipSkill_003 and not St.get_IsEnableEquipSkill225 and St.playerHealth == St.playerRawRedHealth and St.playerRedHealth == 0 then
                Pl.EquipSkill_003 = false
                AddChatInfomation(1, 4, Pl.EquipSkill_003)
            end
        end
        if Ed.EquipSkill[5] then
            if not Pl.EquipSkill_004 and St.isDebuffState then
                Pl.EquipSkill_004 = true
                AddChatInfomation(1, 5, Pl.EquipSkill_004)
            elseif Pl.EquipSkill_004 and not St.isDebuffState then
                Pl.EquipSkill_004 = false
                AddChatInfomation(1, 5, Pl.EquipSkill_004)
            end
        end
        if Ed.EquipSkill[9] then
            if not Pl.EquipSkill_008 and St._PowerFreedomTimer == Pl.EquipSkill_001[2] then
                Pl.EquipSkill_008 = true
                AddChatInfomation(1, 9, Pl.EquipSkill_008)
            elseif Pl.EquipSkill_008 and St._PowerFreedomTimer == 0 then
                Pl.EquipSkill_008 = false
                AddChatInfomation(1, 9, Pl.EquipSkill_008)
            end
        end
        if Ed.EquipSkill[10] then
            if not Pl.EquipSkill_009[2] and St._WholeBodyTimer > Pl.EquipSkill_009[4] then
                Pl.EquipSkill_009[2] = true
            end
            if not Pl.EquipSkill_009[1] and Pl.EquipSkill_009[2] and St.playerStamina == St.playerMaxStamina and St._WholeBodyTimer == 0 then
                Pl.EquipSkill_009[1] = true
                AddChatInfomation(1, 10, Pl.EquipSkill_009[1])
            elseif Pl.EquipSkill_009[1] and Pl.EquipSkill_009[3] and St.playerStamina < St.playerMaxStamina and St._WholeBodyTimer == 0 then
                Pl.EquipSkill_009[1] = false
                AddChatInfomation(1, 10, Pl.EquipSkill_009[1])
                Pl.EquipSkill_009[3] = false
            elseif Pl.EquipSkill_009[1] and not Pl.EquipSkill_009[3] and St.playerStamina < St.playerMaxStamina and St._WholeBodyTimer == 0 then
                Pl.EquipSkill_009[3] = true
            end
        end
        if Ed.EquipSkill[37] then
            if St._EquipSkill_036_Timer == Pl.EquipSkill_036[2] then
                Pl.EquipSkill_036[1] = true
                AddChatInfomation(1, 37, Pl.EquipSkill_036[1])
            elseif Pl.EquipSkill_036[1] and St._EquipSkill_036_Timer == 0 then
                Pl.EquipSkill_036[1] = false
                AddChatInfomation(1, 37, Pl.EquipSkill_036[1])
            end
        end
        if Ed.EquipSkill[43] then
            if not Pl.EquipSkill_042[1] and St._SlidingPowerupTimer == Pl.EquipSkill_042[2] then
                Pl.EquipSkill_042[1] = true
                AddChatInfomation(1, 43, Pl.EquipSkill_042[1])
            elseif Pl.EquipSkill_042[1] and St._SlidingPowerupTimer == 0 then
                Pl.EquipSkill_042[1] = false
                AddChatInfomation(1, 43, Pl.EquipSkill_042[1])
            end
        end
        if Ed.EquipSkill[91] then
            if not Pl.EquipSkill_090[1] and not Pl.KitchenSkill_002[1] and St.playerHealth <= St.playerMaxHealth * Pl.EquipSkill_090[2] then
                Pl.EquipSkill_090[1] = true
                AddChatInfomation(1, 91, Pl.EquipSkill_090[1])
            elseif Pl.EquipSkill_090[1] and St.playerHealth > St.playerMaxHealth * Pl.EquipSkill_090[2] then
                Pl.EquipSkill_090[1] = false
                AddChatInfomation(1, 91, Pl.EquipSkill_090[1])
            end
        end
        if St.isEquipSkill091 then
            if Ed.EquipSkill[92] then
                if St._DieCount - Pl.EquipSkill_091[2] > 0 or (St._DieCount > 0 and not Pl.EquipSkill_091[1]) then
                    Pl.EquipSkill_091[2] = St._DieCount
                    Pl.EquipSkill_091[1] = true
                    AddChatInfomation(1, 92, Pl.EquipSkill_091[1])
                elseif Pl.EquipSkill_091[1] and St._DieCount - Pl.EquipSkill_091[2] < 0 then
                    Pl.EquipSkill_091[1] = false
                    AddChatInfomation(1, 92, Pl.EquipSkill_091[1])
                end
            elseif not Ed.EquipSkill[92] and Pl.EquipSkill_091[1] then
                Pl.EquipSkill_091[1] = false
                AddChatInfomation(1, 92, Pl.EquipSkill_091[1])
            end
        end
        if Ed.EquipSkill[103] then
            if not Pl.EquipSkill_102[1] and St.playerHealth <= St.playerMaxHealth * Pl.EquipSkill_102[2][Ed.EquipSkill[103]:get_field("SkillLv")] then
                Pl.EquipSkill_102[1] = true
                AddChatInfomation(1, 103, Pl.EquipSkill_102[1])
            elseif Pl.EquipSkill_102[1] and St.playerHealth > St.playerMaxHealth * Pl.EquipSkill_102[2][Ed.EquipSkill[103]:get_field("SkillLv")] then
                Pl.EquipSkill_102[1] = false
                AddChatInfomation(1, 103, Pl.EquipSkill_102[1])
            end
        end
        if Ed.EquipSkill[106] then
            if St._CounterattackPowerupTimer == Pl.EquipSkill_105[2] then
                Pl.EquipSkill_105[1] = true
                AddChatInfomation(1, 106, Pl.EquipSkill_105[1])
            elseif Pl.EquipSkill_105[1] and St._CounterattackPowerupTimer == 0 then
                Pl.EquipSkill_105[1] = false
                AddChatInfomation(1, 106, Pl.EquipSkill_105[1])
            end
        end
        if Ed.EquipSkill[116] then
            if not Pl.EquipSkill_204[1] and St._DisasterTurnPowerUpTimer == Pl.EquipSkill_204[2] then
                Pl.EquipSkill_204[1] = true
            elseif Pl.EquipSkill_204[1] and St._DisasterTurnPowerUpTimer == 0 then
                Pl.EquipSkill_204[1] = false
                AddChatInfomation(1, 116, Pl.EquipSkill_204[1])
            end
        end
        if Ed.EquipSkill[118] then
            if not Pl.EquipSkill_206[1] and St._FightingSpiritTimer == Pl.EquipSkill_206[2] then
                Pl.EquipSkill_206[1] = true
                AddChatInfomation(1, 118, Pl.EquipSkill_206[1])
            elseif Pl.EquipSkill_206[1] and St._FightingSpiritTimer == 0 then
                Pl.EquipSkill_206[1] = false
                AddChatInfomation(1, 118, Pl.EquipSkill_206[1])
            end
        end
        if Ed.EquipSkill[120] then
            if St._EquipSkill208_AtkUpTimer == Pl.EquipSkill_208[2][Ed.EquipSkill[120]:get_field("SkillLv")] then
                Pl.EquipSkill_208[1] = true
            elseif Pl.EquipSkill_208[1] and St._EquipSkill208_AtkUpTimer == 0 then
                Pl.EquipSkill_208[1] = false
                AddChatInfomation(1, 120, Pl.EquipSkill_208[1])
            end
        end
        if Ed.EquipSkill[128] then
            if St._EquipSkill216_BottleUpTimer == Pl.EquipSkill_215[2][Ed.EquipSkill[128]:get_field("SkillLv")] then
                Pl.EquipSkill_215[1] = true
            elseif Pl.EquipSkill_215[1] and St._EquipSkill216_BottleUpTimer == 0 then
                Pl.EquipSkill_215[1] = false
                AddChatInfomation(1, 128, Pl.EquipSkill_215[1])
            end
        end
        if Ed.EquipSkill[132] and not Pl.EquipSkill_220 and St.isHaveSkillGuts then
            Pl.EquipSkill_220 = true
        elseif not Ed.EquipSkill[132] and Pl.EquipSkill_220 and not St.isHaveSkillGuts then
            AddChatInfomation(1, 132, Pl.EquipSkill_220)
            Pl.EquipSkill_220 = false
        end
        if Ed.EquipSkill[134] then
            if St._EquipSkill222_Timer == Pl.EquipSkill_221[2][Ed.EquipSkill[134]:get_field("SkillLv")] then
                Pl.EquipSkill_221[1] = true
            elseif Pl.EquipSkill_221[1] and St._EquipSkill222_Timer == 0 then
                Pl.EquipSkill_221[1] = false
                AddChatInfomation(1, 134, Pl.EquipSkill_221[1])
            end
        end
        if Ed.EquipSkill[135] then
            if not Pl.EquipSkill_222[1] and St._EquipSkill223Accumulator == Pl.EquipSkill_222[3] then
                Pl.EquipSkill_222[1] = true
            end
        end
        if Ed.EquipSkill[121] then
            if not Pl.EquipSkill_224 and St.isHateTarget then
                Pl.EquipSkill_224 = true
            elseif Pl.EquipSkill_224 and not St.isHateTarget then
                Pl.EquipSkill_224 = false
                AddChatInfomation(1, 121, Pl.EquipSkill_224)
            end
        end
        if Ed.EquipSkill[138] then
            if not Pl.EquipSkill_225 and St._IsEquipSkill226Enable then
                Pl.EquipSkill_225 = true
                AddChatInfomation(1, 138, Pl.EquipSkill_225)
            elseif Pl.EquipSkill_225 and not St._IsEquipSkill226Enable then
                Pl.EquipSkill_225 = false
                AddChatInfomation(1, 138, Pl.EquipSkill_225)
            end
        end
        if Ed.EquipSkill[139] then
            if not Pl.EquipSkill_226 and St._EquipSkill227State ~= 0 then
                Pl.EquipSkill_226 = true
                AddChatInfomation(1, 139, Pl.EquipSkill_226)
            elseif Pl.EquipSkill_226 and St._EquipSkill227State == 0 then
                Pl.EquipSkill_226 = false
                AddChatInfomation(1, 139, Pl.EquipSkill_226)
            end
        end
        if Ed.EquipSkill[141] then
            if not Pl.EquipSkill_230 and St._EquipSkill229UseUpFlg then
                Pl.EquipSkill_230 = true
                AddChatInfomation(1, 141, Pl.EquipSkill_230)
            elseif Pl.EquipSkill_230 and not St._EquipSkill229UseUpFlg then
                Pl.EquipSkill_230 = false
                AddChatInfomation(1, 141, Pl.EquipSkill_230)
            end
        end
        if Ed.EquipSkill[142] then
            if not Pl.EquipSkill_231 and St.isActiveEquipSkill230 then
                Pl.EquipSkill_231 = true
            elseif Pl.EquipSkill_231 and not St.isActiveEquipSkill230 then
                Pl.EquipSkill_231 = false
                AddChatInfomation(1, 142, Pl.EquipSkill_231)
            end
        end
        if Ed.EquipSkill[143] then
            if not Pl.EquipSkill_232[1] and St._EquipSkill231_WireNumTimer == Pl.EquipSkill_232[2][Ed.EquipSkill[143]:get_field("SkillLv")] then
                Pl.EquipSkill_232[1] = true
            elseif Pl.EquipSkill_232[1] and St._EquipSkill231_WpOffTimer == 0 then
                Pl.EquipSkill_232[1] = false
                AddChatInfomation(1, 143, Pl.EquipSkill_232[1])
            end
        end


        if Kd.KitchenSkill[3] then
            if not Pl.KitchenSkill_002[1] and St.playerHealth <= Pl.KitchenSkill_002[2][Kd.KitchenSkill[3]:get_field("_SkillLv")] then
                Pl.KitchenSkill_002[1] = true
                AddChatInfomation(2, 3, Pl.KitchenSkill_002[1])
            elseif Pl.KitchenSkill_002[1] and St.playerHealth > Pl.KitchenSkill_002[2][Kd.KitchenSkill[3]:get_field("_SkillLv")] then
                Pl.KitchenSkill_002[1] = false
                AddChatInfomation(2, 3, Pl.KitchenSkill_002[1])
            end
        end
        if Kd.KitchenSkill[25] and not Pl.KitchenSkill_024 and St.isHaveKitchenGuts then
            Pl.KitchenSkill_024 = true
        elseif not Kd.KitchenSkill[25] and Pl.KitchenSkill_024 and not St.isHaveKitchenGuts then
            AddChatInfomation(2, 25, Pl.KitchenSkill_024)
            Pl.KitchenSkill_024 = false
        end
        if Kd.KitchenSkill[28] then
            if not Pl.KitchenSkill_027[1] and St._KitchenSkill027Timer == Pl.KitchenSkill_027[2][Kd.KitchenSkill[28]:get_field("_SkillLv")] then
                Pl.KitchenSkill_027[1] = true
            elseif Pl.KitchenSkill_027[1] and St._KitchenSkill027Timer == 0 then
                Pl.KitchenSkill_027[1] = false
                AddChatInfomation(2, 28, Pl.KitchenSkill_027[1])
            end
        end
        if Kd.KitchenSkill[49] then
            if not Pl.KitchenSkill_048[1] and St._KitchenSkill048_Damage >= Pl.KitchenSkill_048[2][Kd.KitchenSkill[49]:get_field("_SkillLv")] then
                Pl.KitchenSkill_048[1] = true
            end
        end


    end)


local preDamage
local postDamage
local isMasterPlayer
local isReduce

local function xRoundOff(num, dgt)
    local round = 10 ^ (-1 * dgt)
    return math.floor((num + 5 * (10 ^ (dgt - 1))) * round) / round
end

sdk.hook(sdk.find_type_definition("snow.player.PlayerQuestBase"):get_method("checkDamage_calcDamage(System.Single, System.Single, snow.player.PlayerDamageInfo, System.Boolean)"),
    function(args)
        isMasterPlayer = sdk.to_managed_object(args[2]):call("isMasterPlayer")

        if not isMasterPlayer then return end

        preDamage = xRoundOff(sdk.to_float(args[3]), -5)

        if Pl.EquipSkill_222[1] and St._EquipSkill223Accumulator == 0 then
            preDamage = xRoundOff(preDamage * Pl.EquipSkill_222[2][Ed.EquipSkill[135]:get_field("SkillLv")], -5)
            Pl.EquipSkill_222[1] = false
        end
    end)
sdk.hook(sdk.find_type_definition("snow.player.PlayerQuestBase"):get_method("damageVital(System.Single, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean)"),
    function(args)
        postDamage = nil
        isReduce = false

        if not preDamage then return end

        postDamage = xRoundOff(sdk.to_float(args[3]) * -1, -5)

        if sdk.to_float(args[10]) < 0 then
            if Pl.KitchenSkill_048[1] then
                preDamage = preDamage * Pl.KitchenSkill_048[3][Kd.KitchenSkill[49]:get_field("_SkillLv")]
                Pl.KitchenSkill_048[1] = false
            end
        end
    end,
    function(retval)
        if not isMasterPlayer or not postDamage or not preDamage then return retval end

        if preDamage ~= postDamage then isReduce = true end

        preDamage = nil
    end)
sdk.hook(sdk.find_type_definition("via.wwise.WwiseContainer"):get_method("trigger(System.UInt32, via.GameObject)"),
    function(args)
        if isReduce and sdk.to_int64(args[2]) == 0x2acf664e then
            getChatManager():call("reqAddChatInfomation", getMessageByName("ChatLog_Co_Skill_01"), GUI_COMMON_MEAL_SKILL_NOTICE)
        end
    end)
