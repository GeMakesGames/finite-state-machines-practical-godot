extends RichTextLabel



func _on_player_fall():
	text = "[center]fall"


func _on_player_idle():
	text = "[center]idle"


func _on_player_jump():
	text = "[center]jump"


func _on_player_run():
	text = "[center]run"
