extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	print("MainMenu ready!") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_pressed():
	get_tree().change_scene_to_file("res://level1.tscn") # Replace with function body.


func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)


func _notification(what: int) -> void:
	match what:
		NOTIFICATION_APPLICATION_FOCUS_OUT:
			print("Window not focused... pause & low-CPU mode")
			OS.set_low_processor_usage_mode_sleep_usec(33000)
			OS.set_low_processor_usage_mode(true)
		NOTIFICATION_APPLICATION_FOCUS_IN:
			print("Window not focused... unpause & normal-CPU mode")
			OS.set_low_processor_usage_mode(false)
		NOTIFICATION_WM_CLOSE_REQUEST, NOTIFICATION_WM_GO_BACK_REQUEST:
			print("Quitting!")
			get_tree().quit() # default behavior
