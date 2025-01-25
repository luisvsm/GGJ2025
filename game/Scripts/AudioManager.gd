extends Node

var sounds:Dictionary
var music:Dictionary

@onready var sound_players: Node = $SoundPlayers
@onready var music_player: AudioStreamPlayer = $MusicPlayer


func _ready() -> void:
	sounds = {
		"test":preload("res://Audio/test.mp3")
	}
	music = {
		"test":preload("res://Audio/test.mp3")
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
