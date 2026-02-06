extends Node2D

var score = 0

@onready var coin_counter = $"../UIManager/CoinCounter"
@onready var coin_counter2 = $"../UIManager/CoinCounter2"
@onready var coin_counter3 = $"../UIManager/CoinCounter3"

func add_point():
	score +=1
	coin_counter.text = str(score)
	coin_counter2.text = str(score)
	coin_counter3.text = str(score)
