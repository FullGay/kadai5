# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'

Window.width  = 800
Window.height = 600

player_img = Image.load("player.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

StartWin = Image.load("StartWindow.png")
Back = Image.load("BackGround.png")
GameOverWin = Image.load("GameOverWindow.png")

player = Player.new(400, 500, player_img)
isStart = false
isGameOver = false
enemies = []

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  if Input.keyPush?(K_A) && !isStart
    isStart = true 
    isGameOver = false
    10.times do |i|
      enemies[i] =  Enemy.new(rand(800), rand(600), enemy_img)
      player.isHit=false
    end
  end
  if player.isHit
    isGameOver = true
    isStart = false
  end

  if !isStart && !isGameOver
    Window.draw(0,0,StartWin)
    next
  end
  if isGameOver && !isStart
    break if Input.keyPush?(K_ESCAPE)
    Window.draw(0,0,GameOverWin)
    next
  end
  Window.draw(0,0,Back)
  Sprite.update(enemies)
  Sprite.draw(enemies)

  player.update
  player.draw
  # 当たり判定
  Sprite.check(player, enemies)
end