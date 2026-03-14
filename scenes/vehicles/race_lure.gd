extends PathFollow3D

@export var speed: float = 6

func _process(delta: float) -> void:
	progress += speed * delta
