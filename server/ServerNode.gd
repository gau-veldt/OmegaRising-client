
extends Node

onready var server=get_node("/root/Peer")

#	server's RPC endpoint
#		- net_id=1
#		- lives in /root/lobby
#		- name==str(net_id)=="1"
#
#	At each client a ServerProxy object is placed under /root/lobby/
#	nodepath with name==str(net_id_of_server)=="1" (server is always
#   net_id 1).  Calls by the client into this ServerProxy object
#   become an rpc call received by the server at its ServerNode object.
#

remote func hello(id):
	server.logMessage("got client %d hello" % id)

func _ready():
	pass
