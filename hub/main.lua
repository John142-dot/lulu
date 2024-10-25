if not getgenv().Activate or not getgenv().Activate.simplescripts then
    print("Activate.simplescripts is not activated. Kicking player.")
    game.Players.LocalPlayer:Kick("Activate.simplescripts is not activated.")
    return
else
    print("Activate.simplescripts is activated!")
end

repeat
    wait()
until game:IsLoaded()

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/John142-dot/orionlib/refs/heads/main/mobileshlex.lua'))()

OrionLib:MakeNotification({
    Name = "Thanks for Completing it!!",
    Content = "Setup completed",
    Image = "rbxassetid://4483345998",
    Time = 0.3
})

local Window = OrionLib:MakeWindow({
    Name = "L>U>L>U HUB", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "OrionTest"
})

local Tab = Window:MakeTab({
    Name = "Fe Scripts",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Fe Scripts"
})

local flying = false
local speed = 50
local bodyVelocity

local function fly()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    if not flying then
        flying = true
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVelocity.Parent = character.PrimaryPart

        local function updateFly()
            while flying do
                local camera = workspace.CurrentCamera
                bodyVelocity.Velocity = (camera.CFrame.LookVector * speed) + Vector3.new(0, speed, 0)
                wait()
            end
        end

        updateFly()

        local mouse = player:GetMouse()
        mouse.Move:Connect(function()
            if flying then
                local camera = workspace.CurrentCamera
                local direction = (mouse.Hit.Position - camera.CFrame.Position).unit
                bodyVelocity.Velocity = (direction * speed) + Vector3.new(0, speed, 0)
            end
        end)

        local UserInputService = game:GetService("UserInputService")
        local touchInput = nil

        UserInputService.TouchStarted:Connect(function(touch, gameProcessedEvent)
            if not gameProcessedEvent and flying then
                touchInput = touch
                local touchMoveConnection
                touchMoveConnection = UserInputService.TouchMoved:Connect(function(touchMove)
                    if touchInput and touchInput == touchMove then
                        local camera = workspace.CurrentCamera
                        local direction = (touchMove.Position - touchInput.Position).unit
                        bodyVelocity.Velocity = (direction * speed) + Vector3.new(0, speed, 0)
                    end
                end)

                UserInputService.TouchEnded:Connect(function(touchEnded)
                    if touchInput and touchInput == touchEnded then
                        touchInput = nil
                        touchMoveConnection:Disconnect()
                    end
                end)
            end
        end)
    end
end

local function stopFly()
    flying = false
    if bodyVelocity then
        bodyVelocity:Destroy()
    end
end

Tab:AddButton({
    Name = "High JumpPower",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 280
    end    
})

Tab:AddButton({
    Name = "Un High JumpPower",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end    
})

Tab:AddButton({
    Name = "Speed",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 280
    end    
})

Tab:AddButton({
    Name = "Un Speed",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end    
})

Tab:AddButton({
    Name = "Super Low Gravity",
    Callback = function()
        game.Workspace.Gravity = 0
    end    
})

Tab:AddButton({
    Name = "Normal Gravity",
    Callback = function()
        game.Workspace.Gravity = 196.2
    end    
})

Tab:AddButton({
    Name = "Fly",
    Callback = fly    
})

Tab:AddButton({
    Name = "Stop Fly",
    Callback = stopFly    
})

Tab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(state)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        if state then
            local UserInputService = game:GetService("UserInputService")
            UserInputService.JumpRequest:Connect(function()
                humanoid:ChangeState("Jumping")
            end)
        else
            UserInputService.JumpRequest:Disconnect()
        end
    end    
})

Tab:AddButton({
    Name = "Un Infinite Jump",
    Callback = function()
        UserInputService = game:GetService("UserInputService")
        UserInputService.JumpRequest:Disconnect()
    end    
})

Tab:AddButton({
    Name = "Noclip",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local noclip = false

        local function toggleNoclip()
            noclip = not noclip
            while noclip do
                wait()
                for _, v in pairs(character:GetChildren()) do
                    if v:IsA("Part") then
                        v.CanCollide = false
                    end
                end
            end
            for _, v in pairs(character:GetChildren()) do
                if v:IsA("Part") then
                    v.CanCollide = true
                end
            end
        end

        toggleNoclip()
    end    
})

Tab:AddButton({
    Name = "Un Noclip",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        for _, v in pairs(character:GetChildren()) do
            if v:IsA("Part") then
                v.CanCollide = true
            end
        end
    end    
})

Tab:AddButton({
    Name = "Walk on Walls",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/5T7KsEWy", true))()
    end    
})

CreditsTab:AddLabel("Renivy - Creator and Scripter")
CreditsTab:AddLabel("Zonkey9070 - Scripter and URL for Modded Orion")

OrionLib:MakeNotification({
    Name = "Lulu Hub:",
    Content = "Lulu hub has loaded.",
    Image = "rbxassetid://4483345998",
    Time = 5
})
