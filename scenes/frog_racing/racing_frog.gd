class_name RacingFrog extends RigidBody3D

@export var racer_name : String = "Racer X"
@export var jump_force : float = 0.5
@onready var timer = $Timer
@onready var model : Node3D = $Frog
var next_checkpoint : RaceCheckpoint
var _direction : Vector3

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	model.look_at(Vector3.FORWARD)

func start_racing(checkpoint: RaceCheckpoint) -> void:
	#look_at(_direction)
	#print("looking at" + str(_direction))
	next_checkpoint = checkpoint
	apply_impulse((basis.x - _direction) * jump_force)

func _on_body_entered(body: Node) -> void:
	#look_at(_direction)
	#print("going towards" + str(basis.x - _direction))
	jump()

func jump() -> void:
	apply_impulse((basis.x - _direction) * jump_force)

func set_checkpoint(checkpoint: RaceCheckpoint) -> void:
	next_checkpoint = checkpoint
	
func set_direction(direction: Vector3) -> void:
	_direction = direction
	print("New direction is " + str(_direction))
