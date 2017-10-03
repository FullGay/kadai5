# coding: utf-8

class Player < Sprite
  @isHit = false

  def isHit=(bool)
    @isHit = bool
  end

  def isHit
    @isHit
  end

  def shot
    self.isHit=true
  end
  
  def update
    self.x += 3*Input.x
    self.y += 3*Input.y
  end
end