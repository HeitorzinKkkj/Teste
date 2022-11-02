function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'spank-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'bf_dead'); --put in Clow Consternation RCT IKVI/music/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'tikygameOver'); --put in Clow Consternation RCT IKVI/music/
		setPropertyFromClass('GameOverSubstate', 'endSoundName', 'tikygameOverEnd'); --put in Clow Consternation RCT IKVI/music/
end