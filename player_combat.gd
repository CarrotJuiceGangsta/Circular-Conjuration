extends Node3D

#Player Collision Nodes
@onready var player_standing_col: CollisionShape3D = $"../Player_Standing_Col"
@onready var player_crouching_col: CollisionShape3D = $"../Player_Crouching_Col"

#Player Hurtbox Nodes
@onready var standing_hurtbox: CollisionShape3D = $"../Standing_Hurt_Area/Standing_Hurtbox"
@onready var crouching_hurtbox: CollisionShape3D = $"../Crouching_Hurt_Area/Crouching_Hurtbox"

#Player Nodes
@onready var player: CharacterBody3D = $".."

#Player State Variables
var dead = false
var is_crouching = false


func _process(_delta: float) -> void:
	#Death state logic.
	if Game.Health <= 0.0:
		dead = true


	#Death logic.
	if dead:
		print("wow i'm dead")


	#Crouching state logic.
	if player_standing_col.disabled:
		is_crouching = true
	else:
		is_crouching = false


	#Crouching logic.
	if is_crouching:
		standing_hurtbox.disabled = true
		crouching_hurtbox.disabled = false
	else:
		standing_hurtbox.disabled = false
		crouching_hurtbox.disabled = true




func _on_standing_hurt_area_area_entered(area: Area3D) -> void:
	#Taking damage while standing logic
	if !is_crouching:
		if area.is_in_group("Death"):
			Game.Health = 0
			print("Standing")




func _on_crouching_hurt_area_area_entered(area: Area3D) -> void:
	#Taking damage while crouching logic
	if is_crouching:
		if area.is_in_group("Death"):
			Game.Health = 0
			print("Crouching")
