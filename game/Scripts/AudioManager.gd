extends Node

var sounds:Dictionary
var music:Dictionary

@onready var sound_players: Node = $SoundPlayers
@onready var music_player: AudioStreamPlayer = $MusicPlayer


func _ready() -> void:
	sounds = {
		"baby1":preload("res://Audio/Baby01.wav"),
		"baby2":preload("res://Audio/Baby02.wav"),
		"baby3":preload("res://Audio/Baby03.wav"),
		"flap1":preload("res://Audio/Flap01.wav"),
		"flap2":preload("res://Audio/Flap02.wav"),
		"flap3":preload("res://Audio/Flap03.wav"),
		"flap4":preload("res://Audio/Flap04.wav"),
		"newbranch1":preload("res://Audio/NewBranch01.wav"),
		"newbranch2":preload("res://Audio/NewBranch02.wav"),
		"pullworm1":preload("res://Audio/PullWorm01.wav"),
		"pullworm2":preload("res://Audio/PullWorm02.wav"),
		"success-convert1":preload("res://Audio/SuccessConvertToBush_Rustle01.wav"),
		"success-convert2":preload("res://Audio/SuccessConvertToBush_Rustle02.wav"),
		"success-convert3":preload("res://Audio/SuccessConvertToBush_Rustle03.wav"),
		"success-sentence":preload("res://Audio/SuccessSentence.wav"),
		"success-word1":preload("res://Audio/SuccessWord_Chirp01.wav"),
		"success-word2":preload("res://Audio/SuccessWord_Chirp02.wav"),
		"success-word3":preload("res://Audio/SuccessWord_Chirp03.wav"),
		"worm1":preload("res://Audio/WormSpawns01.wav"),
		"worm2":preload("res://Audio/WormSpawns02.wav"),
		"worm3":preload("res://Audio/WormSpawns03.wav"),
	}
	music = {
		#"test":preload("res://Audio/test.mp3")
	}
	
func PlaySound(soundID:String):
	if sounds[soundID]:
		for soundPlayer in sound_players.get_children():
			if soundPlayer.playing == false:
				soundPlayer.stream = sounds[soundID]
				soundPlayer.play()
				return
		print("Not enough sound players to play sound")
	else:
		print("Missing sound: %s"%soundID)
		
func PlayMusic(musicID:String):
	if music[musicID]:
		music_player.stream = music[musicID]
		music_player.play()
	else:
		print("Missing sound: %s"%musicID)
