/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snd_crowd,1,true);

text = [
	"*taps mic* Hello? Hello? Can everybody hear me? Okay! Good afternoon everyone, can I have your attention!",
	"Today is a momentous occasion and it is my absolute honor to be your MC for....",
	"T H E W O R L D ' S G R A N D F I N A L P O G O J U M P I N G C O M P E T I T I O N !!!!!!!!",
	"That's right folks, before the end of the day, we will be crowning who is the best pogojumper in the WORLD right before your very eyes!",
	"Are you ready? Let me say it again, ARE YOU READY??? Alright, the competitors are in position.",
	"LET THE COMPETITION BEGIN!"
]

talk_sounds = [snd_talk1, snd_talk2, snd_talk3, snd_talk4, snd_talk5];
current_page = 0;

stringHeight = 50;

boxWidth = 1350;


display_text = "";       
text_position = 0;       
text_speed = 0.05;       
text_timer = 0;         
