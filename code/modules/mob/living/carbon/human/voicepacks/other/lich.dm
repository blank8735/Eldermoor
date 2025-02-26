/datum/voicepack/lich/get_sound(soundin, modifiers)
	var/used
	switch(soundin)
		if("firescream")
			used = list('sound/vo/lich/firescream (1).ogg','sound/vo/lich/firescream (2).ogg')
		if("laugh")
			used = list('sound/vo/lich/laugh (1).ogg','sound/vo/lich/laugh (2).ogg','sound/vo/lich/laugh (3).ogg')
		if("painscream")
			used = list('sound/vo/lich/painscream (1).ogg')
		if("rage")
			used = list('sound/vo/lich/rage (1).ogg')
		if("deathgurgle")
			used = pick('sound/vo/lich/deathgurgle (1).ogg')
		if("hmm")
			used = 'sound/vo/lich/hmm.ogg'
		if("groan")
			used = list('sound/vo/lich/groan (1).ogg')
	if(!used)
		used = ..(soundin, modifiers)
	return used
