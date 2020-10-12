
local Text = require(_G.engineDir.."middleclass")("Text");

function Text:initialize(relative, gameObject)
    self.relative = {}
    for i, v in pairs(relative) do
        table.insert(self.relative, v)
    end
    self.gameObject = gameObject
    self.transform  = gameObject.getTransform()
    self.text = ""
end

function Text:draw()
    -- Soon draw all image on GameObject.layer
    -- & Insert the referrence of the methods in GameObject.layer {}
    love.graphics.setColor(1,1,1,1);
    if self.image ~= nil then
        -- Play some effect here and
        love.graphics.draw(
            self.image, 
            self.transform.axe.x - self.relative.axe.x,
            self.transform.axe.y - self.relative.axe.y,
            self.transform.rotation.x - self.relative.rot.x,
            self.transform.rotation.y - self.relative.rot.y,
            self.transform.scale.x - self.relative.scale.x,
            self.transform.scale.y - self.relative.scale.y
        );
    end
end

return  Text