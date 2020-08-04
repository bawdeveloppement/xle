--[[ Return all types of args
    The last args if for error handling, you can put a function which analyze the result
]]--
function GetTypeOfArgs(...)
    local Types = {}
    for i,v  in ipairs(arg) do
        if i == 0 then
            print("You should place a minimum one argument, because here we check arg.");
            return false
        end
        if i >= 1 then
            table.insert(Types, { type(v) });
        end
    end
    return Types
end

-- Table is Table ?
function TIsT(...)
    if type(table) ~= "table" then
        return false
    end
    return true
end

-- Compare the keys of table if they are table
-- Next step let's identify if one arg between all arg is a target
function TableCmpTypeChild(...)
    local Arg = GetTypeOfArgs(arg)
    if ~Arg then return false end
    local enbr = 0
    local i;
    for i, v in ipairs(Arg) do
        if v ~= "table" then
            if enbr < 1 then
            print("The arguments : \n")
            end
            print(" - "..v)
            return false
        end
    end
    if i > 2 then
        print("Unefficient number of args.");
        return false
    end
    return false
end
