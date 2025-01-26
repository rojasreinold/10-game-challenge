extends Node

@export var mob_scene: PackedScene
var score
var dodged

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()
		
func game_over() -> void:
	$Music.stop()
	$DeathSound.play()
	$ScoreTimer.stop()
	$MobTimer.stop()
	mob_scene.get_rid()
	
	if score > int($HUD.get_top_score()):
		$HUD.update_top_score(score)
		
	$HUD.show_game_over()
	
	
func new_game():
	score = 0
	dodged = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	#$Music.play()
	
	$HUD.update_score(score)
	$HUD.update_dodged("Dodged: " + str(dodged))
	$HUD.show_message("Get Ready")
	
	get_tree().call_group("mobs", "queue_free")
	
	
func _on_start_timer_timeout():

	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_mob_timer_timeout():
	if $MobTimer.wait_time > 0.3 and randi() %50 > 40:
		$MobTimer.wait_time = $MobTimer.wait_time - 0.1
	#print($MobTimer.wait_time)
	var mob = mob_scene.instantiate()
	
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()
	
	var direction = mob_spawn_location.rotation + PI/2
	mob.position = mob_spawn_location.position
	
	direction += randf_range(-PI/4, PI/4)
	mob.rotation = direction
	
	# Random speed of the mob
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
	#mob.connect("removed_mob", _on_mob_dodged)

	mob.removed_mob.connect(_on_mob_dodged)


func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)


func _on_mob_dodged():
	if not $MobTimer.is_stopped():
		dodged += 1
		$HUD.update_dodged("Dodged: " + str(dodged))
