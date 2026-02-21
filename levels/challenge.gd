extends Control

signal execution_finished(result:String)

var running_thread: Thread

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	if running_thread and not running_thread.is_alive():
		var result = running_thread.wait_to_finish()
		emit_signal("execution_finished", result)
		$RealResult/MarginContainer/Label.text=result
		running_thread = null
		

func _on_run_button_pressed() -> void:
	var file= FileAccess.open("user://code.py", FileAccess.WRITE)
	if file:
		file.store_string($CodeInput.text)
		file.close()
	else:
		print("Error opening file")
	
	running_thread = Thread.new()
	running_thread.start(run_python.bind($CodeInput.text))


func run_python(code:String)-> String:
	var result=[]
	OS.execute("python3", [OS.get_user_data_dir() + "/code.py"],result,true)
	return result[0]
