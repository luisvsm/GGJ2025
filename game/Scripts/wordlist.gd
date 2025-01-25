extends Node

class_name WordList

# Constructor array of tree effects coming from treeEffects to assign to word
static var Wordlist:Array[Word] = [
	Word.create(
		"Light",
		["Text", "noun"],
		[]
	), 
	Word.create(
		"soft",
		["texture", "adjective", "object descriptor"],
		[]
	), 
	Word.create(
		"crispy",
		["texture", "adjective", "object descriptor"],
		[]
	),
	Word.create(
		"fluffy",
		["texture", "adjective", "weather", "object descriptor"],
		[]
	), 
	Word.create(
		"spotted",
		["texture", "adjective", "object descriptor"],
		[]
	),
	Word.create(
		"speckled",
		["texture", "adjective", "object descriptor"],
		[]
	),
	Word.create(
		"golden",
		["texture", "colour", "weather", "adjective", "object descriptor"],
		[]
	),
	Word.create(
		"saw",
		["action", "verb"],
		[]
	),
	Word.create(
		"felt",
		["action", "verb"],
		[]
	),
	Word.create(
		"ate",
		["action", "verb", "ending verb"],
		[]
	),
	Word.create(
		"spun",
		["action", "verb", "ending verb"],
		[]
	),
	Word.create(
		"grew",
		["action", "verb", "ending verb"],
		[]
	),
	Word.create(
		"hoped",
		["action", "verb", "ending verb"],
		[]
	),
	Word.create(
		"enjoyed",
		["action", "verb"],
		[]
	),
	Word.create(
		"laughed",
		["action", "verb"],
		[]
	),
	Word.create(
		"told",
		["action", "verb"],
		[]
	),
	Word.create(
		"smooth",
		["weather", "texture", "adjective", "object descriptor"],
		[]
	),
	Word.create(
		"fluid",
		["weather", "texture", "adjective", "object descriptor"],
		[]
	),
	Word.create(
		"shiny",
		["texture", "adjective", "object descriptor"],
		[]
	),
	Word.create(
		"scary",
		["texture", "adjective", "object descriptor"],
		[]
	),
	Word.create(
		"pretty",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"sharp",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"graceful",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"lilting",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"rough",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"sharp",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"ragged",
		["action", "verb"],
		[]
	),
	Word.create(
		"elegant",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"bold",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"unexpected",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"vigorous",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"high",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"sparse",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"tender",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"twinkly",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"grasped",
		["action", "verb"],
		[]
	),
	Word.create(
		"sighed",
		["action", "verb"],
		[]
	),
	Word.create(
		"called",
		["action", "verb"],
		[]
	),
	Word.create(
		"surprised",
		["action", "verb"],
		[]
	),
	Word.create(
		"called",
		["action", "verb"],
		[]
	),
	Word.create(
		"listened",
		["action", "verb"],
		[]
	),
	Word.create(
		"supported",
		["action", "verb"],
		[]
	),
	Word.create(
		"passed",
		["action", "verb"],
		[]
	),
	Word.create(
		"made",
		["action", "verb"],
		[]
	),
	Word.create(
		"fell",
		["action", "verb"],
		[]
	),
	Word.create(
		"hesitated",
		["action", "verb"],
		[]
	),
	Word.create(
		"tapped",
		["action", "verb"],
		[]
	),
	Word.create(
		"listened",
		["action", "verb"],
		[]
	),
	Word.create(
		"spent",
		["action", "verb"],
		[]
	),
	Word.create(
		"changed",
		["action", "verb"],
		[]
	),
	Word.create(
		"stretched",
		["action", "verb"],
		[]
	),
	Word.create(
		"held",
		["action", "verb"],
		[]
	),
	Word.create(
		"lingered",
		["action", "verb"],
		[]
	),
	Word.create(
		"hummed",
		["action", "verb"],
		[]
	),
	Word.create(
		"grasped",
		["action", "verb"],
		[]
	),
	Word.create(
		"wept",
		["action", "verb"],
		[]
	),
	Word.create(
		"grasped",
		["action", "verb"],
		[]
	),
	Word.create(
		"sighed",
		["action", "verb"],
		[]
	),
	Word.create(
		"called",
		["action", "verb"],
		[]
	),
	Word.create(
		"sighed",
		["action", "verb"],
		[]
	),
	Word.create(
		"sighed",
		["action", "verb"],
		[]
	),
	Word.create(
		"heard",
		["action", "verb", "ending verb"],
		[]
	),
	Word.create(
		"burned",
		["action", "colour", "verb"],
		[]
	),
	Word.create(
		"timber",
		["colour", "texture", "natural object", "object"],
		[]
	),
	Word.create(
		"grove",
		["natural object", "object"],
		[]
	),
	Word.create(
		"tree",
		["natural object", "object", "colour"],
		[]
	),
	Word.create(
		"floor",
		["natural object", "object"],
		[]
	),
	Word.create(
		"hedge",
		["natural object", "object"],
		[]
	),
	Word.create(
		"thicket",
		["natural object", "object"],
		[]
	),
	Word.create(
		"earth",
		["natural object", "object"],
		[]
	),
	Word.create(
		"underbrush",
		["natural object", "object"],
		[]
	),
	Word.create(
		"nature",
		["natural object", "object", "colour"],
		[]
	),
	Word.create(
		"field",
		["natural object", "object"],
		[]
	),
	Word.create(
		"bushland",
		["natural object", "object"],
		[]
	),
	Word.create(
		"bush",
		["colour", "natural object", "object"],
		[]
	),
	Word.create(
		"soil",
		["colour", "natural object", "object"],
		[]
	),
	Word.create(
		"flood",
		["natural object", "object"],
		[]
	),
	Word.create(
		"grove",
		["natural object", "object"],
		[]
	),
	Word.create(
		"egg",
		["natural object", "object", "colour"],
		[]
	),
	Word.create(
		"shell",
		["natural object", "object", "colour"],
		[]
	),
	Word.create(
		"growth",
		["natural object", "object"],
		[]
	),
	Word.create(
		"stars",
		["natural object", "object"],
		[]
	),
	Word.create(
		"sapling",
		["natural object", "object"],
		[]
	),
	Word.create(
		"sand",
		["natural object", "object"],
		[]
	),
	Word.create(
		"grove",
		["natural object", "object"],
		[]
	),
	Word.create(
		"water",
		["natural object", "object"],
		[]
	),
	Word.create(
		"sun",
		["natural object", "object"],
		[]
	),
	Word.create(
		"past",
		["natural object", "object"],
		[]
	),
	Word.create(
		"grove",
		["natural object", "object"],
		[]
	),
	Word.create(
		"nest",
		["environment", "object"],
		[]
	),
	Word.create(
		"home",
		["environment", "object"],
		[]
	),
	Word.create(
		"bark",
		["colour", "natural object", "object"],
		[]
	),
	Word.create(
		"lace monitor",
		["animal", "object"],
		[]
	),
	Word.create(
		"eastern quoll",
		["animal", "object"],
		[]
	),
	Word.create(
		"Leadbeater's possum",
		["animal", "object"],
		[]
	),
	Word.create(
		"Long-nosed potoroo",
		["animal", "object"],
		[]
	),
	Word.create(
		"Helmeted honeyeater",
		["animal", "object"],
		[]
	),
	Word.create(
		"Smoky mouse",
		["animal", "object"],
		[]
	),
	Word.create(
		"Baw Baw frog",
		["animal", "object"],
		[]
	),
	Word.create(
		"Golden-rayed blue butterfly",
		["animal", "object"],
		[]
	),
	Word.create(
		"skulk",
		["collective noun", "action"],
		[]
	),
	Word.create(
		"swarm",
		["collective noun"],
		[]
	),
	Word.create(
		"troop",
		["collective noun"],
		[]
	),
	Word.create(
		"gaggle",
		["collective noun", "action"],
		[]
	),
	Word.create(
		"gaggle",
		["collective noun", "action"],
		[]
	),
	Word.create(
		"tea green",
		["colour"],
		[]
	),
	Word.create(
		"forest green",
		["colour"],
		[]
	),
	Word.create(
		"sky blue",
		["colour"],
		[]
	),
	Word.create(
		"olympic blue",
		["colour"],
		[]
	),
	Word.create(
		"candy red",
		["colour"],
		[]
	),
	Word.create(
		"currant red",
		["colour"],
		[]
	),
	Word.create(
		"pineapple yellow",
		["colour"],
		[]
	),
	Word.create(
		"dijon",
		["colour"],
		[]
	),
	Word.create(
		"cadmium white",
		["colour"],
		[]
	),
	Word.create(
		"grey",
		["colour"],
		[]
	),
	Word.create(
		"slate grey",
		["colour"],
		[]
	),
	Word.create(
		"coal",
		["colour"],
		[]
	),
	Word.create(
		"tiger orange",
		["colour"],
		[]
	),
	Word.create(
		"bronze",
		["colour"],
		[]
	),
	Word.create(
		"rainy",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"cloudy",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"sunny",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"foggy",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"rainy",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"windy",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"snowy",
		["weather", "colour", "adjective"],
		[]
	),
	Word.create(
		"hailing",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"drizzling",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"pouring",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"warm",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"hot",
		["weather", "colour", "adjective"],
		[]
	),
	Word.create(
		"cold",
		["weather", "colour", "adjective"],
		[]
	),
	Word.create(
		"freezing",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"forest",
		["colour", "object", "environment"],
		[]
	),
	Word.create(
		"desert",
		["colour", "object", "environment"],
		[]
	),
	Word.create(
		"ocean",
		["colour", "object", "environment"],
		[]
	),
	Word.create(
		"grassland",
		["object", "environment"],
		[]
	),
	Word.create(
		"wetland",
		["object", "environment"],
		[]
	),
	Word.create(
		"sea",
		["object", "environment"],
		[]
	),
	Word.create(
		"mountain",
		["object", "environment"],
		[]
	),
	Word.create(
		"valley",
		["object", "environment"],
		[]
	),
	Word.create(
		"lake",
		["object", "environment"],
		[]
	),
	Word.create(
		"river",
		["object", "environment"],
		[]
	),
	Word.create(
		"woodland",
		["object", "environment"],
		[]
	),
	Word.create(
		"rainforest",
		["object", "environment"],
		[]
	),
	Word.create(
		"creek",
		["object", "environment"],
		[]
	),
	Word.create(
		"knot",
		["object"],
		[]
	),
	Word.create(
		"bough",
		["object"],
		[]
	),
	Word.create(
		"expanded",
		["verb", "action"],
		[]
	),
	Word.create(
		"expanded",
		["verb", "action"],
		[]
	),
	Word.create(
		"petal",
		["object", "colour", "natural object"],
		[]
	),
	Word.create(
		"heart",
		["object", "colour", "natural object"],
		[]
	),
	Word.create(
		"beauty",
		["object"],
		[]
	),
	Word.create(
		"feather",
		["object", "colour", "natural object"],
		[]
	),
	Word.create(
		"pollen",
		["object", "colour", "natural object"],
		[]
	),
	Word.create(
		"piece",
		["object"],
		[]
	),
	Word.create(
		"edge",
		["object", "colour", "natural object"],
		[]
	),
	Word.create(
		"grain",
		["object", "colour", "natural object"],
		[]
	),
	Word.create(
		"fern",
		["object", "colour", "natural object"],
		[]
	),
	Word.create(
		"blossom",
		["object", "colour", "natural object"],
		[]
	),
	Word.create(
		"leaf",
		["object", "colour", "natural object"],
		[]
	),
	Word.create(
		"sky",
		["object", "colour", "natural object"],
		[]
	),
	Word.create(
		"carefully",
		["adverb"],
		[]
	),
	Word.create(
		"gently",
		["adverb"],
		[]
	),
	Word.create(
		"quietly",
		["adverb"],
		[]
	),
	Word.create(
		"shamefully",
		["adverb"],
		[]
	),
	Word.create(
		"anxiously",
		["adverb"],
		[]
	),
	Word.create(
		"cheerfully",
		["adverb"],
		[]
	),
	Word.create(
		"cheekily",
		["adverb"],
		[]
	),
	Word.create(
		"suspicously",
		["adverb"],
		[]
	),
	Word.create(
		"joyfully",
		["adverb"],
		[]
	),
	Word.create(
		"boldly",
		["adverb"],
		[]
	),
	Word.create(
		"brightly",
		["adverb"],
		[]
	),
	Word.create(
		"curiously",
		["adverb"],
		[]
	),
	Word.create(
		"fiercely",
		["adverb"],
		[]
	),
	Word.create(
		"tough",
		["texture", "object descriptor", "adjective"],
		[]
	),
]
