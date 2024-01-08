extends ProgressBar
class_name CastBar

signal finished


func reset() -> void:
	value = 0


func fill(seconds: float) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "value", max_value, seconds)
	await tween.finished
	finished.emit()

#func _on_value_changed(value: float) -> void:
