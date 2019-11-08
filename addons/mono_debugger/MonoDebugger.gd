tool
extends EditorPlugin

var btn: CheckBox = null
var on: bool

func _enter_tree() -> void:
	on = ProjectSettings.get_setting('mono/debugger_agent/wait_for_debugger')
	btn = CheckBox.new()
	btn.text = 'Wait For Debugger'
	btn.pressed = on
	btn.connect('button_down', self, '_on_button_down')
	add_control_to_container(CONTAINER_TOOLBAR, btn)

func _exit_tree() -> void:
	btn.queue_free()
	remove_control_from_container(CONTAINER_TOOLBAR, btn)
	btn = null
	
func _on_button_down() -> void:
	ProjectSettings.set_setting('mono/debugger_agent/wait_for_debugger', !on)
