-- Reload UI
RageTracker_OnEvent = function(frame, event, arg1)
  local scalex, scaley, unlocked
  RageTrackerDBPC = RageTrackerDBPC or {}
  scalex = RageTrackerDBPC["scalex"] or 1.0
  scaley = RageTrackerDBPC["scaley"] or 1.0
  unlocked = RageTrackerDBPC["unlocked"] or false
  frame:SetHeight(30*scaley)
  frame:SetWidth(220*scalex)
  frame:EnableMouse(unlocked)
end
RageTrackerFill_OnEvent = function(frame, event, arg1)
  if event == "UNIT_RAGE" and UnitIsUnit(arg1,"player") then
    frame:SetWidth(UnitMana("player")*(RageTrackerFrame:GetWidth())/100+1)
    RageTrackerFrame_TextFrame_Text:SetText("Rage: "..UnitMana("player"))
  end 
end
SlashCmdList["RAGETRACKER_COMMAND"] = function(Flag)
	local flag = string.lower(Flag)
  local scalex, scaley, unlocked
	if string.sub(flag,1,6) == "scalex" then
    scalex = tonumber(string.sub(flag,8))
		RageTrackerFrame:SetWidth(220 * scalex)
    RageTrackerDBPC["scalex"] = scalex
	end
	if string.sub(flag,1,6) == "scaley" then
    scaley = tonumber(string.sub(flag,8))
		RageTrackerFrame:SetHeight(30 * scaley)
    RageTrackerDBPC["scaley"] = scaley
	end
  if string.sub(flag,1,6) == "lock" then
    if RageTrackerFrame:IsMouseEnabled() then
      unlocked = false
      RageTrackerDBPC["unlocked"] = unlocked
      RageTrackerFrame:EnableMouse(unlocked)
      local message = "RageTracker locked, /rt lock again to unlock"
      if print then print(message) else Print(message) end
    else
      unlocked = true
      RageTrackerDBPC["unlocked"] = unlocked
      RageTrackerFrame:EnableMouse(unlocked)
      local message = "RageTracker unlocked, Click > drag"
      if print then print(message) else Print(message) end
    end
  end
end
SLASH_RAGETRACKER_COMMAND1 = "/rt";
SLASH_RAGETRACKER_COMMAND2 = "/ragetracker"