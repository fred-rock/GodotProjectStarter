extends Path3D
class_name AutoRaceTrack

@export var pos_1: PathFollow3D
@export var pos_2: PathFollow3D
@export var pos_3: PathFollow3D
@export var pos_4: PathFollow3D
@export var countdown_from: int = 3
@export var laps = 3

@onready var finish_line: Area3D = $FinishLine
@onready var countdown_timer: Timer = $CountdownTimer

var positions: Array[PathFollow3D] = []
var laps_dict: Dictionary[PathFollow3D, int]
var finish_order: Array[PathFollow3D]
var race_time: float
var _current_count: int
var _is_race_started: bool
var _is_race_finished: bool

signal countdown_decremented(current_count)
signal lap_incremented(pos)
signal finish_line_crossed(pos)

func _ready() -> void:
	_init()
	_reset()
	start_countdown()
	
func _process(delta: float) -> void:
	if _is_race_started:
		race_time += delta
		#print("Race time: " + str(race_time))
		#print(str(positions[0]) + " progress ratio" + str(positions[0].progress_ratio))
		for pos in positions:
			pos.progress += randf_range(15, 25) * delta
			
func _init() -> void:
	positions = [pos_1, pos_2, pos_3, pos_4]

func _reset() -> void:
	_is_race_started = false
	race_time = 0.0
	for pos in positions:
		pos.progress = 0
			
	laps_dict = {pos_1: 1, pos_2: 1, pos_3: 1, pos_4: 1}
	
	_current_count = countdown_from

func increment_lap(pos: RigidBody3D) -> void:
	var pos_key: PathFollow3D = pos.get_parent()
	if laps_dict.has(pos_key) and laps_dict[pos_key] >= laps:
		print(str(pos_key) + " has crossed the finish line.")
		
		finish_line_crossed.emit(pos_key)
		
		finish_order.push_back(pos_key)
		if finish_order.size() == positions.size():
			_is_race_finished = true
	else:
		laps_dict[pos_key] = laps_dict[pos_key] + 1
		print(str(pos_key) + " is on lap: " + str(laps_dict[pos_key]))
		
		lap_incremented.emit(pos_key)

func start_countdown() -> void:
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

func start_race() -> void:
	_is_race_started = true
