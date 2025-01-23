extends HttpRouter
class_name InfoRoute

func handle_get(request, response):
	response.send(200, GameServerStatus.GetServerStatus())
