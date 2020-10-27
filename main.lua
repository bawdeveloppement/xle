-- GLOBAL --
_G.baseDir      = (...):match("(.-)[^%.]+$")
_G.engineDir      = _G.baseDir .. "engine."
_G.assetDir      = _G.baseDir .. "assets."
_G.componentDir   = _G.engineDir .. "baw.components.";

_G.Engine = require(_G.engineDir .. "resty-ecs.engine");
_G.callbacks = {
    all = {
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
    },
    supported = {
        "update",
        "load",
        "draw",
        "keypressed"
    }
}

love.graphics.setDefaultFilter("nearest")

Class = require("engine.middleclass");
Component   = require("engine.resty-ecs.component");
Entity      = require("engine.resty-ecs.entity");
System      = require("engine.resty-ecs.system");
Screen      = require("engine.resty-ecs.screen");

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
            },
        },
        {
            name = "Player",
            data = {
                life = 10
            }
        }
    }
}


local SystemMove = {
    name = "Move",
    components = { "Transform" },
    callbacks = {
        {
            name = "update"
        }
    }
}

local MainScreenData = {
    name = "MainMenu",
    entities = { Rogue },
    -- To change in string for Cached["systems"]["SystemMove"];
    systems = { SystemMove }
}

local MainScreen = Screen:new(
    "Main Menu",
    { Rogue },
    { SystemMove }
);

for _, v in ipairs(callbacks.supported) do
    love[v] = function (...)
        for _, screen in pairs(Screen.screensInstances) do
            -- print(screen:include("update"))
            if screen[v] ~= nil and type(screen[v]) == "function" and screen.active then
                screen[v](screen, ...)
            end
        end
    end
end