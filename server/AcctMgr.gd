
extends Control

onready var scroll=get_node("select")
onready var newAcct=get_node("newAccount")
onready var delAcct=get_node("delAccount")
onready var persist=get_node("/root/persist")

var init_sel=false

func onSelectAcct(sel):
	print("Selected account index #",sel)

func onCreateAcct():
	var ob=persist.spawn("Account")
	var val=ob.get_index()

func onDeleteAcct():
	var index=persist.index_bytype['Account']
	var val=scroll.get_value()
	var ob=index.get_child(val)
	persist.nuke(ob)

func refresh(acctRoot):
	var total=acctRoot.get_children().size()
	if total>0:
		scroll.set_hidden(false)
		delAcct.set_hidden(false)
		scroll.set_min(0)
		scroll.set_max(total)
		scroll.set_step(1)
		scroll.set_page(1)
		scroll.set_value(max(0,min(scroll.get_value(),total-1)))
		if !init_sel:
			init_sel=true
			scroll.set_value(0)
	else:
		scroll.set_hidden(true)
		delAcct.set_hidden(true)

func _ready():
	pass
