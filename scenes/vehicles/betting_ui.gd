extends VBoxContainer

@onready var start_button: Button = $Button

func _on_button_pressed() -> void:
	print("button was pressed")
