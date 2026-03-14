extends Node3D
class_name RacingLevel

# call this in _ready()

# _players can be populated either by the main-menu scene
# when number of players are selected; or more cleanly by
# using get_tree().get_nodes_in_group("players"), since
# all players automatically are inserted to 'players' group
@export var racers: Array[RacingVehicle]
@export var track: Path3D

func _ready() -> void:
	spawn_players()

func spawn_players():
	var index: int = 0
	for racer in racers:
		racer.vehicle.position = get_tree().get_nodes_in_group("spawnpoints")[index].global_position
		#racer.vehicle.look_at_from_position(racer.vehicle.position, racer.vehicle.position - get_track_direction(checkpoint.global_position), Vector3.UP)
		
		if racer is AiRacer:
			print(racer)
			racer.set_track(track)
		#add_child(racer)
		
		index += 1

# To make sure cars face correct direction on road.
func get_track_direction(at_position: Vector3):
	var offset := track.curve.get_closest_offset( at_position )
	var point_1 := track.curve.sample_baked( offset, true )
	var point_2 := track.curve.sample_baked( offset + 0.5, true )
	var direction : Vector3 = ( point_2 - point_1 ).normalized()
	return direction
