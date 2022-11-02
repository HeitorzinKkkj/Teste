function onCreate()
	
	makeAnimatedLuaSprite('mirat', 'bg/Miratbg', 900, 600);
	addAnimationByPrefix('mirat', 'idle', 'miratidle', 24, true);
	setObjectCamera('mirat', 'hud');
	
	makeAnimatedLuaSprite('ween1', 'bg/Weeniebg', 600, 800);
	addAnimationByPrefix('ween1', 'idle', 'weenieidle', 24, true);
	setObjectCamera('ween1', 'hud');
	
	makeAnimatedLuaSprite('fat', 'bg/Fatboybg', -100, 700);
	addAnimationByPrefix('fat', 'idle', 'fatboyidle', 24, true);
	setObjectCamera('fat', 'hud');
	
	addLuaSprite('mirat', false);
	addLuaSprite('ween1', false);
	addLuaSprite('fat', false);
end

function onStepHit()

    if curStep == 1339 then
        doTweenY('ween1move', 'ween1', 400, 2,'linear');
    
    end
    
    if curStep == 1409 then
        doTweenY('miratmove', 'mirat', 150, 2,'linear');
    
    end 
    
    if curStep == 1489 then
        doTweenY('fatmove', 'fat', 250, 2,'linear');
    end
end