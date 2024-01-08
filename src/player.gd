extends CharacterBody2D
class_name Player

var speed := 100
var active_spell = "Invisible"

@onready var sprite: Sprite2D = $Sprite2D
@onready var progress_bar: CastBar = $ProgressBar


func _ready() -> void:
	progress_bar.finished.connect(_on_cast_finished)
	progress_bar.fill(3)


func _physics_process(delta):
	var dir := get_input()
	set_sprite_facing(dir.x)
	velocity = dir * speed
	move_and_slide()


func get_input() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")


func set_sprite_facing(dir_x: float) -> void:
	if dir_x < 0:
		sprite.flip_h = true
	if dir_x > 0:
		sprite.flip_h = false


func _on_cast_finished() -> void:
	progress_bar.reset()


func cast_active_spell() -> void:
	print("i cast-a da spell: ", active_spell)
