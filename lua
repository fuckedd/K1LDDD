-- Function to handle player chat
local function onChatted(message)
    local prefix = ".infv"
    if message:sub(1, #prefix) == prefix then
        -- Execute the desired code when ".infv" is typed in the chat
        local args = {
            [1] = math.huge,
            [2] = 0
        }

        game:GetService("ReplicatedStorage").PlayerVotes:FireServer(unpack(args))
    end
end

-- Connect the onChatted function to player chat event
game:GetService("Players").LocalPlayer.Chatted:Connect(onChatted)

-- Print a message to indicate the creator of the code
print("Andrew Tate")
