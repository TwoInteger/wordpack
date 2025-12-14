Idx = 0
local lastsavedstarttime = 0
Timeidx = 0
local isbeginning = true
local time = 0
Wordstorepeat = {}
print("enter the name of your subtitles: ")
local captions = io.read()
local file = assert(io.open(captions, "r"))
local read = file:read("*all")
Words = {}
Timeline = {}
local endtime = "rhombicosidodecahedron"

-- find first index of a matrix function
local function indexOfMatrix(matrix, value)
    for i, row in ipairs(matrix) do
        for j, v in ipairs(row) do
            if v == value then
                return i
            end
        end
    end
    return 0
end

-- not my code, i'm too lazy to make my own converter thingy
-- Source - https://stackoverflow.com/questions/72656294/how-do-i-format-time-into-seconds-in-lua
function TimeToSeconds(Time)
    local Thingy = {}
    local TimeInSeconds = 0
    
    for v in string.gmatch(Time, "%d+") do
        if tonumber(string.sub(v, 1, 1)) == 0 then
            table.insert(Thingy, tonumber(string.sub(v, 2, 2)))
        else
            table.insert(Thingy, tonumber(v))
        end
    end
    
    if #Thingy == 1 then
        TimeInSeconds = TimeInSeconds + Thingy[1]
    elseif #Thingy == 2 then
        TimeInSeconds = TimeInSeconds + (Thingy[1] * 1000) + Thingy[2]
    elseif #Thingy == 3 then
        TimeInSeconds = TimeInSeconds + (Thingy[1] * 1000 * 60) + (Thingy[2] * 1000) + Thingy[3]
    elseif #Thingy == 4 then
        TimeInSeconds = TimeInSeconds + (Thingy[1] * 1000 * 60 * 60) + (Thingy[2] * 1000 * 60) + (Thingy[3] * 1000) + Thingy[4]
    end
    TimeInSeconds = TimeInSeconds / 1000
    return TimeInSeconds
end


-- convert .srt file to a matrix
for matrix in read:gmatch("%S+") do
    local b = (Idx % 5) + 1
local a = math.floor(1 + (Idx / 5))
if b == 1 then
    Words[a] = {}
else if b == 2 or b == 4 then
    matrix = string.gsub(matrix, ",", ".")
end
end
Words[a][b] = matrix
Idx = Idx + 1
end

os.execute("rm -rf tempry/*")
os.execute("echo \"\" > array.txt")

-- make video timeline
Idx = 1

while Idx <= #Words do
    endtime = Words[Idx][2]
    time = time + TimeToSeconds(endtime)
    Idx = Idx + 1
end

local seconds = math.floor(time % 60)
local minutes = math.floor(time / 60 % 60)
local hours = math.floor(time / 60 / 60)

print(string.format("Estimated length of %s is %d hours, %d minutes and %d seconds", captions, hours, minutes, seconds))