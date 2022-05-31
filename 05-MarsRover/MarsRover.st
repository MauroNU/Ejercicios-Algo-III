!classDefinition: #Tests category: 'MarsRover'!
TestCase subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:36:57'!
test01
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: ''.
	self assert: (marsRover position = (0@0))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:37:02'!
test02
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'f'.
	
	self assert: (marsRover position = (0@1))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:36:41'!
test03
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'b'.
	
	self assert: (marsRover position = (0@-1))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:38:25'!
test04
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'r'.
	
	self assert: ((marsRover orientation) isEast).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:38:33'!
test05
	|marsRover|
	marsRover _ MarsRover new.
	marsRover receiveComand: 'l'.
	
	self assert: ((marsRover orientation) isWest).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:38:17'!
test06
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'rf'.
	
	self assert: (marsRover position = (1@0)) & (marsRover orientation) isEast.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:38:09'!
test07
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'lb'.
	
	self assert: (marsRover position = (1@0)) & (marsRover orientation) isWest.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:39:12'!
test08
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'lrrrfffbrf'.
	
	self assert: (marsRover position = (-1@-2)) & (marsRover orientation) isWest.! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:39:37'!
test09
	| marsRover |
	marsRover _ MarsRover new.
	
	self
		should: [ marsRover receiveComand: 'lrrrfkffbrf'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'Comando inválido'].
		
	self assert: (marsRover position = (0@-1)) & (marsRover orientation) isSouth.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position moving'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:08:56'!
commandIsValid: aCommand
	^(aCommand = $f or: aCommand = $b or: aCommand = $r or: aCommand = $l).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:42:52'!
executeCommandsRecursively: commands and: nextCommandToExecute
	| aCommand |
	
	(nextCommandToExecute > commands size) ifTrue: [^nil].
	
	aCommand _ commands at: nextCommandToExecute.
	(self commandIsValid: aCommand) not ifTrue: [	^MarsRover invalidCommandError].
	aCommand = $f ifTrue: [self moveForward.].
	aCommand = $b ifTrue: [self moveBackward.].
	aCommand = $r ifTrue: [self turnRight.].
	aCommand = $l ifTrue: [self turnLeft.].
			
	self executeCommandsRecursively: commands and: (nextCommandToExecute+1). 
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:37:02'!
initialize
	position _ 0@0.
	moving _ North new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:37:02'!
moveBackward
	position _ position + (moving backwardDirection).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:37:02'!
moveForward
	position _ position + (moving forwardDirection).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:32:11'!
orientation
	^moving! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:36:56'!
position
	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:20:05'!
receiveComand: commands 
		
		| anIndex |
		anIndex _ 1.
		
		^self executeCommandsRecursively: commands and: anIndex.
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:37:02'!
turnLeft
	moving _ moving turnLeft.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:37:02'!
turnRight
	moving _ moving turnRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:01:49'!
invalidCommandError
	^self error: 'Comando inválido'.! !


!classDefinition: #Orientation category: 'MarsRover'!
Object subclass: #Orientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Orientation methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:31:46'!
backwardDirection
	self subclassResponsibility.! !

!Orientation methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:33:47'!
forwardDirection
	self subclassResponsibility.! !

!Orientation methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:30:24'!
isEast
	^false! !

!Orientation methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:30:29'!
isNorth
	^false! !

!Orientation methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:30:37'!
isSouth
	^false! !

!Orientation methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:30:42'!
isWest
	^false! !

!Orientation methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:44:20'!
turnLeft
	self subclassResponsibility ! !

!Orientation methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:44:14'!
turnRight
	self subclassResponsibility ! !


!classDefinition: #East category: 'MarsRover'!
Orientation subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:32:12'!
backwardDirection
	^(-1@0)! !

!East methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:33:47'!
forwardDirection
	^(1@0)! !

!East methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:30:54'!
isEast
	^true! !

!East methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:20:31'!
turnLeft
	^North new.! !

!East methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:20:41'!
turnRight
	^South new.! !


!classDefinition: #North category: 'MarsRover'!
Orientation subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:33:33'!
backwardDirection
	^(0@-1)! !

!North methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:33:47'!
forwardDirection
	^(0@1)! !

!North methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:31:08'!
isNorth
	^true! !

!North methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:19:30'!
turnLeft
	^West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:17:57'!
turnRight
	^East new.! !


!classDefinition: #South category: 'MarsRover'!
Orientation subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:33:47'!
backwardDirection
	^(North new) forwardDirection.! !

!South methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:33:47'!
forwardDirection
	^(North new) backwardDirection.! !

!South methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:31:21'!
isSouth
	^true! !

!South methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:21:24'!
turnLeft
	^East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:21:52'!
turnRight
	^West new.! !


!classDefinition: #West category: 'MarsRover'!
Orientation subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:33:47'!
backwardDirection
	^(East new) forwardDirection.! !

!West methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:33:47'!
forwardDirection
	^(East new) backwardDirection.! !

!West methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 20:31:34'!
isWest
	^true! !

!West methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:22:11'!
turnLeft
	^South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:22:21'!
turnRight
	^North new.! !
