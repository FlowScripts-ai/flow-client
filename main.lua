-- Flow Scripts | Main Script
-- This script runs after the user enters the correct key

-- WalkSpeed control (simple example)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Check for Rayfield UI library
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()
end)

if not success then
    warn("Failed to load Rayfield UI.")
    return
end

-- Create a window for WalkSpeed
local MainWindow = Rayfield:CreateWindow({
    Name = "Flow Scripts | Main Menu",
    LoadingTitle = "Loading Features...",
    ConfigurationSaving = { Enabled = false }
})

-- Add WalkSpeed slider
MainWindow:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

-- You can add more features like ESP, Fly, etc. below

-- Notify user the script is loaded
Rayfield:Notify({
    Title = "Flow Scripts Loaded",
    Content = "Enjoy your features!",
    Duration = 5
})
