if not game:IsLoaded() then
    game.Loaded:Wait()
end

local BASE = "https://raw.githubusercontent.com/azallc/v2/refs/heads/main/games/"

local places = {
    [101558013317432] = "slash-per-click.luau",
}

local file = places[game.PlaceId]

if file then
    local success, result = pcall(function()
        local source = game:HttpGet(BASE .. file)
        local fn = loadstring(source)

        if not fn then
            error("Failed to compile " .. file)
        end

        return fn()
    end)

    if not success then
        warn("Failed to load:", result)
    end
end
