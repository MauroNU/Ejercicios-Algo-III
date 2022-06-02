!classDefinition: #Tests category: 'MarsRover'!
TestCase subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Tests methodsFor: 'as yet unclassified' stamp: 'BS 6/1/2022 09:38:07'!
test01elRoverNoSeMueveAnteUnComandoVacio
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: ''.
	self assert: (marsRover position = (0@0))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'BS 6/1/2022 09:40:19'!
test02elRoverAvanzaCorrectamente
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'f'.
	
	self assert: (marsRover position = (0@1))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'BS 6/1/2022 09:40:10'!
test03elRoverRetrocedeCorrectamente
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'b'.
	
	self assert: (marsRover position = (0@-1))! !

!Tests methodsFor: 'as yet unclassified' stamp: 'BS 6/1/2022 10:49:40'!
test04elRoverRotaHaciaLaDerecha
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'r'.
	
	self assert: ((marsRover orientation) = (1@0)).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'BS 6/1/2022 10:50:06'!
test05elRoverRotaHaciaLaIzquierda
	|marsRover|
	marsRover _ MarsRover new.
	marsRover receiveComand: 'l'.
	
	self assert: ((marsRover orientation) = (-1@0)).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'BS 6/1/2022 10:50:57'!
test06elRoverRotaYAvanzaCorrectamente
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'rf'.
	
	self assert: (marsRover position = (1@0)) & (marsRover orientation) = (1@0).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'BS 6/1/2022 10:51:19'!
test07elRoverRotaYRetrocedeCorrectamente
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'lb'.
	
	self assert: (marsRover position = (1@0)) & (marsRover orientation) = (-1@0).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'BS 6/1/2022 10:51:33'!
test08elRoverRespondeCorrectamenteAUnStringDeComandosValidos
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveComand: 'lrrrfffbrf'.
	
	self assert: (marsRover position = (-1@-2)) & (marsRover orientation) = (-1@0).! !

!Tests methodsFor: 'as yet unclassified' stamp: 'BS 6/1/2022 10:51:44'!
test09elRoverRespondeCorrectamenteAUnStringConComandoInvalido
	| marsRover |
	marsRover _ MarsRover new.
	
	self
		should: [ marsRover receiveComand: 'lrrrfkffbrf'. ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = 'Comando inválido'].
		
	self assert: (marsRover position = (0@-1)) & (marsRover orientation) = (0@-1).! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position movingDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'actions' stamp: 'BS 6/1/2022 10:10:41'!
moveBackward
	position _ position - movingDirection.! !

!MarsRover methodsFor: 'actions' stamp: 'BS 6/1/2022 10:10:48'!
moveForward
	position _ position + movingDirection.! !

!MarsRover methodsFor: 'actions' stamp: 'MU 5/31/2022 22:28:07'!
receiveComand: commands 
		| anIndex |
		anIndex _ 1.
		
		^self executeCommandsRecursively: commands and: anIndex.
! !

!MarsRover methodsFor: 'actions' stamp: 'BS 6/1/2022 10:48:13'!
turnLeft
	movingDirection _ ((movingDirection y) negated @ movingDirection x).! !

!MarsRover methodsFor: 'actions' stamp: 'BS 6/1/2022 10:48:49'!
turnRight
	movingDirection _ (movingDirection y @ (movingDirection x) negated).! !


!MarsRover methodsFor: 'accessing' stamp: 'BS 6/1/2022 10:10:18'!
orientation
	^movingDirection! !

!MarsRover methodsFor: 'accessing' stamp: 'MU 5/31/2022 19:36:56'!
position
	^position! !


!MarsRover methodsFor: 'validation' stamp: 'MU 5/31/2022 20:08:56'!
commandIsValid: aCommand
	^(aCommand = $f or: aCommand = $b or: aCommand = $r or: aCommand = $l).! !


!MarsRover methodsFor: 'private' stamp: 'MU 5/31/2022 20:42:52'!
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


!MarsRover methodsFor: 'initialization' stamp: 'BS 6/1/2022 10:10:18'!
initialize
	position _ 0@0.
	movingDirection _ 0@1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'MU 5/31/2022 19:01:49'!
invalidCommandError
	^self error: 'Comando inválido'.! !
