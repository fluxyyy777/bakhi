-- [[ WHUB - STEAL AN EGG (CYBER CRIMSON VIP KEY SYSTEM) ]] --

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local parentUI = nil
pcall(function() parentUI = CoreGui end)
if not parentUI then parentUI = LocalPlayer:WaitForChild("PlayerGui") end

-- Xóa UI cũ nếu đang tồn tại
if parentUI:FindFirstChild("WHUB_StealAnEgg_UI") then
    parentUI["WHUB_StealAnEgg_UI"]:Destroy()
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
local enc_key = "4e657443686561742d5977415a6e352d4e4f69414c62" -- Key: NetCheat-YwAZn5-NOiALb
local enc_link = "68747470733a2f2f67747261666669632e696f2f514d3933455a42" -- Link mới: https://gtraffic.io/QM93EZB
local enc_script = "68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f726f6276787332342f667265656d69756d2f726566732f68656164732f6d61696e2f776875622e6c7561" -- Script gốc whub.lua

-- Tạo ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WHUB_StealAnEgg_UI"
ScreenGui.Parent = parentUI
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 99999

-- Thông báo nổi Toast Notification Crimson
local function showNotify(msgText)
    local Toast = Instance.new("Frame")
    Toast.Size = UDim2.new(0, 320, 0, 42)
    Toast.Position = UDim2.new(0.5, -160, -0.1, 0)
    Toast.BackgroundColor3 = Color3.fromHex("#0F0B15")
    Toast.Parent = ScreenGui
    
    local ToastCorner = Instance.new("UICorner", Toast)
    ToastCorner.CornerRadius = UDim.new(0, 8)
    
    local ToastStroke = Instance.new("UIStroke", Toast)
    ToastStroke.Color = Color3.fromHex("#FF2D55")
    ToastStroke.Thickness = 1.5
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = "⚡ " .. msgText
    Label.TextColor3 = Color3.fromHex("#F3F4F6")
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 11
    Label.Parent = Toast

    -- Animation Trượt Xuống
    TweenService:Create(Toast, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -160, 0.04, 0)
    }):Play()
    
    task.delay(3, function()
        local tweenOut = TweenService:Create(Toast, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -160, -0.1, 0)
        })
        tweenOut:Play()
        tweenOut.Completed:Connect(function() Toast:Destroy() end)
    end)
end

-- Main Window (Bảng Chính Cyber Dark)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromHex("#0A0B10")
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 14)

-- Viền Phát Sáng Neon Đỏ Crimson
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 1.8
MainStroke.Color = Color3.fromHex("#FF2D55")

-- Thanh Đèn Neon Dọc Bên Trái
local GlowBar = Instance.new("Frame")
GlowBar.Size = UDim2.new(0, 4, 1, 0)
GlowBar.Position = UDim2.new(0, 0, 0, 0)
GlowBar.BackgroundColor3 = Color3.fromHex("#FF2D55")
GlowBar.Parent = MainFrame

local GlowCorner = Instance.new("UICorner", GlowBar)
GlowCorner.CornerRadius = UDim.new(0, 14)

-- Header Bar
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, -20, 0, 45)
Header.Position = UDim2.new(0, 15, 0, 10)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local Badge = Instance.new("TextLabel")
Badge.Size = UDim2.new(0, 75, 0, 18)
Badge.Position = UDim2.new(0, 0, 0, 2)
Badge.BackgroundColor3 = Color3.fromHex("#2A0813")
Badge.Text = "SYSTEM V.I.P"
Badge.TextColor3 = Color3.fromHex("#FF2D55")
Badge.Font = Enum.Font.GothamBold
Badge.TextSize = 9
Badge.Parent = Header

local BadgeCorner = Instance.new("UICorner", Badge)
BadgeCorner.CornerRadius = UDim.new(0, 4)

local BadgeStroke = Instance.new("UIStroke", Badge)
BadgeStroke.Color = Color3.fromHex("#881337")
BadgeStroke.Thickness = 1

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.7, 0, 0, 22)
Title.Position = UDim2.new(0, 83, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "WHUB <font color=\"#FF2D55\">- STEAL AN EGG</font>"
Title.RichText = true
Title.TextColor3 = Color3.fromHex("#FFFFFF")
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 15)
Subtitle.Position = UDim2.new(0, 0, 0, 22)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Authentication Portal • Verify To Access Script"
Subtitle.TextColor3 = Color3.fromHex("#6B7280")
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextSize = 10
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

-- Nút Đóng (Close Button)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -26, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromHex("#161822")
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

-- Ô Nhập Key (Input Field)
local InputContainer = Instance.new("Frame")
InputContainer.Size = UDim2.new(1, -30, 0, 42)
InputContainer.Position = UDim2.new(0, 15, 0, 66)
InputContainer.BackgroundColor3 = Color3.fromHex("#11131C")
InputContainer.Parent = MainFrame

local InputCorner = Instance.new("UICorner", InputContainer)
InputCorner.CornerRadius = UDim.new(0, 8)

local InputStroke = Instance.new("UIStroke", InputContainer)
InputStroke.Color = Color3.fromHex("#222638")
InputStroke.Thickness = 1

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -20, 1, 0)
KeyInput.Position = UDim2.new(0, 10, 0, 0)
KeyInput.BackgroundTransparency = 1
KeyInput.PlaceholderText = "Dán Key tại đây..."
KeyInput.PlaceholderColor3 = Color3.fromHex("#4B5563")
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromHex("#F9FAFB")
KeyInput.Font = Enum.Font.GothamSemibold
KeyInput.TextSize = 12
KeyInput.TextXAlignment = Enum.TextXAlignment.Left
KeyInput.Parent = InputContainer

-- Hàng Nút Bấm
local ButtonGroup = Instance.new("Frame")
ButtonGroup.Size = UDim2.new(1, -30, 0, 40)
ButtonGroup.Position = UDim2.new(0, 15, 0, 120)
ButtonGroup.BackgroundTransparency = 1
ButtonGroup.Parent = MainFrame

-- Nút Lấy Key (Get Key Button)
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
GetKeyBtn.Position = UDim2.new(0, 0, 0, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromHex("#2A0813")
GetKeyBtn.Text = "🔑 LẤY KEY"
GetKeyBtn.TextColor3 = Color3.fromHex("#FF2D55")
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 11
GetKeyBtn.Parent = ButtonGroup

local GetKeyCorner = Instance.new("UICorner", GetKeyBtn)
GetKeyCorner.CornerRadius = UDim.new(0, 8)

local GetKeyStroke = Instance.new("UIStroke", GetKeyBtn)
GetKeyStroke.Color = Color3.fromHex("#FF2D55")
GetKeyStroke.Thickness = 1.2

-- Nút Kích Hoạt (Submit Button)
local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.48, 0, 1, 0)
SubmitBtn.Position = UDim2.new(0.52, 0, 0, 0)
SubmitBtn.BackgroundColor3 = Color3.fromHex("#FF2D55")
SubmitBtn.Text = "KÍCH HOẠT SCRIPT"
SubmitBtn.TextColor3 = Color3.fromHex("#FFFFFF")
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 11
SubmitBtn.Parent = ButtonGroup

local SubmitCorner = Instance.new("UICorner", SubmitBtn)
SubmitCorner.CornerRadius = UDim.new(0, 8)

-- Footer Note
local Footer = Instance.new("Frame")
Footer.Size = UDim2.new(1, -30, 0, 46)
Footer.Position = UDim2.new(0, 15, 0, 172)
Footer.BackgroundColor3 = Color3.fromHex("#0F111A")
Footer.Parent = MainFrame

local FooterCorner = Instance.new("UICorner", Footer)
FooterCorner.CornerRadius = UDim.new(0, 8)

local FooterText = Instance.new("TextLabel")
FooterText.Size = UDim2.new(1, -16, 1, 0)
FooterText.Position = UDim2.new(0, 8, 0, 0)
FooterText.BackgroundTransparency = 1
FooterText.Text = "🔥 Cảm ơn bạn đã sử dụng WHUB - Steal An Egg! Hãy lấy key để mở khóa toàn bộ tính năng."
FooterText.TextColor3 = Color3.fromHex("#9CA3AF")
FooterText.Font = Enum.Font.GothamMedium
FooterText.TextSize = 10
FooterText.TextWrapped = true
FooterText.TextYAlignment = Enum.TextYAlignment.Center
FooterText.Parent = Footer

-- Animation Mở Bảng Menu (Scale Pop-In)
TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 410, 0, 235)
}):Play()

-- Hiệu ứng Hover Nút Bấm
local function addHover(btn, normalBg, hoverBg)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = hoverBg}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = normalBg}):Play()
    end)
end

addHover(GetKeyBtn, Color3.fromHex("#2A0813"), Color3.fromHex("#400C1D"))
addHover(SubmitBtn, Color3.fromHex("#FF2D55"), Color3.fromHex("#E02448"))

-- Logic Nút Lấy Key
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(decode(enc_link))
    showNotify("Đã sao chép link! Hãy dán vào trình duyệt để lấy key")
    GetKeyBtn.Text = "✓ ĐÃ SAO CHÉP"
    task.wait(2)
    GetKeyBtn.Text = "🔑 LẤY KEY"
end)

-- Logic Nút Xác Nhận Key
SubmitBtn.MouseButton1Click:Connect(function()
    local input = KeyInput.Text
    local correctKey = decode(enc_key)
    
    if input == correctKey then
        SubmitBtn.Text = "✓ THÀNH CÔNG!"
        SubmitBtn.BackgroundColor3 = Color3.fromHex("#10B981")
        
        task.wait(0.6)
        
        -- Animation Thu Nhỏ & Tắt Menu
        local tweenClose = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0)
        })
        tweenClose:Play()
        tweenClose.Completed:Connect(function()
            ScreenGui:Destroy()
            
            -- Chạy Script Gốc whub.lua
            local scriptUrl = decode(enc_script)
            local success, runErr = pcall(function()
                loadstring(game:HttpGet(scriptUrl))()
            end)
            if not success then
                warn("[WHUB] Lỗi khởi chạy script chính: " .. tostring(runErr))
            end
        end)
    else
        SubmitBtn.Text = "✕ SAI KEY!"
        SubmitBtn.BackgroundColor3 = Color3.fromHex("#EF4444")
        
        task.wait(1.5)
        SubmitBtn.Text = "KÍCH HOẠT SCRIPT"
        SubmitBtn.BackgroundColor3 = Color3.fromHex("#FF2D55")
    end
end)
