function onCreate()

    addCharacterToList('tricky', 'dad')

	makeLuaSprite('sky', 'bg/sky', -450, -300);
	setScrollFactor('sky', 1.0, 1.0)
	scaleObject('sky', 3.3, 3.3);
	
	makeLuaSprite('build2', 'bg/building2', -470, -400);
	setScrollFactor('build2', 0.7, 1.0)
	scaleObject('build2', 3.5, 3.7);
	
	makeLuaSprite('build', 'bg/building1', -450, -400);
	setScrollFactor('build', 0.7, 1.0)
	scaleObject('build', 3.5, 3.7);

	makeAnimatedLuaSprite('Dad2', 'characters/HELLCLOWN', -100, 2000);
	
	addAnimationByPrefix('Dad2', 'idle', 'hellclownidle', 24, false);
	
    addAnimationByPrefix('Dad2', '0', 'hellclownleft', 24, false);
    
    addAnimationByPrefix('Dad2', '1', 'hellclowndown', 24, false);
    
    addAnimationByPrefix('Dad2', '2', 'BF NOTE UP0', 24, false);
    
    addAnimationByPrefix('Dad2', '3', 'hellclownright', 24, false);
    
	objectPlayAnimation('Dad2', 'idle'); 
	setPropertyLuaSprite('Dad2', 'flipX', true);
	scaleObject('Dad2', 7, 7);
	
	makeLuaSprite('rock', 'bg/rocks', -450, -200);
	setScrollFactor('rock', 1.0, 1.0)
	scaleObject('rock', 3.5, 3.3);
	
	makeAnimatedLuaSprite('tk1', 'midsongevents/trickyfuckingdies', -240, 420);
	addAnimationByPrefix('tk1', 'idle', 'trickyshot', 24, true);
	scaleObject('tk1', 2, 2);
	
	makeAnimatedLuaSprite('hk1', 'midsongevents/hankENTERS', -200, -150);
	addAnimationByPrefix('hk1', 'idle', 'hankenter', 24, true);
	scaleObject('hk1', 2, 2);
	
	makeAnimatedLuaSprite('bus', 'menus/LoadingBus', -150, -50);
	addAnimationByPrefix('bus', 'idle', 'busmove', 24, true);
	setObjectCamera('bus', 'camOther');
	scaleObject('bus', 2,2);
	
	addLuaSprite('sky', false);
	addLuaSprite('build2', false);
	addLuaSprite('build', false);
	addLuaSprite('Dad2', false);
	addLuaSprite('rock', false);
	addLuaSprite('tk1', true);
	addLuaSprite('hk1', true);
	addLuaSprite('bus', true);
	
	setProperty('tk1.visible', false);
	setProperty('hk1.visible', false);
	
	setObjectOrder('dad', getObjectOrder('build') - 1)
end

function onEvent(name, value1, value2)

	if name == 'tken' then
		setProperty('tk1.visible', true);
		objectPlayAnimation('tk1', 'idle');
		runTimer('tkbay', 2, 1);
	end

	if name == 'hken' then
		setProperty('hk1.visible', true);
		objectPlayAnimation('hk1', 'idle');
		runTimer('hkbay', 1);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'tkbay' then
		setProperty('tk1.visible', false);
	end

	if tag == 'hkbay' then
		setProperty('hk1.visible', false);
	end
end

function onStepHit()

    if curStep == 836 then
        
        triggerEvent('tken', 0, 0);
        doTweenAlpha('Ok', 'tricky', 0, 0.001, 'linear');
    end
    
    if curStep == 853 then
        
        triggerEvent('hken', 0, 0);
    
    end
    
    if curStep == 853 then
        doTweenAlpha('iconP2', 'iconP2', 0, 0.14);
   
    end
    
    if curStep == 863 then
        doTweenAlpha('iconP2', 'iconP2', 1, 0.14);
    
    end
    
    if curStep == 1195 then
        doTweenY('tkmove', 'Dad2', -2350, 3, 'linear');
    end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		objectPlayAnimation('Dad2', 'idle');
	end
end

lastNote = {0, ""}

function opponentNoteHit(id,d,t,s)

    lastNote[1] = d
    lastNote[2] = t
    
    if lastNote[2] == "No Animation" then -- Change "No Animation" to be your note type, usually you can just keep it as no anim assuming you arent using it elsewhere
	objectPlayAnimation('Dad2', lastNote[1]);
    end
end

function onCountdownTick(counter)
    if counter == 0 then
        doTweenX('busmove', 'bus', 100, 1,'linear');
    end
    if counter == 1 then
        doTweenX('busmove', 'bus', -5000, 2,'linear');
    end
end