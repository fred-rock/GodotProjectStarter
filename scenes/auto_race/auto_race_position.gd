extends PathFollow3D
class_name AutoRacePosition

@export var speed: float = 6

var current_lap: int

func _process(delta: float) -> void:
	progress += speed * delta
