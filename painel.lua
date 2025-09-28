-- Painel de Controle Melhorado
-- Coloque em StarterGui > ScreenGui > LocalScript

local player = game.Players.LocalPlayer

-- Criar GUI principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ControlPanel"
screenGui.Parent = player:WaitForChild("PlayerGui")

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 480, 0, 320)
panel.Position = UDim2.new(0.3, 0, 0.3, 0)
panel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
panel.BorderSizePixel = 0
panel.Active = true
panel.Draggable = true
panel.Parent = screenGui

Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 8)

-- Barra de título
local titleBar = Instance.new("Frame", panel)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 8)

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(1, -100, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.Text = "Painel de Controle"
titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Botões fechar e minimizar
local function createTopBtn(txt, color, pos)
    local btn = Instance.new("TextButton", titleBar)
    btn.Size = UDim2.new(0, 30, 0, 24)
    btn.Position = UDim2.new(1, pos, 0, 3)
    btn.Text = txt
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local closeBtn = createTopBtn("X", Color3.fromRGB(200,50,50), -35)
local minimizeBtn = createTopBtn("_", Color3.fromRGB(50,150,200), -70)

-- Abas
local tabButtonsFrame = Instance.new("Frame", panel)
tabButtonsFrame.Size = UDim2.new(1, 0, 0, 30)
tabButtonsFrame.Position = UDim2.new(0, 0, 0, 30)
tabButtonsFrame.BackgroundColor3 = Color3.fromRGB(50,50,50)

local function createTabButton(name, pos)
    local btn = Instance.new("TextButton", tabButtonsFrame)
    btn.Size = UDim2.new(0, 120, 1, 0)
    btn.Position = UDim2.new(0, pos, 0, 0)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(80,80,80)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    return btn
end

local farmButton = createTabButton("Farm", 0)
local lojaButton = createTabButton("Loja", 120)
local configButton = createTabButton("Config", 240)

-- Conteúdo das abas
local contentFrame = Instance.new("Frame", panel)
contentFrame.Size = UDim2.new(1, 0, 1, -60)
contentFrame.Position = UDim2.new(0, 0, 0, 60)
contentFrame.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", contentFrame).CornerRadius = UDim.new(0, 6)

local function createTabFrame(name)
    local f = Instance.new("Frame", contentFrame)
    f.Size = UDim2.new(1,0,1,0)
    f.Visible = false
    f.Name = name
    f.BackgroundTransparency = 1
    return f
end

local farmTab = createTabFrame("FarmTab")
local lojaTab = createTabFrame("LojaTab")
local configTab = createTabFrame("ConfigTab")

-- Botões Auto Coleta
local autoCollectButton = Instance.new("TextButton", farmTab)
autoCollectButton.Size = UDim2.new(0,200,0,40)
autoCollectButton.Position = UDim2.new(0,20,0,20)
autoCollectButton.Text = "Auto Coleta: OFF"
autoCollectButton.BackgroundColor3 = Color3.fromRGB(200,0,0)
autoCollectButton.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", autoCollectButton).CornerRadius = UDim.new(0,6)

-- Botões Auto Venda
local autoSellButton = Instance.new("TextButton", lojaTab)
autoSellButton.Size = UDim2.new(0,200,0,40)
autoSellButton.Position = UDim2.new(0,20,0,20)
autoSellButton.Text = "Auto Venda: OFF"
autoSellButton.BackgroundColor3 = Color3.fromRGB(200,0,0)
autoSellButton.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", autoSellButton).CornerRadius = UDim.new(0,6)

-- Auto Comprar
local autoBuyLabel = Instance.new("TextLabel", lojaTab)
autoBuyLabel.Size = UDim2.new(0,300,0,30)
autoBuyLabel.Position = UDim2.new(0,20,0,80)
autoBuyLabel.Text = "Escolha máquinas p/ Auto Comprar:"
autoBuyLabel.TextColor3 = Color3.new(1,1,1)
autoBuyLabel.BackgroundTransparency = 1
autoBuyLabel.TextXAlignment = Enum.TextXAlignment.Left

local machines = {"Minerador", "GPU", "ASIC"}
local selectedMachines = {}

local function createMachineToggle(name, y)
    local btn = Instance.new("TextButton", lojaTab)
    btn.Size = UDim2.new(0,200,0,30)
    btn.Position = UDim2.new(0,20,0,y)
    btn.Text = name .. ": OFF"
    btn.BackgroundColor3 = Color3.fromRGB(200,0,0)
    btn.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)

    btn.MouseButton1Click:Connect(function()
        selectedMachines[name] = not selectedMachines[name]
        btn.Text = name .. ": " .. (selectedMachines[name] and "ON" or "OFF")
        btn.BackgroundColor3 = selectedMachines[name] and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
    end)
end

for i, machine in ipairs(machines) do
    createMachineToggle(machine, 120 + (i-1)*40)
end

-- Configurações: mudar tema
local themeButton = Instance.new("TextButton", configTab)
themeButton.Size = UDim2.new(0,200,0,40)
themeButton.Position = UDim2.new(0,20,0,20)
themeButton.Text = "Tema: Escuro"
themeButton.BackgroundColor3 = Color3.fromRGB(100,100,200)
themeButton.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", themeButton).CornerRadius = UDim.new(0,6)

-- Controle de abas
local tabs = {Farm=farmTab, Loja=lojaTab, Config=configTab}
local function showTab(tabName)
    for _, frame in pairs(tabs) do
        frame.Visible = (frame.Name == tabName)
    end
end
farmButton.MouseButton1Click:Connect(function() showTab("FarmTab") end)
lojaButton.MouseButton1Click:Connect(function() showTab("LojaTab") end)
configButton.MouseButton1Click:Connect(function() showTab("ConfigTab") end)
showTab("FarmTab")

-- Funções Auto Coleta e Auto Venda (simulação)
local autoCollect, autoSell = false, false
autoCollectButton.MouseButton1Click:Connect(function()
    autoCollect = not autoCollect
    autoCollectButton.Text =
