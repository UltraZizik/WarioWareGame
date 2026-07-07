extends Node2D
@onready var themed_timer: Node2D = $MinigameTimer 
# ^^^ You dragged this in the scene by the way 



var apple_collected = 0 # just keeping track of garlic collected
var timer_end = false 

func _ready() -> void:

		#Below you can see that I have a function that I named. I grab a 
		#function from it that was created in it's script and use `await` to 
		# tell the script to wait for a signal, or for when a function finshes


	await themed_timer.Timer(10.0) #accessing a function from this node
	#after this is compeleted...
	timer_end = true # now we're saying "oh ye you ran out of time"

func _process(delta: float) -> void: # running every frame brochacho
	
	if apple_collected == 3: # the double equals is just an argument asking if it's the same, with "=" it'll give an error
		if Global.minigames_done > 3: # we access a global script and see how many minigames have been compeleted
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
		else:
			get_tree().change_scene_to_file("res://files/scenes/levelscreen.tscn") # go back to the intermission scene
	
	if timer_end: # if the timer does end...
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1 # lose ur lives
		get_tree().change_scene_to_file("res://files/scenes/levelscreen.tscn") # back to intermission
		

func apple_collect() -> void: # cool function that you connect to those garlics
	apple_collected = apple_collected +1
	return
	
