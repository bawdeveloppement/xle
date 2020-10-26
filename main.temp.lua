-- GLOBAL --
_G.baseDir      = (...):match("(.-)[^%.]+$")
_G.engineDir      = _G.baseDir .. "engine."
_G.assetDir      = _G.baseDir .. "assets."
_G.componentDir   = _G.engineDir .. "baw.components.";

_G.Engine = require(_G.engineDir .. "resty-ecs.engine");

local Class = require("engine.middleclass");
Component = require("engine.resty-ecs.component");
Entity = require("engine.resty-ecs.entity");
Screen = require("engine.resty-ecs.screen");
-- Entity

--

local Rogue = {
    name = "Rogue",
    components = {
        {
            name = "Transform",
            data = {
                position = {
                    x = 10,
                    y = 10
                }
            }
        }
    }
}


local System = Class("System")
System.static.systems = {}

function System:initialize(name, components, callbacks)
    self.name = name
    self.components = components
    self.cb = {}
    self:bindCallbacks(callbacks);
end

function System.cb (cb)
    for k, v in pairs(cb) do
        self.cb[k] = v
    end
end

local entityInstances = {};
local systemInstances = {};

local MainScreen = Screen:new("Hello")

function love.load(arg)
    table.insert(entityInstances, Entity:create(Rogue))
    for _, v in ipairs(entityInstances) do
        print(v)
    end
end

local callbacks = {
    "directorydropped",
    "displayrotated",
    "draw",
    "errhand",
    "errorhandler",
    "filedropped",
    "focus",
    "gamepadaxis",
    "gamepadpressed",
    "gamepadrelease",
    "joystickadded",
    "joystickaxis",
    "joystickhat",
    "joystickpresse",
    "joystickrelease",
    "joystickremove",
    "keypressed",
    "keyreleased",
    "load",
    "lowmemory",
    "mousefocus",
    "mousemoved",
    "mousepressed",
    "mousereleased",
    "quit",
    "resize",
    "textedited",
    "textinput",
    "threaderror",
    "touchmoved",
    "touchpressed",
    "touchreleased",
    "update",
    "visible",
    "wheelmoved",
}

for _, v in ipairs(callbacks) do
    love[v] = function (...)
        for _, screen in pairs(Screen.screens) do
            -- if screen[v] ~= nil and  then
            --     print(v)
            -- end
        end
    end
end


local Ent = {}
local Composant1 = {
    name = "transform",
    data = "test"
}
local Composant2 = {
    name = "transform",
    data = "test"
}
local MetaComposant = {}

MetaComposant.__add = function (...)
    for k, v in pairs(arg) do
        print(k, v);
    end
end

setmetatable(Composant, MetaComposant)

local test = { "ezez", "sadazea", "!" }
print(unpack(test))


-- function love.update(dt)
--     for 
--     MainScreen.on:update(dt);
-- end
