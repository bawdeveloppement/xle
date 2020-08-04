-- Search for the file & return the path of file if it exist, if not return false
function SearchFile (string)
    local path = (string):match("(/-)[^%/]+$")
    for i, v in pairs(love.filesystem.getRealDirectory("path")) do
    end
    return false
end