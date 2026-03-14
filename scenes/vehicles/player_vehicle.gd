extends Node3D
class_name PlayerVehicle

@export var vehicle: Vehicle 

var _is_moving_fast: bool = false

func _physics_process(delta: float) -> void:
	#super(delta)
	# follow vehicle
	#$origin.global_transform.origin = vehicle.global_transform.origin
	
	vehicle.reset_vehicle_controls(delta)
	
	if vehicle.get_linear_velocity().length() > 0.3:
		_is_moving_fast = true
	else:
		_is_moving_fast = false
		
	if Input.is_action_pressed("forward"):
		vehicle.accelerate(vehicle.max_engine_force)
	
	if Input.is_action_pressed("back"):
		vehicle.accelerate(-vehicle.max_engine_force)
	
	if Input.is_action_pressed("right"):
		vehicle.steer(
			lerp(vehicle.steering, -vehicle.max_steering_angle, 25.0 * delta / (1+(vehicle.get_linear_velocity().length() / 50)))
			)
	
	if Input.is_action_pressed("left"):
		vehicle.steer(
			lerp(vehicle.steering, vehicle.max_steering_angle, 25.0 * delta / (1+(vehicle.get_linear_velocity().length() / 50)))
		)
