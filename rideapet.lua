-- [[ LUXURY HUB - RIDE A PET (PREMIUM KEY SYSTEM) ]] --

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local parentUI = nil
pcall(function() parentUI = CoreGui end)
if not parentUI then parentUI = LocalPlayer:WaitForChild("PlayerGui") end

-- Xóa UI cũ nếu đang tồn tại
if parentUI:FindFirstChild("LuxuryHub_GetKey_UI") then
    parentUI["LuxuryHub_GetKey_UI"]:Destroy()
end

-- Hàm giải mã Hex bảo mật
local function decode(hex)
    local str = ""
    for i = 1, #hex, 2 do
        str = str .. string.char(tonumber(string.sub(hex, i, i+1), 16))
    end
    return str
end

-- Dữ liệu bảo mật (Đã mã hóa Hex)
local enc_key = "4e657443686561742d75717730655252494b4d672d50734f57734b39634535" -- Key: NetCheat-uqw0eRRIKMg-PsOWsK9cE5
local enc_link = "68747470733a2f2f6c696e6b346d2e6e65742f36736275706141" -- Link: https://link4m.net/6sbupaA
local enc_script = "68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f4c6f7374496e53796e746178782f52696465415065742f6d61696e2f6c6f616465722e6c7561"

-- Tạo ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LuxuryHub_GetKey_UI"
ScreenGui.Parent = parentUI
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 9999

-- Thông báo nổi (Royal Gold Toast Notification)
local function showNotify(msg)
    local Toast = Instance.new("Frame")
    Toast.Size = UDim2.new(0, 310, 0, 40)
    Toast.Position = UDim2.new(0.5, -155, 0.05, -50)
    Toast.BackgroundColor3 = Color3.fromHex("#141419")
    Toast.Parent = ScreenGui
    
    local ToastCorner = Instance.new("UICorner", Toast)
    ToastCorner.CornerRadius = UDim.new(0, 8)
    
    local ToastStroke = Instance.new("UIStroke", Toast)
    ToastStroke.Color = Color3.fromHex("#F59E0B")
    ToastStroke.Thickness = 1.2
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = "👑 " .. msg
    Label.TextColor3 = Color3.fromHex("#F3F4F6")
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 11
    Label.Parent = Toast
    
    TweenService:Create(Toast, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -155, 0.05, 0)
    }):Play()
    
    task.delay(3, function()
        local tweenOut = TweenService:Create(Toast, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -155, 0.05, -50)
        })
        tweenOut:Play()
        tweenOut.Completed:Connect(function() Toast:Destroy() end)
    end)
end

-- Main Window (Giao diện Vàng Kim Obsidian)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromHex("#0F0F14")
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 0, 0, 0) -- Ban đầu thu nhỏ để tạo animation
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 14)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 1.5
MainStroke.Color = Color3.fromHex("#F59E0B")

-- Thanh Accent Dọc Vàng Kim
local AccentBar = Instance.new("Frame")
AccentBar.Name = "AccentBar"
AccentBar.Size = UDim2.new(0, 4, 1, 0)
AccentBar.Position = UDim2.new(0, 0, 0, 0)
AccentBar.BackgroundColor3 = Color3.fromHex("#F59E0B")
AccentBar.Parent = MainFrame

local AccentCorner = Instance.new("UICorner", AccentBar)
AccentCorner.CornerRadius = UDim.new(0, 14)

-- Tiêu đề & Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, -20, 0, 45)
Header.Position = UDim2.new(0, 15, 0, 10)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local Badge = Instance.new("TextLabel")
Badge.Size = UDim2.new(0, 70, 0, 18)
Badge.Position = UDim2.new(0, 0, 0, 2)
Badge.BackgroundColor3 = Color3.fromHex("#261C0C")
Badge.Text = "PREMIUM"
Badge.TextColor3 = Color3.fromHex("#F59E0B")
Badge.Font = Enum.Font.GothamBold
Badge.TextSize = 9
Badge.Parent = Header

local BadgeCorner = Instance.new("UICorner", Badge)
BadgeCorner.CornerRadius = UDim.new(0, 4)

local BadgeStroke = Instance.new("UIStroke", Badge)
BadgeStroke.Color = Color3.fromHex("#B45309")
BadgeStroke.Thickness = 1

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.7, 0, 0, 22)
Title.Position = UDim2.new(0, 78, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "LUXURY HUB"
Title.TextColor3 = Color3.fromHex("#FFFFFF")
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 15)
Subtitle.Position = UDim2.new(0, 0, 0, 22)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Ride A Pet Edition • Key System Verification"
Subtitle.TextColor3 = Color3.fromHex("#9CA3AF")
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextSize = 11
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

-- Nút Đóng
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromHex("#1A1A22")
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromHex("#9CA3AF")
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 11
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Ô Nhập Key
local InputContainer = Instance.new("Frame")
InputContainer.Size = UDim2.new(1, -30, 0, 42)
InputContainer.Position = UDim2.new(0, 15, 0, 68)
InputContainer.BackgroundColor3 = Color3.fromHex("#16161E")
InputContainer.Parent = MainFrame

local InputCorner = Instance.new("UICorner", InputContainer)
InputCorner.CornerRadius = UDim.new(0, 8)

local InputStroke = Instance.new("UIStroke", InputContainer)
InputStroke.Color = Color3.fromHex("#2A2A38")
InputStroke.Thickness = 1

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -20, 1, 0)
KeyInput.Position = UDim2.new(0, 10, 0, 0)
KeyInput.BackgroundTransparency = 1
KeyInput.PlaceholderText = "Nhập Key tại đây..."
KeyInput.PlaceholderColor3 = Color3.fromHex("#6B7280")
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromHex("#F9FAFB")
KeyInput.Font = Enum.Font.GothamSemibold
KeyInput.TextSize = 12
KeyInput.TextXAlignment = Enum.TextXAlignment.Left
KeyInput.Parent = InputContainer

-- Hàng Nút Bấm
local ButtonGroup = Instance.new("Frame")
ButtonGroup.Size = UDim2.new(1, -30, 0, 40)
ButtonGroup.Position = UDim2.new(0, 15, 0, 122)
ButtonGroup.BackgroundTransparency = 1
ButtonGroup.Parent = MainFrame

-- Nút Lấy Key
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
GetKeyBtn.Position = UDim2.new(0, 0, 0, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromHex("#1E1B10")
GetKeyBtn.Text = "🔑 LẤY KEY (LINK4M)"
GetKeyBtn.TextColor3 = Color3.fromHex("#F59E0B")
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 11
GetKeyBtn.Parent = ButtonGroup

local GetKeyCorner = Instance.new("UICorner", GetKeyBtn)
GetKeyCorner.CornerRadius = UDim.new(0, 8)

local GetKeyStroke = Instance.new("UIStroke", GetKeyBtn)
GetKeyStroke.Color = Color3.fromHex("#B45309")
GetKeyStroke.Thickness = 1.2

-- Nút Kích Hoạt
local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.48, 0, 1, 0)
SubmitBtn.Position = UDim2.new(0.52, 0, 0, 0)
SubmitBtn.BackgroundColor3 = Color3.fromHex("#F59E0B")
SubmitBtn.Text = "KÍCH HOẠT SCRIPT"
SubmitBtn.TextColor3 = Color3.fromHex("#0F0F14")
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 11
SubmitBtn.Parent = ButtonGroup

local SubmitCorner = Instance.new("UICorner", SubmitBtn)
SubmitCorner.CornerRadius = UDim.new(0, 8)

-- Footer Note
local Footer = Instance.new("Frame")
Footer.Size = UDim2.new(1, -30, 0, 48)
Footer.Position = UDim2.new(0, 15, 0, 174)
Footer.BackgroundColor3 = Color3.fromHex("#14141B")
Footer.Parent = MainFrame

local FooterCorner = Instance.new("UICorner", Footer)
FooterCorner.CornerRadius = UDim.new(0, 8)

local FooterText = Instance.new("TextLabel")
FooterText.Size = UDim2.new(1, -16, 1, 0)
FooterText.Position = UDim2.new(0, 8, 0, 0)
FooterText.BackgroundTransparency = 1
FooterText.Text = "⭐ Lấy key 1 lần qua Link4m để ủng hộ tác giả. Chúc các bạn chơi game vui vẻ cùng Luxury Hub!"
FooterText.TextColor3 = Color3.fromHex("#9CA3AF")
FooterText.Font = Enum.Font.GothamMedium
FooterText.TextSize = 10
FooterText.TextWrapped = true
FooterText.TextYAlignment = Enum.TextYAlignment.Center
FooterText.Parent = Footer

-- Animation Mở Menu (Pop-up Entrance)
TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 420, 0, 240)
}):Play()

-- Logic Xử Lý Event
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(decode(enc_link))
    showNotify("Đã sao chép link! Dán lên trình duyệt để getkey")
    GetKeyBtn.Text = "✓ ĐÃ SAO CHÉP"
    task.wait(2)
    GetKeyBtn.Text = "🔑 LẤY KEY (LINK4M)"
end)

SubmitBtn.MouseButton1Click:Connect(function()
    local input = KeyInput.Text
    local correctKey = decode(enc_key)
    
    if input == correctKey then
        SubmitBtn.Text = "✓ ĐÃ KÍCH HOẠT"
        SubmitBtn.BackgroundColor3 = Color3.fromHex("#10B981")
        SubmitBtn.TextColor3 = Color3.fromHex("#FFFFFF")
        
        task.wait(0.8)
        
        -- Animation Thu Nhỏ Đóng UI
        local tweenClose = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0)
        })
        tweenClose:Play()
        tweenClose.Completed:Connect(function()
            ScreenGui:Destroy()
            
            -- Chạy Script Gốc
            local scriptUrl = decode(enc_script)
            local success, runErr = pcall(function()
                loadstring(game:HttpGet(scriptUrl))()
            end)
            if not success then
                warn("[Luxury Hub] Lỗi khởi chạy script gốc: " .. tostring(runErr))
            end
        end)
    else
        SubmitBtn.Text = "✕ SAI KEY!"
        SubmitBtn.BackgroundColor3 = Color3.fromHex("#EF4444")
        SubmitBtn.TextColor3 = Color3.fromHex("#FFFFFF")
        
        task.wait(1.5)
        SubmitBtn.Text = "KÍCH HOẠT SCRIPT"
        SubmitBtn.BackgroundColor3 = Color3.fromHex("#F59E0B")
        SubmitBtn.TextColor3 = Color3.fromHex("#0F0F14")
    end
end)
