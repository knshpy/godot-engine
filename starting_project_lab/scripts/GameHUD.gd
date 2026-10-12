extends Control

@onready var lbl_score: Label = $MarginContainer/VBoxContainer/HBoxContainer2/lblScore
@onready var life_h_box: HBoxContainer = $MarginContainer/VBoxContainer/LifeHBox
@export var totalScore = 0

var life_indicator = preload("res://scenes/LifeIndicator.tscn")

func _ready() -> void:
	for i in range(Globals.player_max_lives):
		var lifeIndicator = life_indicator.instantiate() as LifeIndicator
		life_h_box.add_child(lifeIndicator)
		
	Globals.lives_changed.connect(update_lives)
	update_lives()

func update_lives() -> void:
	var indicators = life_h_box.get_children()
	for i in range(indicators.size()):
		indicators[i].shouldDisplayHeart = i < Globals.player_current_lives
	
func _process(delta: float) -> void:
	lbl_score.text = str(totalScore)
