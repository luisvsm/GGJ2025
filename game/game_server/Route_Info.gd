extends HttpRouter
class_name InfoRoute

func handle_get(_request, response):
	response.send(200, GameServerStatus.GetServerStatus())
