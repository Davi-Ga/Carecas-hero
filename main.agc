
// Project: Careca's Hero 
// Created: 2021-06-03

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Careca's Hero" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 60, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts
SetDefaultWrapU(1)


//Incluir os arquivos
#include "Moviment.agc"
#include "Loader.agc"


//Inserir os shapes
gosub load_moviment	
gosub loade_images
gosub Load_sound
	
gosub Load_menu
gosub Load_titles



//Música


mode= 1
do


	if GetPointerPressed()=1

		if GetTextHitTest(1,GetPointerX(),GetPointerY())
		
			SetTextVisible(1,0)
			SetTextVisible(2,0)
			SetTextVisible(3,0)
			SetSpriteVisible(logosprite,0)
			SetSpriteVisible(backspritem,0)
			SetSpriteVisible(backsprite,1)
			
			PlayMusic(1,1)
			AddSpriteAnimationFrame(2,LoadImage("Careca-parado.png"))
			AddSpriteAnimationFrame(2,LoadImage("Careca-andando1.png"))
			AddSpriteAnimationFrame(2,LoadImage("Careca-andando2.png"))
			PlaySprite(2,10,1,1,3)
			SetSpriteVisible(2,0)
			
		endif
		
	endif	
	
	if GetPointerPressed()=1

		if GetTextHitTest(2,GetPointerX(),GetPointerY())
		
			SetTextVisible(1,0)
			SetTextVisible(2,0)
			SetSpriteVisible(logosprite,0)
			
			
			
		endif
	
	endif
		
			
SetSpritePosition(2,CarecaX,CarecaY)
		
			
			
			if GetRawKeyState(39)
				
			
				
				SetSpriteFlip(2,0,0)
				CarecaX=CarecaX+Speed
				CarecaRight=1
				CarecaLeft=0
				xcroll#=xcroll#+0.001
				
					
			elseif	GetRawKeyState(37)
					
					SetSpriteFlip(2,180,0)
					CarecaX=CarecaX-Speed
					CarecaRight=0
					CarecaLeft=1
					xcroll#=xcroll#-.001
					

			else
				if (GetSpritePlaying(2)=1)
					PlaySprite(2,10,1,1,3)
					
				endif
			endif	
		SetSpriteUVOffset(backsprite,xcroll#,0)
		
		

if GetRawkeyState(90) and CarecaRight=1
	
		SetSpritePosition(20,CarecaX,CarecaY)
		SetSpriteVisible(20,1)
		SetSpriteFlip(20,0,0)
		SetSpriteVisible(2,0)
		
		
	
	if shooting=0
	shooting=1
	for b=0 to 3
		if all_bullets[b].Active=0
			all_bullets[b].Active=1		
			all_bullets[b].BulletX=CarecaX+30
			all_bullets[b].Bullety=Carecay+10
			
			SetSpriteVisible(3+b,1)
			
			exit
			endif
	next b
	endif

else
	SetSpriteVisible(20,0)
	SetSpriteVisible(2,1)
	shooting=0
endif


for b = 0 to 3
	if all_bullets[b].Active=1		
		all_bullets[b].BulletX=all_bullets[b].BulletX+5
		if 	all_bullets[b].BulletX>10000 then all_bullets[b].Active=0
		
	endif	
next b

for b=0	to 3
	
	SetSpritePosition(3+b, all_bullets[b].BulletX,all_bullets[b].BulletY)
		
next b	


if GetRawKeyState(90) and CarecaLeft = 1
	
	SetSpritePosition(20,CarecaX,CarecaY)
	SetSpriteVisible(20,1)
	SetSpriteFlip(20,180,0)
	SetSpriteVisible(2,0)
	
	if shooting2=0
	shooting2=1
	for b2 = 0 to 3
		if all_bullets2[b2].ActiveLeft=0
			all_bullets2[b2].ActiveLeft=1
			all_bullets2[b2].BulletLeft_X=CarecaX -30	
			all_bullets2[b2].BulletLeft_Y=CarecaY +15
			
			SetSpriteVisible(7+b2,1)
			
			exit
			endif
		next b2
		endif
else
	
	shooting2=0
endif

for b2=0 to 3
	if all_bullets2[b2].ActiveLeft=1
		all_bullets2[b2].BulletLeft_X=all_bullets2[b2].BulletLeft_X-6
		if all_bullets2[b2].BulletLeft_X<-100 then all_bullets2[b2].ActiveLeft=0
			
	endif
next b2


for b2=0 to 3
	SetSpritePosition(7+b2,all_bullets2[b2].BulletLeft_X,all_bullets2[b2].BulletLeft_Y)
next b2

				

	sync()			
	loop	