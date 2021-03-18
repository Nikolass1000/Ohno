local discordia = require('discordia')
local client = discordia.Client()
timer = require('timer')

client:on('ready', function()
    print('Logged in as '.. client.user.username)
        ohnosave = io.open("ohnocounter.txt","r+")
        counter = ohnosave:read()
        ohnosave:close()
    end)

--Main task--

client:on('messageCreate', function(message)
    if message.guild ~= nil then
    ohno = message.guild.emojis:find(function(e) return e.name == 'ohno' end)
        msg = message.content
        lowmsg = string.lower(msg)
            if string.find(lowmsg, "ohno") or string.find(lowmsg, "oh no") then
                message:addReaction(ohno)
                counter = counter + 1
                ohnosave = io.open ("ohnocounter.txt", "r+")
                ohnosave:write(counter)
                ohnosave:close()
                stat = tostring(counter) .. " ohnos"
                client:setGame(stat)
            end
         end
    end)
         
--Commands--

client:on('messageCreate', function(help)
          
          if help.content == "~help" then
         help.channel:send{
            embed = {
            title = "Available commands:",
            fields = {
                {name = "Use ~ prefix", value = "anuke \n router \n pingme \n do sk \n pfp (ping user for their pfp) \n time \n brazil \n \\**iOS** (without prefix)", inline = false},                      
                     },
                color = discordia.Color.fromRGB(254, 254, 254).value,
                     }
                              }
         end
         end)

--WIP Warn System--

--client:on('messageCreate', function(warning)
--          warneduser = warning.mentionedUsers.first
--            warningmessage = warning.content
--         moder = warning.member.roles:find(function(m) return string.lower(m.name) == 'moderator' end)
--         if moder ~= nil and string.lower(moder.name) == "moderator" and warneduser ~= nil and string.find(warningmessage, "~warn") then
--         warning.channel:send(warneduser.mentionString .. ", warn system test")
--         end
--         end)

--Other stuff--

client:on('messageCreate', function(anuk)
          anook = anuk.content
        if string.find(anook, "~anuke") then -- and time1 > time2 then
         quotenumber = math.random(1, 132)
         quote = "./anukequotes/" .. quotenumber .. ".png"
         anuk.channel:send{file = quote}
    end
end)
     
client:on('messageCreate', function(stuff)

         if stuff.content == "~router" and stuff.guild ~= nil then
        router = stuff.guild.emojis:find(function(r) return r.name == 'router' end)
            stuff.channel:send("<:router:" .. router.id .. ">")
        end
        if stuff.content == "~pingme" then
            stuff.channel:send(stuff.author.mentionString)
        end
        if stuff.content == "~time" then
         stuff.channel:send{
                    embed = {
                             fields = {
                                {name = "UTC time: ", value = discordia.Date():toISO(), inline = false},
                                {name = "Host time: ", value = discordia.Date():toString('%a %b %d %Y %T GMT%z'), inline = false},
                                       },
                            color = discordia.Color.fromRGB(254, 254, 254).value,
                            }}
        end
        if stuff.content == "~do sk" then
            stuff.channel:send('do not the sk.')
        end
        
        if stuff.content == "**iOS**" then
            stuff.channel:send('*1. You can\'t*')
        end
        if stuff.content == "~brazil" then
            stuff.channel:send(stuff.author.mentionString .. ' is going to ' .. ':flag_br:')
        end
    end)

--Get profile picture--

client:on('messageCreate', function(profile)
          
          profilemsg = profile.content
        mentioneduser = profile.mentionedUsers.first 
         
         if profilemsg == "~pfp" then
         pfp = profile.author.avatarURL
         profile.channel:send{
            embed = {
            title = profile.author.name .. "'s profile picture:",
            image = {
                url = pfp                     
                     },
                color = discordia.Color.fromRGB(254, 254, 254).value,
                     }
                              }
         elseif mentioneduser ~= nil then
         
         if string.find(profilemsg, "~pfp") then
         pfp = mentioneduser.avatarURL
         profile.channel:send{
            embed = {
            title = mentioneduser.name .. "'s profile picture:",
            image = {
                url = pfp                      
                     },
                color = discordia.Color.fromRGB(254, 254, 254).value,
                     }
                              }
            end
         end
    end)

client:run("Bot "..io.open("./token.config"):read())
