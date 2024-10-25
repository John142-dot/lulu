-- __________              .__                 ____    __________             __                  _______________________________   
-- \______   \ ____   ____ |__|__  _____.__.  /  _ \   \____    /____   ____ |  | __ ____ ___.__./   __   \   _  \______  \   _  \  
--  |       _// __ \ /    \|  \  \/ <   |  |  >  _ </\   /     //  _ \ /    \|  |/ // __ <   |  |\____    /  /_\  \  /    /  /_\  \ 
--  |    |   \  ___/|   |  \  |\   / \___  | /  <_\ \/  /     /(  <_> )   |  \    <\  ___/\___  |   /    /\  \_/   \/    /\  \_/   \
--  |____|_  /\___  >___|  /__| \_/  / ____| \_____\ \ /_______ \____/|___|  /__|_ \\___  > ____|  /____/  \_____  /____/  \_____  /
--         \/     \/     \/          \/             \/         \/          \/     \/    \/\/                     \/              \/
--                                 _                 _              _____ 
--  ___ _   _ _ __  _ __   ___  _ __| |_   _   _ ___  (_)_ __   /\_/\/__   \
-- / __| | | | '_ \| '_ \ / _ \| '__| __| | | | / __| | | '_ \  \_ _/  / /\/
-- \__ \ |_| | |_) | |_) | (_) | |  | |_  | |_| \__ \ | | | | |  / \  / /   
-- |___/\__,_| .__/| .__/ \___/|_|   \__|  \__,_|___/ |_|_| |_|  \_/  \(_)  
--           |__/  |__/
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

-- Removed flying functionality

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
        end
    end    
})

Tab:AddButton({
    Name = "Un Infinite Jump",
    Callback = function()
        local UserInputService = game:GetService("UserInputService")
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

Tab:AddButton({
    Name = "Teleportation Tool",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/edLCsuos/raw"))()
    end    
})

Tab:AddButton({
    Name = "Executor",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/John142-dot/nameless-admin-v3/main/OMGEXECUYORV3"))()
    end    
})

Tab:AddButton({
    Name = "Crosshair 1",
    Callback = function()
        local d = Drawing.new("Circle")
        d.Color, d.Radius, d.Filled, d.Visible = Color3.new(1, 1, 1), 3, true, false
        game:GetService("RunService").RenderStepped:Connect(function()
            d.Position = workspace.CurrentCamera.ViewportSize / 2
            d.Visible = true
        end)
    end    
})

Tab:AddButton({
    Name = "Crosshair 2",
    Callback = function()
        local d2 = Drawing.new("Circle")
        d2.Radius = 10
        d2.Filled = true
        d2.Visible = true

        local timeElapsed = 0
        local hueSpeed = 0.5

        game:GetService("RunService").RenderStepped:Connect(function(dt)
            timeElapsed = timeElapsed + dt
            local hue = (timeElapsed * hueSpeed) % 1
            d2.Color = Color3.fromHSV(hue, 1, 1)
            d2.Position = workspace.CurrentCamera.ViewportSize / 2
        end)
    end    
})

local function antiSit()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Sit = false
end

local function unAntiSit()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Sit = false
end

local function antiFling()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.PlatformStand = true
end

local function unAntiFling()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.PlatformStand = false
end

Tab:AddButton({
    Name = "Sit",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Sit = true
    end    
})

Tab:AddButton({
    Name = "Un Sit",
    Callback = function()
        unAntiSit()
    end    
})

Tab:AddButton({
    Name = "Anti Sit",
    Callback = function()
        antiSit()
    end    
})

Tab:AddButton({
    Name = "Un Anti Sit",
    Callback = function()
        unAntiSit()
    end    
})

Tab:AddButton({
    Name = "Anti Fling",
    Callback = function()
        antiFling()
    end    
})

Tab:AddButton({
    Name = "Un Anti Fling",
    Callback = function()
        unAntiFling()
    end    
})

CreditsTab:AddSection({
    Name = "Credits"
})

CreditsTab:AddLabel("L>U>L>U HUB Scripts")
CreditsTab:AddLabel("Developed by [RenivyRBLX & Zonkey9070 on yt]")
CreditsTab:AddLabel("Enjoy the scripts!")
CreditsTab:AddLabel("Contact on discord: kylo0912")

OrionLib:Init()repeat
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

-- Removed flying functionality

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
        end
    end    
})

Tab:AddButton({
    Name = "Un Infinite Jump",
    Callback = function()
        local UserInputService = game:GetService("UserInputService")
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

Tab:AddButton({
    Name = "Teleportation Tool",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/edLCsuos/raw"))()
    end    
})

Tab:AddButton({
    Name = "Executor",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/John142-dot/nameless-admin-v3/main/OMGEXECUYORV3"))()
    end    
})

Tab:AddButton({
    Name = "Crosshair 1",
    Callback = function()
        local d = Drawing.new("Circle")
        d.Color, d.Radius, d.Filled, d.Visible = Color3.new(1, 1, 1), 3, true, false
        game:GetService("RunService").RenderStepped:Connect(function()
            d.Position = workspace.CurrentCamera.ViewportSize / 2
            d.Visible = true
        end)
    end    
})

Tab:AddButton({
    Name = "Crosshair 2",
    Callback = function()
        local d2 = Drawing.new("Circle")
        d2.Radius = 10
        d2.Filled = true
        d2.Visible = true

        local timeElapsed = 0
        local hueSpeed = 0.5

        game:GetService("RunService").RenderStepped:Connect(function(dt)
            timeElapsed = timeElapsed + dt
            local hue = (timeElapsed * hueSpeed) % 1
            d2.Color = Color3.fromHSV(hue, 1, 1)
            d2.Position = workspace.CurrentCamera.ViewportSize / 2
        end)
    end    
})

local function antiSit()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Sit = false
end

local function unAntiSit()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Sit = false
end

local function antiFling()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.PlatformStand = true
end

local function unAntiFling()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.PlatformStand = false
end

Tab:AddButton({
    Name = "Sit",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Sit = true
    end    
})

Tab:AddButton({
    Name = "Un Sit",
    Callback = function()
        unAntiSit()
    end    
})

Tab:AddButton({
    Name = "Anti Sit",
    Callback = function()
        antiSit()
    end    
})

Tab:AddButton({
    Name = "Un Anti Sit",
    Callback = function()
        unAntiSit()
    end    
})

Tab:AddButton({
    Name = "Anti Fling",
    Callback = function()
        antiFling()
    end    
})

Tab:AddButton({
    Name = "Un Anti Fling",
    Callback = function()
        unAntiFling()
    end    
})

CreditsTab:AddSection({
    Name = "Credits"
})

CreditsTab:AddLabel("L>U>L>U HUB Scripts")
CreditsTab:AddLabel("Developed by [RenivyRBLX & Zonkey9070 on yt]")
CreditsTab:AddLabel("Enjoy the scripts!")
CreditsTab:AddLabel("Contact on discord | • Zonkey: kylo0912 | • Renivy: rvyocer_83171")

OrionLib:Init()
