function Initialize()
    UpdateCount()
end

function Update()
    UpdateCount()
end

function UpdateCount()
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

function UpdateStartDate()
    local inputDate = SKIN:GetVariable('StartDate')
    local day, month, year = inputDate:match("(%d+)-(%d+)-(%d+)")
    
    if day and month and year then
        local validDate = ValidateDate(day, month, year)
        if validDate then
            SKIN:Bang('!WriteKeyValue', 'Variables', 'StartDate', inputDate, '#CURRENTPATH#ElabinsDaysCounter.ini')
            SKIN:Bang('!WriteKeyValue', 'Variables', 'Year', year, '#CURRENTPATH#ElabinsDaysCounter.ini')
            SKIN:Bang('!WriteKeyValue', 'Variables', 'Month', month, '#CURRENTPATH#ElabinsDaysCounter.ini')
            SKIN:Bang('!WriteKeyValue', 'Variables', 'Day', day, '#CURRENTPATH#ElabinsDaysCounter.ini')
            SKIN:Bang('!Refresh')
        else
            SKIN:Bang('!Log', 'Invalid date format: ' .. inputDate, 'Warning')
            SKIN:Bang('!Log', 'Date format should be dd-mm-yyyy', 'Warning')
            SKIN:Bang('!ShowMeter', 'StartDateInputErrorMessage')
        end
    else
        SKIN:Bang('!Log', 'Invalid date format: ' .. inputDate, 'Warning')
        SKIN:Bang('!Log', 'Date format should be dd-mm-yyyy', 'Warning')
        SKIN:Bang('!ShowMeter', 'StartDateInputErrorMessage')
    end
    SKIN:Bang('!Update')
end

function ValidateDate(day, month, year)
    day = tonumber(day)
    month = tonumber(month)
    year = tonumber(year)

    if day >= 1 and day <= 31 and month >= 1 and month <= 12 and year >= 1900 and year <= 9999 then
        return true
    else
        return false
    end
end