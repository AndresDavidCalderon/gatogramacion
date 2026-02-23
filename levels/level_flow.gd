extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Slides.show()
	$Challenge.hide()

func _on_slides_finished() -> void:
	$Slides.hide()
	$Challenge.show()

func _on_challenge_execution_finished(result: String) -> void:
	var expected=$Challenge/WaitedResult/MarginContainer/Label.text.to_lower().strip_edges()
	if expected==result.to_lower().strip_edges():
		$Challenge.hide()
		$Congratulations.show()