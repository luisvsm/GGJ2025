extends Node

class_name WordList

# Constructor array of tree effects coming from treeEffects to assign to word
static var Wordlist:Array[Word] = [
	Word.create(
		"Light",
		["Text", "noun"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	), 
	Word.create(
		"soft",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	), 
	Word.create(
		"crispy",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"fluffy",
		["texture", "adjective", "weather", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	), 
	Word.create(
		"spotted",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"speckled",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"golden",
		["texture", "colour", "weather", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"saw",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"felt",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"ate",
		["action", "verb", "ending verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"spun",
		["action", "verb", "ending verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"grew",
		["action", "verb", "ending verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"hoped",
		["action", "verb", "ending verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"enjoyed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"laughed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"told",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"smooth",
		["weather", "texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"fluid",
		["weather", "texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"shiny",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"scary",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"pretty",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sharp",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"graceful",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"lilting",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"rough",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sharp",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"ragged",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"elegant",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"bold",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"unexpected",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"vigorous",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"high",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sparse",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"tender",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"twinkly",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"grasped",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sighed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"called",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"surprised",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"called",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"listened",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"supported",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"passed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"made",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"fell",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"hesitated",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"tapped",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"listened",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"spent",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"changed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"stretched",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"held",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"lingered",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"hummed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"grasped",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"wept",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"grasped",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sighed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"called",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sighed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sighed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"heard",
		["action", "verb", "ending verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"burned",
		["action", "colour", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"timber",
		["colour", "texture", "natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"grove",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"tree",
		["natural object", "object", "colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"floor",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"hedge",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"thicket",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"earth",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"underbrush",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"nature",
		["natural object", "object", "colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"field",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"bushland",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"bush",
		["colour", "natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"soil",
		["colour", "natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"flood",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"grove",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"egg",
		["natural object", "object", "colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"shell",
		["natural object", "object", "colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"growth",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"stars",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sapling",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sand",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"grove",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"water",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sun",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"past",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"grove",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"nest",
		["environment", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"home",
		["environment", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"bark",
		["colour", "natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"lace monitor",
		["animal", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"eastern quoll",
		["animal", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"Leadbeater's possum",
		["animal", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"Long-nosed potoroo",
		["animal", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"Helmeted honeyeater",
		["animal", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"Smoky mouse",
		["animal", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"Baw Baw frog",
		["animal", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"Golden-rayed blue butterfly",
		["animal", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"skulk",
		["collective noun", "action"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"swarm",
		["collective noun"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"troop",
		["collective noun"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"gaggle",
		["collective noun", "action"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"gaggle",
		["collective noun", "action"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"tea green",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"forest green",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sky blue",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"olympic blue",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"candy red",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"currant red",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"pineapple yellow",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"dijon",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"cadmium white",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"grey",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"slate grey",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"coal",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"tiger orange",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"bronze",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"rainy",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"cloudy",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sunny",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"foggy",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"rainy",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"windy",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"snowy",
		["weather", "colour", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"hailing",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"drizzling",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"pouring",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"warm",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"hot",
		["weather", "colour", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"cold",
		["weather", "colour", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"freezing",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"forest",
		["colour", "object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"desert",
		["colour", "object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"ocean",
		["colour", "object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"grassland",
		["object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"wetland",
		["object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sea",
		["object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"mountain",
		["object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"valley",
		["object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"lake",
		["object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"river",
		["object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"woodland",
		["object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"rainforest",
		["object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"creek",
		["object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"knot",
		["object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"bough",
		["object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"expanded",
		["verb", "action"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"expanded",
		["verb", "action"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"petal",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"heart",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"beauty",
		["object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"feather",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"pollen",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"piece",
		["object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"edge",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"grain",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"fern",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"blossom",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"leaf",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"sky",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"carefully",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"gently",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"quietly",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"shamefully",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"anxiously",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"cheerfully",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"cheekily",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"suspicously",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"joyfully",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"boldly",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"brightly",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"curiously",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"fiercely",
		["adverb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
	Word.create(
		"tough",
		["texture", "object descriptor", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Red)]
	),
]
