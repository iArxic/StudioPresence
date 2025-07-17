-- Gui to Lua
-- Version: 3.2

-- Instances:

local Template = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Delete = Instance.new("TextButton")

--Properties:

Template.Name = "Template"
Template.Parent = script.Parent.GUI_Script
Template.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Template.BackgroundTransparency = 1.000
Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
Template.BorderSizePixel = 0
Template.Size = UDim2.new(1, 0, 0.100000001, 0)

Title.Name = "Title"
Title.Parent = Template
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0.300000012, 0, 1, 0)
Title.Font = Enum.Font.SourceSans
Title.Text = "PluginName"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Delete.Name = "Delete"
Delete.Parent = Template
Delete.AnchorPoint = Vector2.new(1, 1)
Delete.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Delete.BackgroundTransparency = 1.000
Delete.BorderColor3 = Color3.fromRGB(0, 0, 0)
Delete.BorderSizePixel = 0
Delete.Position = UDim2.new(1, 0, 1, 0)
Delete.Size = UDim2.new(0.200000003, 0, 1, 0)
Delete.Font = Enum.Font.SourceSans
Delete.Text = "Delete"
Delete.TextColor3 = Color3.fromRGB(255, 0, 0)
Delete.TextScaled = true
Delete.TextSize = 14.000
Delete.TextWrapped = true
