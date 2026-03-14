extends Node
class_name RaceTracker 

@export var racers : Array[RacingVehicle] = [] 
@export var checkpoints : Array[RaceCheckpoint] = []
@export var countdown_from : int = 3
@onready var countdown_timer : Timer = $Timer

signal countdown_decremented(current_count)
signal race_won(winner)

var _current_count : int

func _ready() -> void:
	var racers = get_tree().get_nodes_in_group("racers")
	
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
		#start_race()

func _on_timer_timeout() -> void:
	countdown_race()

func start_race() -> void:
	for x in range(racers.size()):
		print(racers[x])
		#racers[x].start_racing(checkpoints[0])
