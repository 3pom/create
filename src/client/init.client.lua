-- create task
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = player.PlayerGui:WaitForChild("ScreenGui")
local frame = gui.Frame
local buttons = frame.Buttons

local junkList = {
    
    recycle = {
        { Name = "Water Bottles", ImageID = "rbxassetid://13199324229" },
        { Name = "Aluminum Cans", ImageID = "rbxassetid://13199415469" },
        { Name = "Cardboard Box", ImageID = "rbxassetid://13199429806" },
    },

    trash = {
        { Name = "Old Leather Boot", ImageID = "rbxassetid://" },
        { Name = "Chips Wrapper", ImageID = "rbxassetid://" },
        { Name = "Styrofoam", ImageID = "rbxassetid://" },
    },

    compost = {
        { Name = "Banana Peel", ImageID = "rbxassetid://" },
        { Name = "Fish Bones", ImageID = "rbxassetid://" },
        { Name = "Apple Core", ImageID = "rbxassetid://" },
        { Name = "Moldy Bread", ImageID = "rbxassetid://" },
    },

}

local recycle = buttons.recycleButton
local trash = buttons.trashButton
local compost = buttons.compostButton

recycle.MouseButton1Click:Connect(function()
    print("recycle")
end)

trash.MouseButton1Click:Connect(function()
    print("trash")
end)

compost.MouseButton1Click:Connect(function()
    print("compost")
end)

local currentItem = "david"\