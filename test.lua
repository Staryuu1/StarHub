Webhook = "https://discord.com/api/webhooks/1026828025947500624/D-mhjgcKXBBTy8XjVI0tUYG25hEf9SEFFFD3ZjbsioNsnpg0TYqMUKOE4jQp4AS91j54" -- WEBHOOK URL
--==============Another Settings=================--
function webhuk(Logs)
    local script = [[
        $webHookUrl = "]].. Webhook ..[["
        $cpu = (Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select Average).Average
        [System.Collections.ArrayList]$embedArray = @()
    $thumbnailObject = [PSCustomObject]@{
        url = "https://cdn.discordapp.com/attachments/1031531937904467969/1031532036445454437/1213984.jpg"
    }
    $color = Get-Random -Minimum 0 -Maximum 16777215
    $title = 'Staryuu Auto DirtFarm'
    $description = "]].. Logs..[["

    $footer = [PSCustomObject]@{
        icon_url = "https://cdn.discordapp.com/attachments/1031531937904467969/1031532036445454437/1213984.jpg"
        text = "]].."Staryuu | Date : "..(os.date"%d/%m/%y":upper().." Time : ")..os.date("%I")..":"..os.date("%M").." "..os.date("%p"):upper()..[["
    }


    $embedObject = [PSCustomObject]@{
        color = $color
        title = $title
        description = $description
        thumbnail = $thumbnailObject
        footer = $footer
    }
    [System.Collections.ArrayList]$embedArray = @()
    $embedArray.Add($embedObject)

    $payload = [PSCustomObject]@{
        embeds = $embedArray
    }
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-RestMethod -Uri $webHookUrl -Body ($payload | ConvertTo-Json -Depth 4) -Method Post -ContentType 'application/json'
    ]]

    local pipe = io.popen("powershell -command -", "w")
    pipe:write(script)
    pipe:close()
  end
  local x = os.clock()
  local s = 0
  for i=1,100000 do s = s + i end


  
  function getUptime(waktu)
    local time_d, time_h, time_m, time_s
    if type(waktu) == "string" then tonumber(waktu) end
    if type(waktu) ~= "number" then return end

    time_d = math.floor(waktu / (3600 * 24))
    time_h = math.floor((waktu % (3600 * 24)) / 3600)
    time_m = math.floor(((waktu % (3600 * 24)) % 3600) / 60)
    time_s = math.floor(((waktu % (3600 * 24)) % 3600) % 60)

    return string.format("Hari: %d Jam: %d Menit: %d Detik: %d", time_d, time_h, time_m, time_s)
end


    sleep(10000)
    webhuk(getUptime(os.clock() - x))

    


  
 
 
  
