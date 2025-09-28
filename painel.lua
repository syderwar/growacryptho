-- Painel de Controle Melhorado
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PainelControle"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 400, 0, 250)
main.Position = UDim2.new(0.3,0,0.3,0)
main.BackgroundColor3 = Color3.fromRGB(40,40,40)
main.Active = true
main.Draggable = true

-- Barra de título
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -80, 0, 30)
title.Position = UDim2.new(0,10,0,0)
title.Text = "Painel de Controle"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left

-- Botão fechar
local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0,30,0,25)
close.Position = UDim2.new(1,-35,0,3)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(200,50,50)
close.TextColor3 = Color3.new(1,1,1)

-- Botão minimizar
local minimize = Instance.new("TextButton", main)
minimize.Size = UDim2.new(0,30,0,25)
minimize.Position = UDim2.new(1,-70,0,3)
minimize.Text = "_"
minimize.BackgroundColor3 = Color3.fromRGB(50,150,200)
minimize.TextColor3 = Color3.new(1,1,1)

-- Conteúdo
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1,-10,1,-40)
content.Position = UDim2.new(0,5,0,35)
content.BackgroundColor3 = Color3.fromRGB(60,60,60)

-- Botões Auto
local autoCollect = Instance.new("TextButton", content)
autoCollect.Size = UDim2.new(0,180,0,40)
autoCollect.Position = UDim2.new(0,10,0,10)
autoCollect.Text = "Auto Coleta: OFF"
autoCollect.BackgroundColor3 = Color3.fromRGB(200,0,0)
autoCollect.TextColor3 = Color3.new(1,1,1)

local autoSell = Instance.new("TextButton", content)
autoSell.Size = UDim2.new(0,180,0,40)
autoSell.Position = UDim2.new(0,10,0,60)
autoSell.Text = "Auto Venda: OFF"
autoSell.BackgroundColor3 = Color3.fromRGB(200,0,0)
autoSell.TextColor3 = Color3.new(1,1,1)

local autoBuy = Instance.new("TextButton", content)
autoBuy.Size = UDim2.new(0,180,0,40)
autoBuy.Position = UDim2.new(0,10,0,110)
autoBuy.Text = "Auto Comprar: OFF"
autoBuy.BackgroundColor3 = Color3.fromRGB(200,0,0)
autoBuy.TextColor3 = Color3.new(1,1,1)

-- Funções
close.MouseButton1Click:Connect(function()
    main.Visible = false
end)

local minimized = false
minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    content.Visible = not minimized
end)

local collectOn, sellOn, buyOn = false,false,false

autoCollect.MouseButton1Click:Connect(function()
    collectOn = not collectOn
    autoCollect.Text = "Auto Coleta: " .. (collectOn and "ON" or "OFF")
    autoCollect.BackgroundColor3 = collectOn and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
end)

autoSell.MouseButton1Click:Connect(function()
    sellOn = not sellOn
    autoSell.Text = "Auto Venda: " .. (sellOn and "ON" or "OFF")
    autoSell.BackgroundColor3 = sellOn and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
end)

autoBuy.MouseButton1Click:Connect(function()
    buyOn = not buyOn
    autoBuy.Text = "Auto Comprar: " .. (buyOn and "ON" or "OFF")
    autoBuy.BackgroundColor3 = buyOn and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
end)

-- Loop de simulação
task.spawn(function()
    while true do
        if collectOn then print("Coletando...") end
        if sellOn then print("Vendendo...") end
        if buyOn then print("Comprando...") end
        task.wait(3)
    end
end)
