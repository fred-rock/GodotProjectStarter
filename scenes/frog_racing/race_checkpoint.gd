class_name RaceCheckpoint extends Node3D

@onready var checkpoint_area : Area3D = $Area3D
@onready var checkpoint_camera : Camera3D = $Camera3D

signal checkpoint_hit(race_participant)

func _ready() -> void:
	add_to_group("checkpoints")

func _on_body_entered(race_participant: RacingFrog) -> void:
	print(race_participant)
	checkpoint_hit.emit(race_participant)
