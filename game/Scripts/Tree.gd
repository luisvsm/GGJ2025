
class_name gameTree extends Node3D
const BRANCH = preload("res://Prefabs/Branch.tscn")
const LEAF_PLATFORM_SMALL = preload("res://Prefabs/LeafPlatformSmall.tscn")
@onready var attachment_points: Node3D = $AttachmentPoints

var leafPlatforms:Array[LeafPlatform] = []

func _ready() -> void:
	for attachmentPoint in attachment_points.get_children():
		var retryCount = 10
		var newPlatform:LeafPlatform = null
		 
		while newPlatform == null && retryCount > 0:
			print("Trying to grow branch")
			newPlatform = GrowBranch(attachmentPoint.global_position)
			if newPlatform != null:
				leafPlatforms.append(newPlatform)
				retryCount -= 1
	

func GetClosestLeafPlatform(globalPosition:Vector3, maxDistance:float) -> LeafPlatform:
	var closestPlatform:LeafPlatform = null
	var cloststDistance:float
	
	for platform in leafPlatforms:
		var dist = platform.global_position.distance_to(globalPosition)
		if dist < maxDistance && platform.branchIsComplete == false && (closestPlatform == null || cloststDistance > dist) :
			closestPlatform = platform
			cloststDistance = closestPlatform.global_position.distance_to(platform.global_position)
	
	return closestPlatform

func GrowNumberOfBranch(leafToStartAt:LeafPlatform):
	var attachmentPoint = leafToStartAt.GetAttachmentPoint()
	var retryCount = 10
	
	var numberOfBranchesToGrow = 1
	
	for effect in leafToStartAt.treeEffects:
		if effect.type == TreeEffect.EffectType.numberOfBranches:
			numberOfBranchesToGrow += int(effect.value)
			
	if numberOfBranchesToGrow > 0:
		AudioManager.PlaySound("newbranch")
		
	while attachmentPoint != null && numberOfBranchesToGrow > 0 && retryCount > 0:
		var newLeafPlatform = GrowBranch(attachmentPoint.global_position)
		if newLeafPlatform != null:
			leafPlatforms.append(newLeafPlatform)
			numberOfBranchesToGrow -= 1
			leafToStartAt.RemoveAttachmentPoint(attachmentPoint)
		else:
			retryCount -= 1
			
		attachmentPoint = leafToStartAt.GetAttachmentPoint()

	print("GrowNumberOfBranches retryCount: %s"%retryCount)
func GetNewBranch() -> Branch:
	return BRANCH.instantiate()
	
func GetNewLeafPlatform() -> LeafPlatform:
	return LEAF_PLATFORM_SMALL.instantiate()

func TagToWord(tagToFind:String) -> Word:
	print("TagToWord")
	var possibleWords:Array[Word] = []
	tagToFind = tagToFind.to_lower() 
	
	for word in Wordlist.Wordlist:
		for tag in word.tags:
			if tag == tagToFind:
				possibleWords.append(word)
				
	print("possibleWords size: %s"%possibleWords.size())
	
	if possibleWords.size() > 0:
		return possibleWords.pick_random()
	else:
		return null
		
func GrowBranch(spawnPos:Vector3) -> LeafPlatform:
	var branch = GetNewBranch()
	var leafPlatform = GetNewLeafPlatform()
	
	add_child(branch)
	branch.global_position = Vector3(spawnPos)
	
	add_child(leafPlatform)
	leafPlatform.branch = branch
	leafPlatform.global_position = branch.GetEndOfBranchPosition()
	
	if ThereOtherPlatformsThatAreTooClose(leafPlatform):
		remove_child(branch)
		remove_child(leafPlatform)
		return null
		
	return leafPlatform
	
func ThereOtherPlatformsThatAreTooClose(newPlat:LeafPlatform) -> bool:
	for platform in leafPlatforms:
		if platform.position.distance_to(newPlat.position) < platform.platformSize + newPlat.platformSize:
			return true
	
	return false

func Temp(treeEffects:Array[TreeEffect]):
	var numberOfBranches = 1
	
	for effect in treeEffects:
		if effect.type == TreeEffect.EffectType.numberOfBranches:
			numberOfBranches += int(effect.value)
	
	print("Todo: Grow %s branches"%numberOfBranches)
