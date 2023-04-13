event_inherited();

texts = [
	"In 2037, a dense Fog emerged and covered the entire Earth...",
	"However, it did not come alone. It brought with it bloodthirsty creatures, which we call 'Monstrosities'...",
	"Billions of people died in various ways...",
	"It took around 5 years for the new ecosystem to establish itself...",
	"Thus, the Fog depended on the weather and the winds to move around the globe...",
	"The 'Monstrosities' contaminated everything they touched or spat on...",
	"But this time it wasn't our end...",
	"We learned how to survive on this new planet...",
	"We established a new society, primitive but functional...",
	"New jobs emerged, among them the 'Collectors', who are responsible for traveling beyond the Safe Zones....",
	"It has been 43 years since the 'Event', and today I was lucky enough to be on the Fog's path of travel...",
	"I received a call on my radio informing me that there is a handcar under the tracks nearby...",
	"I need to use it to reach a bunker that is '3 Nights' away from here...",
	"On the way, there are resources that I can use to sustain myself until I reach the bunker...",
	"I can't forget to search for medicines to use in case I get contaminated by the 'Monstrosities'...",
	"At night, I must stay close to the light to avoid an anxiety attack and losing energy...",
	"Alright, I need to start my journey now before the Fog catches up to me and devours me!"
];

current_text = 0;

next_text = function()
{
	if (current_text < array_length(texts) - 1)
	{
		 current_text++;
		 value = texts[current_text];
	}
	else room_goto(rm_game);
}

value = texts[current_text];