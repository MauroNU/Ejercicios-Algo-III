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

!Tests methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 14:02:02'!
test02
	|marsRover|
	marsRover _ MarsRover new.
	marsRover receiveComand: 'f'.
	
	self assert: (marsRover position = (1@0))! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'x y'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 13:57:50'!
initialize
	x _ 0.
	y _ 0! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 13:59:50'!
position
	^(x@y)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MU 5/29/2022 14:01:51'!
receiveComand: aString 
	aString = 'f' ifTrue: [x _ x+1].! !
