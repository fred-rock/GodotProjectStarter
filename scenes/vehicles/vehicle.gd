extends VehicleBody3D
class_name Vehicle 

@export var vehicle_name : String = "Racer X"
@export var max_steering_angle: float = 0.5 # in radians
@export var max_engine_force: float = 800
@export var max_brake: float = 10
#@export var speed : float = 1.5
#@onready var model : Node3D = $MeshInstance3D
#@onready var steering_component = $SteeringComponent
#var _checkpoint : RaceCheckpoint

func _ready():
	self.add_to_group("vehicles")

func accelerate(amount: float):
	engine_force = amount
	#print("vehicle accelerating by " + str(engine_force))

func steer(angle: float):
	steering = angle
	#print("vehicle steering by " + str(steering))

func apply_brake(amount: float):
	brake = amount
	#print("vehicle braking by " + str(brake))

# reset values when user has stopped accelerating
func reset_vehicle_controls(delta):
	engine_force = 0
	steering = lerp(steering, 0.0, 10.0 * delta)
	brake = 0
