local class = require("class")
local Sprite = class:derive("Sprite")
local Anim = require("Animation")

function Sprite:new(atlas, w, h, x, y)
    self.w = w
    self.h = h
    self.x = x
    self.y = y
    self.atlas = atlas
    self.animations = {}
    self.current_anim = ""
    self.quad = love.graphics.newQuad(0,0,w,h, self.atlas:getDimensions())
end

function Sprite:animate(anim_name)
    if self.current_anim ~= anim_name and self.animations[anim_name] ~= nil then
        self.animations[anim_name]:set(self.quad)
        self.current_anim = anim_name
    end
end

function Sprite:add_animation(name, anim)
    self.animations[name] = anim 
end

function Sprite:update(dt)
    if self.animations[self.current_anim] ~= nil then
        self.animations[self.current_anim]:update(dt, self.quad)
    end
end

function Sprite:draw()
    love.graphics.draw(self.atlas,self.quad,self.x,self.y, 0, 1, 1, self.w / 2, self.w / 2)
end

return Sprite