extends Node

class_name WordList

# Constructor array of tree effects coming from treeEffects to assign to word
static var Wordlist:Array[Word] = [
	Word.create(
		"soft",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.SkyBlue)]
	), 
	Word.create(
		"crispy",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafShape,TreeEffect.LeafShape.Maple)]
	),
	Word.create(
		"fluffy",
		["texture", "adjective", "weather", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.PineappleYellowBlending)]
	), 
	Word.create(
		"spotted",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Spots)]
	),
	Word.create(
		"speckled",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Speckles)]
	),
	Word.create(
		"golden",
		["texture", "colour", "weather", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Dijon)]
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
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CandyRed)]
	),
	Word.create(
		"grew",
		["action", "verb", "ending verb"],
		[TreeEffect.create(TreeEffect.EffectType.numberOfBranches,3)]
	),
	Word.create(
		"hoped",
		["action", "verb", "ending verb"],
		[TreeEffect.create(TreeEffect.EffectType.numberOfBranches,1)]
	),
	Word.create(
		"enjoyed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TeaGreen)]
	),
	Word.create(
		"laughed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Speckles)]
	),
	Word.create(
		"told",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TigerOrange)]
	),
	Word.create(
		"smooth",
		["weather", "texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.SlateGrey)]
	),
	Word.create(
		"fluid",
		["weather", "texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.OlympicBlue)]
	),
	Word.create(
		"shiny",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Bronze)]
	),
	Word.create(
		"scary",
		["texture", "adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafShape,TreeEffect.LeafShape.Maple)]
	),
	Word.create(
		"pretty",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Stripes)]
	),
	Word.create(
		"sharp",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafShape,TreeEffect.LeafShape.Maple)]
	),
	Word.create(
		"graceful",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CadmiumWhite)]
	),
	Word.create(
		"lilting",
		["adjective", "object descriptor"],
		[]
	),
	Word.create(
		"rough",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Spots)]
	),
	Word.create(
		"ragged",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafShape,TreeEffect.LeafShape.Maple)]
	),
	Word.create(
		"elegant",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CadmiumWhite)]
	),
	Word.create(
		"bold",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CurrantRed)]
	),
	Word.create(
		"unexpected",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Stripes)]
	),
	Word.create(
		"vigorous",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.numberOfBranches,2)]
	),
	Word.create(
		"high",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.numberOfBranches,1)]
	),
	Word.create(
		"sparse",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.numberOfBranches,-1)]
	),
	Word.create(
		"tender",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TeaGreen)]
	),
	Word.create(
		"twinkly",
		["adjective", "object descriptor"],
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Speckles)]
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
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Speckles)]
	),
	Word.create(
		"listened",
		["action", "verb"],
		[]
	),
	Word.create(
		"supported",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.numberOfBranches,1)]
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
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Spots)]
	),
	Word.create(
		"stretched",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.numberOfBranches,1)]
	),
	Word.create(
		"held",
		["action", "verb"],
		[]
	),
	Word.create(
		"lingered",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TeaGreen)]
	),
	Word.create(
		"hummed",
		["action", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.PineappleYellowBlending)]
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
		"heard",
		["action", "verb", "ending verb"],
		[]
	),
	Word.create(
		"burned",
		["action", "colour", "verb"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CandyRed)]
	),
	Word.create(
		"timber",
		["colour", "texture", "natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Bronze)]
	),
	Word.create(
		"grove",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TeaGreen)]
	),
	Word.create(
		"tree",
		["natural object", "object", "colour"],
		[TreeEffect.create(TreeEffect.EffectType.numberOfBranches,1)]
	),
	Word.create(
		"floor",
		["natural object", "object"],
		[]
	),
	Word.create(
		"hedge",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TeaGreen)]
	),
	Word.create(
		"thicket",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TeaGreen)]
	),
	Word.create(
		"earth",
		["natural object", "object", "colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Bronze)]
	),
	Word.create(
		"underbrush",
		["natural object", "object"],
		[]
	),
	Word.create(
		"nature",
		["natural object", "object", "colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TeaGreen)]
	),
	Word.create(
		"field",
		["natural object", "object", "colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Bronze)]
	),
	Word.create(
		"bushland",
		["natural object", "object"],
		[]
	),
	Word.create(
		"bush",
		["colour", "natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TeaGreen)]
	),
	Word.create(
		"soil",
		["colour", "natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TigerOrange)]
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
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Dijon)]
	),
	Word.create(
		"shell",
		["natural object", "object", "colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CadmiumWhite)]
	),
	Word.create(
		"growth",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.numberOfBranches,1)]
	),
	Word.create(
		"stars",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Speckles)]
	),
	Word.create(
		"sapling",
		["natural object", "object"],
		[]
	),
	Word.create(
		"sand",
		["natural object", "object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.PineappleYellowBlending)]
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
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Bronze)]
	),
	Word.create(
		"lace monitor",
		["animal", "object"],
		[]
	),
	Word.create(
		"tiger snake",
		["animal", "object"],
		[]
	),
	Word.create(
		"brush-tailed rock wallaby",
		["animal", "object"],
		[]
	),
	Word.create(
		"platypus",
		["animal", "object"],
		[]
	),
	Word.create(
		"koala",
		["animal", "object"],
		[]
	),
	Word.create(
		"wombat",
		["animal", "object"],
		[]
	),
	Word.create(
		"superb lyrebird",
		["animal", "object"],
		[]
	),
	Word.create(
		"crimson rosella",
		["animal", "object"],
		[]
	),
	Word.create(
		"spotted pardalote",
		["animal", "object"],
		[]
	),
	Word.create(
		"magpie",
		["animal", "object"],
		[]
	),
	Word.create(
		"sulphur-crested cockatoo",
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
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Speckles)]
	),
	Word.create(
		"troop",
		["collective noun"],
		[]
	),
	Word.create(
		"gaggle",
		["collective noun", "action"],
		[TreeEffect.create(TreeEffect.EffectType.leafPattern,TreeEffect.LeafPattern.Speckles)]
	),
	Word.create(
		"herd",
		["collective noun", "action"],
		[]
	),
	Word.create(
		"flock",
		["collective noun", "action"],
		[]
	),
	Word.create(
		"school",
		["collective noun"],
		[]
	),
	Word.create(
		"pride",
		["collective noun"],
		[]
	),
	Word.create(
		"pack",
		["collective noun"],
		[]
	),
	Word.create(
		"colony",
		["collective noun"],
		[]
	),
	Word.create(
		"crowd",
		["collective noun"],
		[]
	),
	Word.create(
		"litter",
		["collective noun"],
		[]
	),
	Word.create(
		"bunch",
		["collective noun"],
		[]
	),
	Word.create(
		"bouquet",
		["collective noun"],
		[]
	),
	Word.create(
		"clutch",
		["collective noun"],
		[]
	),
	Word.create(
		"flamboyance",
		["collective noun"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.PineappleYellowBlending)]
	),
	Word.create(
		"parcel",
		["collective noun"],
		[]
	),
	Word.create(
		"tea green",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TeaGreen)]
	),
	Word.create(
		"forest green",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.ForestGreen)]
	),
	Word.create(
		"sky blue",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.SkyBlue)]
	),
	Word.create(
		"olympic blue",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.OlympicBlue)]
	),
	Word.create(
		"candy red",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CandyRed)]
	),
	Word.create(
		"currant red",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CurrantRed)]
	),
	Word.create(
		"pineapple yellow",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.PineappleYellowBlending)]
	),
	Word.create(
		"dijon",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Dijon)]
	),
	Word.create(
		"cadmium white",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CadmiumWhite)]
	),
	Word.create(
		"grey",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Grey)]
	),
	Word.create(
		"slate grey",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.SlateGrey)]
	),
	Word.create(
		"coal",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Coal)]
	),
	Word.create(
		"tiger orange",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TigerOrange)]
	),
	Word.create(
		"bronze",
		["colour"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Bronze)]
	),
	Word.create(
		"rainy",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.SkyBlue)]
	),
	Word.create(
		"cloudy",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.SlateGrey)]
	),
	Word.create(
		"sunny",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.PineappleYellowBlending)]
	),
	Word.create(
		"foggy",
		["weather", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Grey)]
	),
	Word.create(
		"windy",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"snowy",
		["weather", "colour", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CadmiumWhite)]
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
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Dijon)]
	),
	Word.create(
		"hot",
		["weather", "colour", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CandyRed)]
	),
	Word.create(
		"cold",
		["weather", "colour", "adjective"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.OlympicBlue)]
	),
	Word.create(
		"freezing",
		["weather", "adjective"],
		[]
	),
	Word.create(
		"forest",
		["colour", "object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.ForestGreen)]
	),
	Word.create(
		"desert",
		["colour", "object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.Dijon)]
	),
	Word.create(
		"ocean",
		["colour", "object", "environment"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.OlympicBlue)]
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
		"petal",
		["object", "colour", "natural object"],
		[]
	),
	Word.create(
		"heart",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CandyRed)]
	),
	Word.create(
		"beauty",
		["object"],
		[]
	),
	Word.create(
		"feather",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CadmiumWhite)]
	),
	Word.create(
		"pollen",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.PineappleYellowBlending)]
	),
	Word.create(
		"piece",
		["object"],
		[]
	),
	Word.create(
		"edge",
		["object", "natural object"],
		[]
	),
	Word.create(
		"grain",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TigerOrange)]
	),
	Word.create(
		"fern",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TeaGreen)]
	),
	Word.create(
		"blossom",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.CurrantRed)]
	),
	Word.create(
		"leaf",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.TeaGreen)]
	),
	Word.create(
		"sky",
		["object", "colour", "natural object"],
		[TreeEffect.create(TreeEffect.EffectType.leafColour,TreeEffect.LeafColours.SkyBlue)]
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
