extends Node2D

var rng = RandomNumberGenerator.new()


var deltaset = 0.0
var currentdeltaset = 0.0
var timer
var currentcookie = 0
var randomint = 1
var currentrandomint = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	rng.randomize()
	$BakeryName2.text = str(Global.cookies) + " cookies"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(currentrandomint >= randomint):
		if($ClickedDisplay.visible == false):
			$ClickedDisplay.visible = true
			Global.cookies += 1
			currentcookie += 1
			$BakeryName2.text = str(Global.cookies) + " cookies"
			$AudioStreamPlayer.play()
		else:
			$ClickedDisplay.visible = false
		
		currentrandomint = 1
	currentrandomint += 1


func _on_timer_timeout():
	$Timer.stop()
	$BakeryName3.text = "per second: " + str(currentcookie)
	
	rng.randomize()
	randomint = rng.randi_range(1, 15)
	currentcookie = 0
	$Timer.start()
