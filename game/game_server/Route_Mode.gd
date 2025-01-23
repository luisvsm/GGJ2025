extends HttpRouter
class_name ModeRoute

func handle_get(request, response):
	response.send(200, "Hello!")
