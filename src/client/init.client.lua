-- create task
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local timeLimit = 20
local highscore = 0

local gui = player.PlayerGui:WaitForChild("ScreenGui")
local frame = gui.Frame
local buttons = frame.Buttons
local info = frame.InfoFrame
local image = frame.Image
local result = frame.Result

local junkList = {

	{
		Type = "recycle",
		Items = {
			{ Name = "Water Bottles", ImageID = "rbxassetid://13199324229" },
			{ Name = "Aluminum Cans", ImageID = "rbxassetid://13199415469" },
			{ Name = "Cardboard Box", ImageID = "rbxassetid://13199429806" },
			{ Name = "Aluminum Foil", ImageID = "rbxassetid://13307458136" },
			{ Name = "Bottle Caps", ImageID = "rbxassetid://13307467556" },
			{ Name = "Paper Bags", ImageID = "rbxassetid://13309373188" },
			{ Name = "Newspapers", ImageID = "rbxassetid://13309378456" },
			{ Name = "Sticky Notes", ImageID = "rbxassetid://13309384826" },

		}
	},

	{
		Type = "landfill",
		Items = {
			{ Name = "Old Leather Boot", ImageID = "rbxassetid://13299593139" },
			{ Name = "Sponges", ImageID = "rbxassetid://13307526133" },
			{ Name = "Styrofoam", ImageID = "rbxassetid://13307273993" },
			{ Name = "Broken Plates", ImageID = "rbxassetid://13307483392" },
			{ Name = "Incandescent Bulb", ImageID = "rbxassetid://13307253295" },
			{ Name = "Candy Wrappers", ImageID = "rbxassetid://13309272135" },
			{ Name = "Dental Floss", ImageID = "rbxassetid://13309286087" },
			{ Name = "Balloons", ImageID = "rbxassetid://13309318469" },
			{ Name = "Pens", ImageID = "rbxassetid://13309348647" },
			{ Name = "Rubber Bands", ImageID = "rbxassetid://13309356339" },
		}
	},

	{
		Type = "compost",
		Items = {
			{ Name = "Banana Peel", ImageID = "rbxassetid://13307284861" },
			{ Name = "Used Tea Bag", ImageID = "rbxassetid://13307434927" },
			{ Name = "Apple Core", ImageID = "rbxassetid://13307441251" },
			{ Name = "Moldy Bread", ImageID = "rbxassetid://13307452965" },
			{ Name = "Food Scraps", ImageID = "rbxassetid://13307514472" },
			{ Name = "Cheese", ImageID = "rbxassetid://13309423669" },
			{ Name = "Eggshells", ImageID = "rbxassetid://13309434391" },
			{ Name = "Paper Napkins", ImageID = "rbxassetid://13309471088" },
			{ Name = "Toothpicks", ImageID = "rbxassetid://13309508617" },
		}
	},

}

local recycle = buttons.recycleButton
local trash = buttons.trashButton
local compost = buttons.compostButton

local currentType
local currentItem
local points = 0

local function getResult(type)
	buttons.Visible = false
	if type == currentType then
		points += 1
		result.Status.Icon.Image = "rbxassetid://6023426945"
		result.Status.Icon.ImageColor3 = Color3.fromRGB(0, 255, 0)
		result.Status.PointLabel.Text = "+1 POINT"
		result.Status.PointLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
		result.ItemLabel.Text = "<b>ITEM: </b>" .. string.upper(currentItem.Name)
		result.TypeLabel.Text = "<b>TYPE: </b>" .. string.upper(currentType)
		result.Visible = true
	else
		result.Status.Icon.Image = "rbxassetid://6031094677"
		result.Status.Icon.ImageColor3 = Color3.fromRGB(255, 0, 0)
		result.Status.PointLabel.Text = "0 POINTS"
		result.Status.PointLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
		result.ItemLabel.Text = "<b>ITEM: </b>" .. string.upper(currentItem.Name)
		result.TypeLabel.Text = "<b>TYPE: </b>" .. string.upper(currentType)
		result.Visible = true
	end
	info.Score.TextLabel.Text = points
end

local function pickItem()
	local randomCategory = junkList[math.random(1,#junkList)]
	currentType = randomCategory.Type
	currentItem = randomCategory.Items[math.random(1,#randomCategory.Items)]
	image.Image = currentItem.ImageID
	image.Caption.ItemName.Text = currentItem.Name
	result.Visible = false
	frame.End.Visible = false
	buttons.Visible = true
end

local function reset()
	info.Time.TextLabel.Text = "0s"
	info.Score.TextLabel.Text = "0"
	points = 0
	task.spawn(function()
		for i = timeLimit, 0, -1 do
			info.Time.TextLabel.Text = i .. "s"
			if i == 0 then
				if points > highscore then
					highscore = points
				end
				frame.End.Status.Score.Score.Text = points
				frame.End.Status.HighScore.HighScore.Text = highscore
				frame.End.Visible = true
				buttons.Visible = false
				break
			end
			task.wait(1)
		end
	end)
	pickItem()
end

reset()

frame.End.PlayButton.MouseButton1Click:Connect(reset) -- USER INPUT
result.NextButton.MouseButton1Click:Connect(pickItem) -- USER INPUT

recycle.MouseButton1Click:Connect(function() -- USER INPUT
	getResult("recycle")
end)

trash.MouseButton1Click:Connect(function() -- USER INPUT
	getResult("landfill")
end)

compost.MouseButton1Click:Connect(function() -- USER INPUT
	getResult("compost")
end)