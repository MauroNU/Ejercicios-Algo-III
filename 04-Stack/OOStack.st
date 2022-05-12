'From Cuis 6.0 [latest update: #5093] on 12 May 2022 at 8:58:54 pm'!
!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'quantity elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/12/2022 20:20:58'!
errorIfEmpty
	self isEmpty ifTrue: [	^self error: OOStack stackEmptyErrorDescription].! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/12/2022 20:27:02'!
initialize
	quantity := 0.
	elements := OrderedCollection new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/12/2022 20:09:10'!
isEmpty
	quantity = 0 ifTrue:[^true].
	^false.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/12/2022 20:21:29'!
pop
	self errorIfEmpty.
	quantity := quantity - 1.
	^elements removeLast.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/12/2022 20:09:10'!
push: elementToPush
	quantity := quantity + 1.
	elements add: elementToPush.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/12/2022 20:11:47'!
size
	^quantity! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/12/2022 20:21:38'!
top
	self errorIfEmpty.
	^elements at: quantity.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !
