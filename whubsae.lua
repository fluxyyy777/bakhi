-- [[ RONNEI HUB - POTATO GRAPHICS ANTI-LAG & FAST LAUNCH ]] --

-- 1. CHẠY SCRIPT CHÍNH (SONG SONG - TỨC THÌ 0S KHÔNG KHỰNG KHỰNG)
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/robvxs24/freemium/refs/heads/main/whub.lua"))()
    end)
end)

-- 2. BỘ TỐI ƯU SIÊU GIẢM LAG (TĂNG TỐI ĐA FPS)
task.spawn(function()
    pcall(function()
        -- Hạ mức đồ họa game xuống thấp nhất
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

        -- Tắt bóng đổ, sương mù và hiệu ứng ánh sáng nặng
        local Lighting = game:GetService("Lighting")
        if Lighting then
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            Lighting.Brightness = 1
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("Atmosphere") or v:IsA("SunRaysEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") then
                    v.Enabled = false
                end
            end
        end

        -- Tắt hiệu ứng sóng nước và cỏ địa hình
        local Terrain = workspace:FindFirstChildOfClass("Terrain")
        if Terrain then
            Terrain.Decoration = false
            Terrain.WaterWaveSize = 0
            Terrain.WaterWaveSpeed = 0
        end

        -- Chuyển Part về SmoothPlastic, xóa Texture và tắt hiệu ứng hạt
        local Players = game:GetService("Players")
        local function AntiLag(v)
            if v:IsA("BasePart") and not v:IsDescendantOf(Players) then
                v.CastShadow = false
                v.Material = Enum.Material.SmoothPlastic
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy()
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") or v:IsA("Beam") then
                v.Enabled = false
            end
        end

        -- Quét toàn bộ bản đồ và áp dụng liên tục cho mob/kỹ năng mới xuất hiện
        for _, v in ipairs(workspace:GetDescendants()) do AntiLag(v) end
        workspace.DescendantAdded:Connect(AntiLag)
    end)
end)
