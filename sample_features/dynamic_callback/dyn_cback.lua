local file_path = "sample_features\\dynamic_callback\\sample.json"
local file = io.open(file_path, "r")

if not file then print("File '".. file_path .. "' not found!") return end

local file_content = file:read "*all"

io.close(file)

local json = require("engine.json")
local obj = json:decode(file_content)
local function join_strs(arr)
    local strs = {}
    for _, str in ipairs(arr) do strs[#strs+1] = "\"" .. str .. "\"" end
    return "[" .. table.concat(strs, ", ") .. "]"
end

print("\b Displaying file content:\n" .. file_content .. "\n")
print("\a obj[\"name\"] -> " .. obj["name"] .. "\n")
print("\a obj[\"callback\"][\"method\"] -> " .. obj["callback"]["method"] .. "\n")
print("\a obj[\"callback\"][\"params\"] -> " .. join_strs(obj["callback"]["params"]) .. "\n")
print("\a obj[\"lua_script\"] -> " .. obj["lua_script"] .. "\n")

local obj_method = obj["callback"]["method"]
local obj_params = obj["callback"]["params"]
local obj_script = obj["lua_script"]

function abc(args)
    local a = args[1]
    local b = args[2]
    local c = args[3]
    print("A -> " .. a)
    print("B -> " .. b)
    print("C -> " .. tostring(c))
    print("C + 5 -> " .. tostring(c + 5))
end

_G[obj_method](obj_params)
if not obj_script ~= nil then
    local script = load(obj_script)
    script()
end