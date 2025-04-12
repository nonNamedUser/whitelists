print("HAIII")

if game:GetService("TextChatService").ChatVersion==Enum.ChatVersion.TextChatService then
	local z=Instance.new("TextChatCommand",game:GetService("TextChatService"))
	z.PrimaryAlias="🤬"
end

local plr=game:GetService("Players"):GetPlayerByUserId(userid)

if plr then
	plr.Chatted:Connect(function(message)
		local m=message:split(" ")
		
		local prefix="🤬 "
		
		if m[1]==prefix.."kick" then
			if m[2] then
				if m[2] == "all" then
					for _, z in game:GetService("Players"):GetPlayers() do
						if m[3] then
							local len=rawlen(m[1])+rawlen(m[2])+3

							local kickmsg=message:sub(len)

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
							local len=rawlen(m[1])+rawlen(m[2])+3
							
							local kickmsg=message:sub(len)
							
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
