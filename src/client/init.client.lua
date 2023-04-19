-- create task
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = player.PlayerGui:WaitForChild("ScreenGui")
local frame = gui.Frame

local junkList = {
    
    recycle = {
        { Name = "Water Bottle", ImageID = "rbxassetid://" },
        { Name = "Soda Can", ImageID = "rbxassetid://" },
        { Name = "Cardboard Box", ImageID = "rbxassetid://" },
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
    },

}

local recycle = frame.recycleButton
local trash = frame.trashButton
local compost = frame.compostButton