function onEvent(name, value1, value2)
   
	makeLuaSprite('theBg','sky',-680,-130)
	addLuaSprite('theBg',false)
	setLuaSpriteScrollFactor('theBg', 0.1, 0.1)

	makeLuaSprite('hills','orangey hills', -380, 160)
	addLuaSprite('hills',false)
	setLuaSpriteScrollFactor('hills', 0.3, 0.3)

	makeLuaSprite('farm','funfarmhouse', 80, 200)
	addLuaSprite('farm',false)
	setLuaSpriteScrollFactor('farm', 0.6, 0.6)

	makeLuaSprite('ground','grass lands', -480, 600)
	addLuaSprite('ground',false)
	setLuaSpriteScrollFactor('ground', 1, 1)

	makeLuaSprite('corn1','Cornys', -360, 325)
	addLuaSprite('corn1',false)
	setLuaSpriteScrollFactor('corn1', 1, 1)

	makeLuaSprite('corn2','Cornys', 1060, 325)
	addLuaSprite('corn2',false)
	setLuaSpriteScrollFactor('corn2', 1, 1)

	makeLuaSprite('fence','crazy fences', -350, 450)
	addLuaSprite('fence',false)
	setLuaSpriteScrollFactor('fence', 1, 1)

	makeLuaSprite('sign','Sign', 10, 495)
	addLuaSprite('sign',false)
	setLuaSpriteScrollFactor('sign', 1, 1)

    if value1 == 'deadfarm' then
		makeLuaSprite('theBga','CloudySky',-680,-130)
		addLuaSprite('theBga',false)
		setLuaSpriteScrollFactor('theBga', 0.1, 0.1)
	
		makeLuaSprite('hillsa','tanish_hills', -380, 160)
		addLuaSprite('hillsa',false)
		setLuaSpriteScrollFactor('hillsa', 0.3, 0.3)
	
		makeAnimatedLuaSprite('farma','burningfarmhouse', -30,-20)addAnimationByPrefix('farm','burn','the Haha',24,true)
		objectPlayAnimation('farma','burn',false)
		addLuaSprite('farma',false)
		setScrollFactor('farma', 0.6, 0.6);
	
		makeLuaSprite('grounda','dead_grass_lands', -480, 600)
		addLuaSprite('grounda',false)
		setLuaSpriteScrollFactor('grounda', 1, 1)
	
		makeAnimatedLuaSprite('corn1a','DeadCornys', -345,395)addAnimationByPrefix('corn1','sway','swaying corn',24,true)
		objectPlayAnimation('corn1a','sway',false)
		addLuaSprite('corn1a',false)
		setScrollFactor('corn1a', 1, 1);
		makeAnimatedLuaSprite('cornea','DeadCornys', -445,395)addAnimationByPrefix('corne','sway','swaying corn',24,true)
		objectPlayAnimation('cornea','sway',false)
		addLuaSprite('cornea',false)
		setScrollFactor('cornea', 1, 1);
		makeAnimatedLuaSprite('cornexa','DeadCornys', -245,395)addAnimationByPrefix('cornex','sway','swaying corn',24,true)
		objectPlayAnimation('cornexa','sway',false)
		addLuaSprite('cornexa',false)
		setScrollFactor('cornexa', 1, 1);
	
		makeAnimatedLuaSprite('corn2a','DeadCornys', 1085, 395)addAnimationByPrefix('corn2','sway','swaying corn',24,true)
		objectPlayAnimation('corn2a','sway',false)
		addLuaSprite('corn2a',false)
		setScrollFactor('corn2a', 1, 1);
		makeAnimatedLuaSprite('corn22a','DeadCornys', 985, 395)addAnimationByPrefix('corn22','sway','swaying corn',24,true)
		objectPlayAnimation('corn22a','sway',false)
		addLuaSprite('corn22a',false)
		setScrollFactor('corn22a', 1, 1);
		makeAnimatedLuaSprite('corn2aa','DeadCornys', 1085, 395)addAnimationByPrefix('corn2','sway','swaying corn',24,true)
		objectPlayAnimation('corn2aa','sway',false)
		addLuaSprite('corn2aa',false)
		setScrollFactor('corn2aa', 1, 1);
		makeAnimatedLuaSprite('corn222a','DeadCornys', 1185, 395)addAnimationByPrefix('corn222','sway','swaying corn',24,true)
		objectPlayAnimation('corn222a','sway',false)
		addLuaSprite('corn222a',false)
		setScrollFactor('corn222a', 1, 1);
		makeAnimatedLuaSprite('corn2222a','DeadCornys', 1285, 395)addAnimationByPrefix('corn2222','sway','swaying corn',24,true)
		objectPlayAnimation('corn2222a','sway',false)
		addLuaSprite('corn2222a',false)
		setScrollFactor('corn2222a', 1, 1);
	
		makeLuaSprite('fencea','dead_crazy_fences', -575, 400)
		addLuaSprite('fencea',false)
		setLuaSpriteScrollFactor('fencea', 1, 1)
    end
    
    
    
    end