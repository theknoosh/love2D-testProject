local Anim = require("Animation")
local Sprite = require("Sprite")

local hero_atlas
-- local hero_sprite

local angle = 0

-- animation perameters
local fps = 12
local frame = 1
local anim_timer = 1 / fps
local xoffset
local num_frames = 6

local spr
-- local a = Anim(16, 32, 16, 16, 6, 6, 12)
local idle = Anim(16,16,16,16,4,4,6)
local walk = Anim(16,32,16,16,6,6,12)
local swim = Anim(16,64,16,16,6,6,12)
local punch = Anim(16,80,16,16,3,3,8, false)

local snd

-- This runs ONCE at beginning of game
function love.load()
    love.graphics.setDefaultFilter('nearest','nearest') -- Changes way image is displayed (pixlelated in this case)
    hero_atlas = love.graphics.newImage("assets/gfx/hero.png")
    spr = Sprite(hero_atlas, 16, 16, 100, 100,10,10, 0)
    spr:add_animation("walk", walk)
    spr:add_animation("swim", swim)
    spr:add_animation("punch", punch)
    spr:add_animation("idle", idle)

    -- spr:animate("swim")
    -- spr:animate("walk")
    spr:animate("idle")

    snd = love.audio.newSource("assets/sfx/hit01.wav","static")
    -- love.audio.play(snd)
end

function love.update(dt)
    if dt > 0.035 then return end

    if spr.current_anim == "punch" and spr:animation_finished() then
        spr:animate("idle")
    end
    spr:update(dt)

end

function love.draw()
    -- love graphics colors have been changed from 0-255 to 0-1!! Divide numbers by 255 gets right color
    love.graphics.clear(64/255,64/255,255/255)
    spr:draw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "space" and spr.current_anim ~= "punch" then
        spr:animate("punch")
        love.audio.stop()
        love.audio.play(snd)
    end
end