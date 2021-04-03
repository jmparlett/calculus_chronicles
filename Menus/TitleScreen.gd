extends Node
# button1 = start
# button2 = quit

# This code is fairly self explantory when a button is "focused" it display its "focused" texture
# The is hovered code is to allow the same functionality with mouse as with keyboard
func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	 

func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered():
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
		
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered():
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()

# This code defines the actions taken when the button is pressed
# This is done by linking the "Just_pressed" signal from the texture button object.
func _on_TextureButton_pressed():
	get_tree().change_scene("res://Stages/StageOne.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()
