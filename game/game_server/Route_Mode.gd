extends HttpRouter
class_name ModeRoute

func handle_get(_request, response):
	response.send(200, "Hello!")
