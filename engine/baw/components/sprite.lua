
local   Sprite = require(_G.engineDir.."middleclass");

function Sprite:initialize(x, y, imageUri, gameObject)
    self.relative.x = 0
    self.relative.y = 0
    self.imageUri   = imageUri or nil
    self.gameObject = gameObject
    self.transform  = gameObject.getTransform()

    if self.imageUri ~= nil then
        self.image = love.graphics.newImage(imageUri);
    else self.image = nil end
end

function Sprite:draw()
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

return  Sprite