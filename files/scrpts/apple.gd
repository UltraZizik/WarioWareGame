extends Node2D
@onready var player: CharacterBody2D = $"../player"
@onready var self_area = $Area2D
@onready var player_area = $"../player/Area2D"

# make a signal
signal apple_collected

func _process(delta: float) -> void: # this runs EVERY FRAME! 
	
	if player_area.overlaps_area(self_area): # checks if overlapping
		if self.visible:
			emit_signal("apple_collected") #signal broadcast
			self.hide() #removed from player sight; collected
			
			if get_parent().has_method("apple_collect"):
				get_parent().apple_collect()
