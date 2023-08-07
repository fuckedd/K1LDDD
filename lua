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

-- Variable to track auto-run state
local isAutoRunning = false

-- Function to handle player chat
local function onChatted(message)
    local prefixAuto = ".infv auto true"
    local prefixStop = ".infv auto false"

    if message:sub(1, #prefixAuto) == prefixAuto then
        -- Start auto-run
        if not isAutoRunning then
            isAutoRunning = true
            while isAutoRunning do
                -- Infinite loop to keep sending votes with the desired parameters
                local args = {
                    [1] = math.huge,
                    [2] = 0
                }
                game:GetService("ReplicatedStorage").PlayerVotes:FireServer(unpack(args))
                wait(1) -- Wait 1 second before sending the next vote
            end
        end
    elseif message:sub(1, #prefixStop) == prefixStop then
        -- Stop auto-run
        isAutoRunning = false
    end
end

-- Connect the onChatted function to player chat event
game:GetService("Players").LocalPlayer.Chatted:Connect(onChatted)


