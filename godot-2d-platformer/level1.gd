extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Level 1 ready!") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("return_to_main_menu"):
		get_tree().change_scene_to_file("res://main_menu.tscn")

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_APPLICATION_FOCUS_OUT:
			print("Window not focused... pause & low-CPU mode")
			OS.set_low_processor_usage_mode_sleep_usec(33000)
			OS.set_low_processor_usage_mode(true)
		NOTIFICATION_APPLICATION_FOCUS_IN:
			OS.set_low_processor_usage_mode(false)
			print("Window not focused... unpause & normal-CPU mode")
		NOTIFICATION_WM_CLOSE_REQUEST, NOTIFICATION_WM_GO_BACK_REQUEST:
			print("Quitting!")
			get_tree().quit() # default behavior
