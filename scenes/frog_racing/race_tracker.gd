class_name RaceTracker extends Node

@export var racers : Array[RacingFrog] = [] 
@export var checkpoints : Array[RaceCheckpoint] = []
@export var countdown_from : int = 3
@onready var countdown_timer : Timer = $Timer
signal countdown_decremented(current_count)
var _current_count : int

func _ready() -> void:
	#var checkpoints = get_tree().get_nodes_in_group("checkpoints")
	for x in checkpoints.size():
		checkpoints[x].checkpoint_hit.connect(set_next_checkpoint)
		print(checkpoints[x].position)
		
	#var racers = get_tree().get_nodes_in_group("racers")
	for x in racers.size():
		print(racers[x])
			
	_current_count = countdown_from
	countdown_race()

func countdown_race() -> void:
	if (_current_count > 0):
		print("Race in: " + str(_current_count))
		countdown_decremented.emit(_current_count)
		_current_count = _current_count - 1
		countdown_timer.start()
	else:
		print("Gooooo")
		countdown_decremented.emit(_current_count)
		countdown_timer.stop()
		start_race()

func _on_timer_timeout() -> void:
	countdown_race()

func start_race() -> void:
	for x in range(racers.size()):
		racers[x].set_direction(checkpoints[x].position)
		racers[x].start_racing(checkpoints[0])
	
func set_next_checkpoint(racer: RacingFrog) -> void:
	if racers.has(racer):
		if (racer.next_checkpoint in checkpoints):
			print(racer.next_checkpoint)
