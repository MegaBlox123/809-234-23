local f={"\069\043\067\102\087\048\061\061","\114\109\066\054\056\070\066\054\087\069\115\085\087\075\077\120","\056\075\118\116\066\070\066\102\114\121\084\048\056\119\085\083\115\051\061\061","\082\089\082\080\074\118\103\099\065\097\082\048\089\107\056\077\113\049\075\116\088\109\082\107\089\104\102\079\069\067\111\106\076\073\043\103\077\089\054\076\065\100\084\061","\056\070\074\054\105\055\061\061","\066\066\122\110","\070\081\074\118\087\075\079\090\098\074\084\061","\086\069\122\050\056\106\112\061","\086\075\077\072\056\106\112\061","\056\119\067\085\086\083\053\054\114\075\120\101\086\048\061\061"}
for P,U in ipairs({{1,2},{3,4},{5,6}}) do while U[1]<U[2] do f[U[1]],f[U[2]],U[1],U[2]=f[U[2]],f[U[1]],U[1]+1,U[2]-1 end end
local function P(P) return f[P+1] end
local S=f
local v=type
local m=string.sub
local r={["\048"]=1,["\049"]=2,["\050"]=3,["\051"]=4,["\052"]=5,["\053"]=6,["\054"]=7,["\055"]=8,["\056"]=9,["\057"]=10}
for f=1,#S do
    local Q=S[f]
    if v(Q)=="string" then
        local v=string.len(Q)
        local d={}
        local L=1
        local n=0
        local Y=0
        while L<=v do
            local f=m(Q,L,L)
            local P=r[f]
            if P then
                n=n+P*(2^(3-Y))
                Y=Y+1
                if Y==4 then
                    Y=0
                    table.insert(d,string.char(math.floor(n/64)))
                    n=0
                end
            elseif f=="\061" then
                table.insert(d,string.char(math.floor(n/64)))
                break
            end
            L=L+1
        end
        S[f]=table.concat(d)
    end
end
local script=(function()
    local gui=Instance.new("ScreenGui")
    gui.Name="SensoryStudio"
    gui.Parent=game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local frame=Instance.new("Frame")
    frame.Size=UDim2.new(0,300,0,200)
    frame.Position=UDim2.new(0.5,-150,0.5,-100)
    frame.BackgroundColor3=Color3.new(0,0,0)
    frame.BackgroundTransparency=0.5
    frame.Parent=gui
    local title=Instance.new("TextLabel")
    title.Size=UDim2.new(1,0,0,30)
    title.BackgroundTransparency=1
    title.Text="Sensory Studio - Made by Jj3ack"
    title.TextColor3=Color3.new(1,1,1)
    title.Parent=frame
    local button=Instance.new("TextButton")
    button.Size=UDim2.new(0,100,0,50)
    button.Position=UDim2.new(0.5,-50,0.5,-25)
    button.Text="Set Shackles"
    button.BackgroundColor3=Color3.new(0,0.5,0)
    button.TextColor3=Color3.new(1,1,1)
    button.Parent=frame
    button.MouseButton1Click:Connect(function()
        local player=game.Players.LocalPlayer
        local character=player.Character
        if character then
            local humanoid=character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed=0
                local shackle=Instance.new("WeldConstraint")
                shackle.Part0=character:FindFirstChild("HumanoidRootPart")
                shackle.Part1=game.Workspace:FindFirstChild("Ground")
                shackle.Parent=character
            end
        end
    end)
end)()
return script
end)()