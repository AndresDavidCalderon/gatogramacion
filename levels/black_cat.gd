extends TextureRect

var experimenting=false
var noticing=false

@export var experimenting_texture: Texture
@export var normal_texture: Texture
@export var notice_texture: Texture

func set_experiementing(value:bool):
	experimenting=value
	if not noticing:
		if value:
			texture=experimenting_texture
		else:
			texture=normal_texture

func _ready() -> void:
	set_experiementing(false)
	while true:
		if experimenting:
			set_experiementing(false)
			await get_tree().create_timer(10).timeout
		else:
			set_experiementing(true)
			await get_tree().create_timer(1.0).timeout

func _on_challenge_execution_finished(result: String) -> void:
	if not result.is_empty():
		texture=notice_texture
		noticing=true
		await get_tree().create_timer(3.0).timeout
		noticing=false
		set_experiementing(experimenting)