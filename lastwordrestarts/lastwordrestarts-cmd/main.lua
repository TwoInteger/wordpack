print("make your own \"but every word goes to its last use and restarts\" video")
Idx = 0
Timeidx = 0
local isbeginning = true
local lastword = 69420
Wordstorepeat = {}
local starttime = "00:00:00.000"
local currentword = "placeholder"
print("enter the name of your video: ")
local video = io.read()
print("now, enter the name of your subtitles: ")
local captions = io.read()
local file = assert(io.open(captions, "r"))
local read = file:read("*all")
Words = {}
Timeline = {}
local command = "placeholder"
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

-- find last index of a matrix function (WILDLY INEFFICIENT)
local function lastIndexOfMatrix(matrix, value)
local lastindex = 0
    for i, row in ipairs(matrix) do
        for j, v in ipairs(row) do
            if v == value then
                lastindex = i
            end
        end
    end
    return lastindex
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

os.execute("del /q tempry\\*")
os.execute("type nul > array.txt")

-- make video timeline
Idx = 1

while Idx <= #Words do
    currentword = Words[Idx][5]
    endtime = Words[Idx][2]
    lastword = lastIndexOfMatrix(Words, currentword)
    starttime = Words[lastword][2]
    print(lastword, Idx)
if lastword == Idx then
    table.remove(Words, Idx)
else
    table.insert(Wordstorepeat, "00:00:00.000")
    table.insert(Wordstorepeat, endtime)
    table.insert(Wordstorepeat, starttime)
    table.remove(Words, Idx)
end
print(Idx, starttime, endtime)
Idx = Idx + 1
end
print(Wordstorepeat[1])


-- make video
Timeidx = 1
while Timeidx <= #Wordstorepeat do
    os.execute(string.format("ffmpeg -i %s -ss %s -to %s -c:v libx264 -crf 20 -preset veryfast tempry/%d.mkv", video, Wordstorepeat[Timeidx], Wordstorepeat[Timeidx+1], Timeidx))
    os.execute(string.format("echo file tempry/%d.mkv >> array.txt", Timeidx))
    os.execute(string.format("ffmpeg -i %s -ss %s -c:v libx264 -crf 20 -preset veryfast tempry/%d.mkv", video, Wordstorepeat[Timeidx+2], Timeidx+1))
    os.execute(string.format("echo file tempry/%d.mkv >> array.txt", Timeidx+1))
    print(Timeidx, Timeidx+1)
    Timeidx = Timeidx + 3
end

os.execute("ffmpeg -f concat -i array.txt -c:v copy -c:a copy output.mkv")
os.execute("del /q tempry\\*")
os.execute("type nul > array.txt")

