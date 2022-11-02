function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an desviation note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet Hank' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'bulletHANKNOTE_assets'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
		end
	end
	--debugPrint('Script started!')
	function noteMiss(id, i, noteType, isSustainNote)
		if noteType == 'Bullet Hank' then
			setProperty('health', -400);
			setPropertyFromClass('GameOverSubstate', 'characterName', 'girlboss-dead');
		setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'tikygameOver'); --put in Clow Consternation RCT IKVI/music/
		setPropertyFromClass('GameOverSubstate', 'endSoundName', 'tikygameOverEnd'); --put in Clow Consternation RCT IKVI/music/
		playSound('gf_dead', 0.6);
	end
end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Bullet Hank' then
	characterPlayAnim('gf', 'DODGE', true);
	characterPlayAnim('dad', 'shoot', true);
	triggerEvent('Screen Shake', '0.35, 0.01', '0, 0');
	end
end