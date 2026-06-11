extends Node2D

@onready var player = $Player
@onready var spawn = $SpawnLevel1

func _ready():

	if Global.ultima_porta == "porta_level1":

		player.global_position = spawn.global_position
