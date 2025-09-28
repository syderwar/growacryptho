local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "PainelControle"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 300, 0, 200)
main.Position = UDim2.new(0.35,0,0.35,0)
main.BackgroundColor3 = Color3.fromRGB(40,40,40)
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,30)
title.Text = "Painel de Controle"
title.BackgroundColor3 = Color3.fromRGB(25,25,25)
title.TextColor3 = Color3.new(1,1,1)

local autoCollect = Instance.new("TextButton", main)
autoCollect.Size = UDim2.new(0,120,0,30)
autoCollect.Position = UDim2.new(0,10,0,50)
autoCollect.Text = "Auto Coleta: OFF"
autoCollect.BackgroundColor3 = Color3.fromRGB(200,0,0)

local autoSell = Instance.new("TextButton", main)
autoSell.Size = UDim2.new(0,120,0,30)
autoSell.Position = UDim2.new(0,10,0,90)
autoSell.Text = "Auto Venda: OFF"
autoSell.BackgroundColor3 = Color3.fromRGB(200,0,0)

local autoBuy = Instance.new("TextButton", main)
autoBuy.Size = UDim2.new(0,120,0,30)
autoBuy.Position = UDim2.new(0,10,0,130)
autoBuy.Text = "Auto Comprar: OFF"
autoBuy.BackgroundColor3 = Color3.fromRGB(200,0,0)

-- Funções
local cOn,sOn,bOn=false,false,false
autoCollect.MouseButton1Click:Connect(function()
    cOn=not cOn
    autoCollect.Text="Auto Coleta: "..(cOn and "ON" or "OFF")
    autoCollect.BackgroundColor3=cOn and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
end)
autoSell.MouseButton1Click:Connect(function()
    sOn=not sOn
    autoSell.Text="Auto Venda: "..(sOn and "ON" or "OFF")
    autoSell.BackgroundColor3=sOn and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
end)
autoBuy.MouseButton1Click:Connect(function()
    bOn=not bOn
    autoBuy.Text="Auto Comprar: "..(bOn and "ON" or "OFF")
    autoBuy.BackgroundColor3=bOn and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
end)
