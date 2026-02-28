extends Node3D

#Hands Nodes
@onready var hands_anim: AnimatedSprite3D = $Hands_Anim

#Hands State Variables
var card_fanning = false
var has_fanned = false


func _process(_delta: float) -> void:
	#Card fanning state logic.
	if Input.is_action_pressed("card_fan"):
		card_fanning = true
	else:
		card_fanning = false


	#Card fanning logic.
	if card_fanning and !has_fanned:
		hands_anim.play("fanning_cards")
		has_fanned = true
	if !card_fanning and has_fanned:
		hands_anim.play_backwards("fanning_cards")
		has_fanned = false
