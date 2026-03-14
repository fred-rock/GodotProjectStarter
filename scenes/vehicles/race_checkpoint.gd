extends Node3D
class_name RaceCheckpoint 

@onready var checkpoint_area : Area3D = $Area3D

signal checkpoint_hit(checkpoint, racer)

func _ready() -> void:
	add_to_group("checkpoints")

func _on_body_entered(racer: RacingVehicle) -> void:
	checkpoint_hit.emit(self, racer)
