extends Area2D

signal speed_collected

@onready var particles = $Particles

func _ready():
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if body.name == "Player":
		body.apply_speed_boost() # Ativa o power-up no player
		speed_collected.emit(body)  # passa o próprio player como argumento
		$Sprite2D.visible = false # Deixa a moeda invisível
		$CollisionShape2D.set_deferred("disabled", true) # Desabilita o colisor
		particles.emitting = true # Ativa as partículas
		await particles.finished # Espera as partículas acabarem antes de seguir
		queue_free()
