local Anim = require("Animation")
local Sprite = require("Sprite")

local hero_atlas
local hero_sprite

local angle = 0

-- animation perameters
local fps = 10
local frame = 1
local anim_timer = 1 / fps
local xoffset
local num_frames = 6

local spr
local a = Anim(16, 32, 16, 16, 6, 6, 12)

-- This runs ONCE at beginning of game
function love.load()
    love.graphics.setDefaultFilter('nearest','nearest') -- Changes way image is displayed (pixlelated in this case)
    hero_atlas = love.graphics.newImage("assets/gfx/hero.png")
    spr = Sprite(hero_atlas, 16, 16, 100, 100)
    spr:add_animation("walk", a)
    spr:animate("walk")

end

function love.update(dt)
    if dt > 0.035 then return end
    spr:update(dt)
    -- anim_timer = anim_timer - dt
    -- if anim_timer <= 0 then
    --     anim_timer = 1 / fps
    --     frame = frame + 1
    --     if frame > num_frames then frame = 1 end
    --     xoffset = 16 * frame
    --     hero_sprite:setViewport(xoffset, 32, 16, 16)
    -- end
end

function love.draw()
    -- love graphics colors have been changed from 0-255 to 0-1!! Divide numbers by 255 gets right color
    love.graphics.clear(64/255,64/255,255/255)
    spr:draw()
end
