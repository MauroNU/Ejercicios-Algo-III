!classDefinition: #Tests category: 'MarsRover'!
TestCase subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 13:58:50'!
test01
	|marsRover|
	marsRover _ MarsRover new.
	self assert: (marsRover position = (0@0))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 18:04:51'!
test02
	|marsRover|
	marsRover _ MarsRover new.
	marsRover receiveComand: 'f'.
	
	self assert: (marsRover position = (0@1))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 18:05:03'!
test03
	|marsRover|
	marsRover _ MarsRover new.
	marsRover receiveComand: 'b'.
	
	self assert: (marsRover position = (0@-1))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 18:05:37'!
test04
	|marsRover|
	marsRover _ MarsRover new.
	marsRover receiveComand: 'rf'.
	
	self assert: (marsRover position = (1@0))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 18:06:31'!
test05
	|marsRover|
	marsRover _ MarsRover new.
	marsRover receiveComand: 'lb'.
	
	self assert: (marsRover position = (1@0))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 18:07:37'!
test06
	|marsRover|
	marsRover _ MarsRover new.
	marsRover receiveComand: 'lrrrfffbrf'.
	
	self assert: (marsRover position = (-1@-2))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 18:19:12'!
test07
	|marsRover|
	marsRover _ MarsRover new.
	
	self
		should: [ marsRover receiveComand: 'lrrrfkffbrf'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'comando inválido' ].
		
	self assert: (marsRover position = (0@-1)).! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:41:27'!
initialize
	position _ 0@0.
	orientation _ North new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:45:56'!
moveBackward
	position _ position + (orientation backwardMovement).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:43:41'!
moveForward
	position _ position + (orientation forwardMovement).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 18:00:07'!
position
	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 18:16:19'!
receiveComand: aString 
	| counter aChar flag |
	counter _ 1.
	(aString size) timesRepeat:[
		flag _ false.
		aChar _ aString at: counter.
		aChar = $f ifTrue: [self moveForward. flag _ true ].
		aChar = $b ifTrue: [self moveBackward. flag _ true].
		aChar = $r ifTrue: [orientation _ orientation turnRight. flag _ true].
		aChar = $l ifTrue: [orientation _ orientation turnLeft. flag _ true].
		flag ifFalse: [self error: 'comando inválido'.].
		counter _ counter +1.
	]! !


!classDefinition: #Orientation category: 'MarsRover'!
Object subclass: #Orientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Orientation methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:46:06'!
backwardMovement
	self subclassResponsibility.! !

!Orientation methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:43:56'!
forwardMovement
	self subclassResponsibility.! !

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

!East methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:48:26'!
backwardMovement
	^(-1@0)! !

!East methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:49:04'!
forwardMovement
	^(1@0)! !

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

!North methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:48:43'!
backwardMovement
	^(0@-1)! !

!North methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:48:50'!
forwardMovement
	^(0@1)! !

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

!South methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:50:23'!
backwardMovement
	^(North new) forwardMovement.! !

!South methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:50:46'!
forwardMovement
	^(North new) backwardMovement.! !

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

!West methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:51:09'!
backwardMovement
	^(East new) forwardMovement.! !

!West methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:51:17'!
forwardMovement
	^(East new) backwardMovement.! !

!West methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:22:11'!
turnLeft
	^South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 17:22:21'!
turnRight
	^North new.! !
