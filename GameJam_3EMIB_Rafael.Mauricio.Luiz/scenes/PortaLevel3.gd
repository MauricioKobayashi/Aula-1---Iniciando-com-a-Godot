extends Area2D

@export_file("*.tscn") var cena_destino
@export var id_porta = ""

var player_perto = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta):

	if player_perto and Input.is_action_just_pressed("interagir"):

		Global.ultima_porta = id_porta

		get_tree().change_scene_to_file(cena_destino)

func _on_body_entered(body):

	if body.is_in_group("Jogador"):
		player_perto = true

	print(body.name)

	if body.is_in_group("Jogador"):
		print("Jogador detectado!")
		player_perto = true

func _on_body_exited(body):

	if body.is_in_group("Jogador"):
		player_perto = false
