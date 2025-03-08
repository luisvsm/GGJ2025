extends Node

var sounds:Dictionary
var music:Dictionary
var ambient:Dictionary

@onready var sound_players: Node = $SoundPlayers
@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var ambient_player: AudioStreamPlayer = $AmbientPlayer


func _ready() -> void:
	sounds = {
		"baby":[
			preload("res://Audio/Baby01.wav"),
			preload("res://Audio/Baby02.wav"),
			preload("res://Audio/Baby03.wav")
		],
		"flap":[
			preload("res://Audio/Flap01.wav"),
			preload("res://Audio/Flap02.wav"),
			preload("res://Audio/Flap03.wav"),
			preload("res://Audio/Flap04.wav")
		],
		"newbranch":[
			preload("res://Audio/NewBranch01.wav"),
			preload("res://Audio/NewBranch02.wav")
		],
		"pullworm":[
			preload("res://Audio/PullWorm01.wav"),
			preload("res://Audio/PullWorm02.wav")
		],
		"success-convert":[
			preload("res://Audio/SuccessConvertToBush_Rustle01.wav"),
			preload("res://Audio/SuccessConvertToBush_Rustle02.wav"),
			preload("res://Audio/SuccessConvertToBush_Rustle03.wav"),
		],
		"success-sentence":[
			preload("res://Audio/SuccessSentence.wav")
		],
		"success-word":[
			preload("res://Audio/SuccessWord_Chirp01.wav"),
			preload("res://Audio/SuccessWord_Chirp02.wav"),
			preload("res://Audio/SuccessWord_Chirp03.wav")
		],
		"worm-spawn":[
			preload("res://Audio/WormSpawns01.wav"),
			preload("res://Audio/WormSpawns02.wav"),
			preload("res://Audio/WormSpawns03.wav")
		]
	}
	music = {
		"theme":preload("res://Audio/WWT Loop Final - no fades.wav")
	}
	ambient = {
		"ambient":preload("res://Audio/Ambient-Forest.wav")
	}
	
	
func PlaySound(soundID:String):
	if sounds[soundID]:
		for soundPlayer in sound_players.get_children():
			if soundPlayer.playing == false:
				print("Playing: %s"%soundID)
				soundPlayer.stream = sounds[soundID].pick_random()
				soundPlayer.play()
				return
		print("Not enough sound players to play sound")
	else:
		print("Missing sound: %s"%soundID)
		
func PlayMusic(musicID:String):
	if music[musicID]:
		music_player.stream = music[musicID]
		music_player.stream
		music_player.play()
	else:
		print("Missing sound: %s"%musicID)
		
func PlayAmbient(ambientID:String):
	if ambient[ambientID]:
		ambient_player.stream = ambient[ambientID]
		ambient_player.play()
	else:
		print("Missing ambient: %s"%ambientID)
