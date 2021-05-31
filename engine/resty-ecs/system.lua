local Class     = require(_G.engineDir .. "middleclass")
local System    = Class("System");

System.static.systemsClasses = {}

function pack(...)
    return { ... }, select("#", ...)
end

function System:initialize()
end

-- Create and Cache the class of target system child of EntityClass
-- So if the target class already exist we just return the instance
-- This will be usefull when changing screen
function System:create(sys)
    if not System:doExist(sys) then
        local newSystem = Class(sys.name, System);
        newSystem.initialize = function (self, data)
            System.initialize(self) -- We make our systemCustom herite from system
            self.components = data or {};
            --[[
                Here we search in the data table all callback and bind it to our system
                It will be like this in running time Move:update(dt)
                and when we try to use it System.systemsClasses["Move"]:update(dt)
            ]]--
        end
        -- Bind dynamically functions
        for _, v_callb in ipairs(sys.callbacks) do
            newSystem[v_callb.name] = function (self, ...)
                -- Here we will call all action that the data say to do
                for i, v in ipairs(pack(...)) do
                    print(type(v) )
                end
            end
        end
        System.systemsClasses[sys.name] = newSystem;
        return newSystem:new(sys.components)
    else
        --[[
          if the system classe already exist we just take it from our static
          systemsClasses var and instantiate the system
        ]]--
        return self.systemsClasses[sys.name]:new(sys);
    end
end


function System:doExist(sys)
    for k, v in pairs(self.systemsClasses) do
        if k == sys.name then
            return true
        end
    end
    return false
end
-- function System.cb (cb)
--     for k, v in pairs(cb) do
--         self.cb[k] = v
--     end
-- end

return System;