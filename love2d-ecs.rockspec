rockspec_format = "3.0"
package = "love2d-ecs"
version = "1.0.0"

source = {
  url = "git+https://github.com/bawdeveloppement/love2d-ecs",
  branch = "master"
}

description = {
  summary = "Love2D-ECS is a middleware software whose provides support for visual coding.",
  detailed = [[Love2D-ECS is a middleware software whose provides support for visual coding. It builds JSON files using ECS pattern that can be ported to LÖVE game engine based using own interpreter, similar to Unity 2D's (for more details click here).]],
  license = "MIT"
  homepage = "https://github.com/bawdeveloppement/love2d-ecs/blob/master/README.md",
  issues_url = "https://github.com/bawdeveloppement/love2d-ecs/issues",
  maintainer = "Vincent Hermann",
  labels = {
    "love",
    "love2d-ecs",
    "ecs",
    "lua"
  }
}

build = {
  type = "builtin",
  modules = {
    ["love2d-ecs-main"] = "main.lua",
    ["love2d-ecs-config"] = "config.json",
    ["love2d-ecs-assets"] = "assets/",
    ["love2d-ecs-engine"] = "engine/"
  }
}

test_dependencies = {
  "luacov"
}

test = {
  type = "busted",
  platforms = {
    windows = {
      flags = {
        "--exclude-tags=ssh,git,unix"
      }
    },
    unix = {
      flags = {
        "--exclude-tags=ssh,git"
      }
    }
  }
}
