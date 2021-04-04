extends KinematicBody2D


const SPEED = 120
const GRAVITY = 10
const JUMP_POWER = -250		#negative in the y plane is up, positive is down
const FLOOR = Vector2(0, -1) #0, -1 is the top of a 1 by 1 tile

var velocity = Vector2()
var on_ground = false
var is_dead = false
#make health visble in editor
var health = 100


func _physics_process(_delta):
	if not is_dead:
		if health==0:
			dead()
		#Move character in x and y plane
		#set x velocity to move left or right
		if Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
		else:
			velocity.x = 0
		
		#set y velocity to jump
		if Input.is_action_pressed("ui_up"):
			if on_ground:
				velocity.y = JUMP_POWER
				on_ground = false
		#Provides constant positive(down) movement in the y plane to simulate gravity
		velocity.y += GRAVITY
		
		#the is on floor function check against our FLOOR variable to determine if we are at normal position
		if is_on_floor():
			on_ground = true
		else:
			on_ground = false
			
		#after setting velocity move with velocity
		velocity = move_and_slide(velocity, FLOOR)
		
		# This if statement check the name of Physics body such as StaticBody2D to perform to decrement health
		# of the player
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Hazards" in get_slide_collision(i).collider.name:
					health-=1
					$CanvasLayer/Panel/Interface/VBoxContainer/Bar/TextureProgress.value = health
					print("health is now ", health)



# This function is called to perform the death actions it is currently set to return to the main menu
# You could also set it to reload the current scene fairly easily
func dead():
	is_dead = true
	velocity = Vector2(0, 0)
	$CollisionShape2D.disabled = true
	$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://Menus/TitleScreen.tscn")
