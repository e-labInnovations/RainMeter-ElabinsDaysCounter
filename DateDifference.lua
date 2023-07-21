function Initialize()
    -- Code to initialize the variables and calculate the initial date difference
    local year = tonumber(SKIN:GetVariable('Year'))
    local month = tonumber(SKIN:GetVariable('Month'))
    local day = tonumber(SKIN:GetVariable('Day'))

    local currentDate = os.date('*t')
    local currentDateTable = {year=currentDate.year, month=currentDate.month, day=currentDate.day}

    local otherDateTable = {year=year, month=month, day=day}

    local currentDateSeconds = os.time(currentDateTable)
    local otherDateSeconds = os.time(otherDateTable)

    local dateDifference = math.floor((currentDateSeconds - otherDateSeconds) / 86400)

    SKIN:Bang('!SetVariable', 'DayCount', dateDifference)
end

function Update()
    -- Code to update the DayCount variable on each update
    local year = tonumber(SKIN:GetVariable('Year'))
    local month = tonumber(SKIN:GetVariable('Month'))
    local day = tonumber(SKIN:GetVariable('Day'))

    local currentDate = os.date('*t')
    local currentDateTable = {year=currentDate.year, month=currentDate.month, day=currentDate.day}

    local otherDateTable = {year=year, month=month, day=day}

    local currentDateSeconds = os.time(currentDateTable)
    local otherDateSeconds = os.time(otherDateTable)

    local dateDifference = math.floor((currentDateSeconds - otherDateSeconds) / 86400)

    SKIN:Bang('!SetVariable', 'DayCount', dateDifference)
end
