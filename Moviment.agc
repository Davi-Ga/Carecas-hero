load_moviment:

//Create Sprite Walking
CreateSprite(2,0)

//Sprite Position Walking
CarecaX=150
CarecaY=675

CarecaRight=0
CarecaLeft=0
Speed=0.1


//Create Sprite Punching
CreateSprite(20,0)

//Sprite Animation Punching
AddSpriteAnimationFrame(20,LoadImage("Careca-soco1.png"))
AddSpriteAnimationFrame(20,LoadImage("Careca-soco2.png"))
AddSpriteAnimationFrame(20,LoadImage("Careca-soco4.png"))
SetSpriteVisible(20,0)
PlaySprite(20,7,1,1,3)

//Create Sprite Floor
CreateSprite(21,0)
AddSpriteAnimationFrame(21,LoadImage("Floor1032x758.png"))
FloorX=0
FloorY=728.3
SetSpriteVisible(21,0)

CreateSprite(23,0)
AddSpriteAnimationFrame(23,LoadImage("Careca-pulo.png"))
SetSpriteVisible(23,0)
PlaySprite(23,1,1,1,1)



//Bullet Sprites
LoadImage(5,"Soco.png")
LoadImage(6,"Soco-Esquerda.png")


type Bullet
	Active
	BulletX
	BulletY
endtype

type BulletLeft
	ActiveLeft
	BulletLeft_X
	BulletLeft_Y
endtype

dim all_bullets[3] as Bullet


for b=0 to 3
	CreateSprite(3+b,5)
	SetSpriteVisible(3+b,0)
next b

dim all_bullets2[3] as BulletLeft

for b2=0 to 3
	CreateSprite(7+b2,6)
	SetSpriteVisible(7+b2,0)
next b2		

return
