!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'MU 5/15/2022 00:58:07'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BS 5/15/2022 16:02:01'!
test01FindInAnEmptyStackDoesNotFindAnything
	| stack finder |
	
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	
	self assert: ((finder find: 'wint' in: stack) size = 0).

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BS 5/15/2022 16:21:59'!
test02CanNotFindAnEmptyPrefix
	| stack finder |
	
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	stack push: 'wit'.
	
	self
		should: [ finder find: '' in:stack ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription ]
		

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BS 5/15/2022 16:47:42'!
test03FindIsCaseSensitive
	| stack finder |
	
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	stack push: 'Wit'.
	
	
	self assert: ((finder find: 'wit' in: stack) size = 0).
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BS 5/15/2022 16:50:19'!
test04CanNotFindAPrefixWithSpaces
	| stack finder |
	
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	stack push: 'wit'.
	
	self
		should: [ finder find: 'wi t' in:stack ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixContainsSpacesErrorDescription ]
		

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'BS 5/15/2022 17:09:49'!
test05FindPrefixFindsManyWordsAndOutputIsOrdered
	| stack finder collection secondCollection |
	
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	collection := OrderedCollection new.
	
	stack push: 'Winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'I like potatoes.'.
	stack push: 'Winter is here'.
	stack push: 'Ash is the worst pokemon trainer of all'.
	
	collection add: 'Winter is coming'.
	collection add: 'Winter is here'.
		
	secondCollection := finder find: 'Wint' in: stack.
	
	self assert: (collection = secondCollection).
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MU 5/15/2022 17:59:43'!
test06FindWithNothingToFindReturnsEmptyCollection
	| stack finder collection secondCollection |
	
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	collection := OrderedCollection new.
	
	stack push: 'Winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'I like potatoes.'.
	stack push: 'Winter is here'.
	stack push: 'Ash is the worst pokemon trainer of all'.
		
	secondCollection := finder find: 'gfgdhr' in: stack.
	
	self assert: (collection = secondCollection).
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'MU 5/14/2022 21:54:55'!
isEmpty
	^state isEmpty.! !

!OOStack methodsFor: 'accessing' stamp: 'MU 5/14/2022 21:56:39'!
size
	^state size.! !

!OOStack methodsFor: 'accessing' stamp: 'MU 5/14/2022 21:56:48'!
top
	^state top.! !


!OOStack methodsFor: 'private' stamp: 'MU 5/14/2022 21:54:37'!
initialize
	state := NullStack new.
	
	! !


!OOStack methodsFor: 'actions' stamp: 'MU 5/15/2022 00:45:17'!
pop
	|elementRemoved|
	
	elementRemoved := state pop.
	state size = 0 ifTrue:[state := NullStack new.].
	
	^elementRemoved.! !

!OOStack methodsFor: 'actions' stamp: 'MU 5/15/2022 00:09:54'!
push: elementToPush
	
	state := state push:elementToPush.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'MU 5/15/2022 00:55:07'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'.! !


!classDefinition: #OOStackState category: 'Stack-Exercise'!
Object subclass: #OOStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackState methodsFor: 'accessing' stamp: 'MU 5/15/2022 12:19:52'!
isEmpty
	self subclassResponsibility.! !

!OOStackState methodsFor: 'accessing' stamp: 'MU 5/15/2022 12:20:20'!
size
	self subclassResponsibility.! !

!OOStackState methodsFor: 'accessing' stamp: 'MU 5/15/2022 12:20:24'!
top
	self subclassResponsibility.! !


!OOStackState methodsFor: 'actions' stamp: 'MU 5/15/2022 12:19:58'!
pop
	self subclassResponsibility.! !

!OOStackState methodsFor: 'actions' stamp: 'MU 5/15/2022 12:20:08'!
push: elementToPush
	self subclassResponsibility.! !


!classDefinition: #NullStack category: 'Stack-Exercise'!
OOStackState subclass: #NullStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullStack methodsFor: 'accessing' stamp: 'MU 5/14/2022 21:33:12'!
isEmpty
	^true.! !

!NullStack methodsFor: 'accessing' stamp: 'MU 5/15/2022 00:14:57'!
size
	^0.! !

!NullStack methodsFor: 'accessing' stamp: 'MU 5/15/2022 15:17:39'!
top
	^self error:(OOStack stackEmptyErrorDescription).! !


!NullStack methodsFor: 'actions' stamp: 'MU 5/15/2022 00:57:32'!
pop
	^self error:(OOStack stackEmptyErrorDescription).! !

!NullStack methodsFor: 'actions' stamp: 'MU 5/15/2022 15:13:42'!
push: elementToPush
	|newStack|
	newStack := RealStack new.
	newStack push: elementToPush.
	^newStack.! !


!classDefinition: #RealStack category: 'Stack-Exercise'!
OOStackState subclass: #RealStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!RealStack methodsFor: 'initialization' stamp: 'MU 5/14/2022 22:11:41'!
initialize
	elements := OrderedCollection new.! !


!RealStack methodsFor: 'accessing' stamp: 'MU 5/14/2022 21:55:10'!
isEmpty
	^false.! !

!RealStack methodsFor: 'accessing' stamp: 'MU 5/14/2022 21:57:38'!
size
	^elements size.! !

!RealStack methodsFor: 'accessing' stamp: 'MU 5/14/2022 22:13:37'!
top
	^elements last.! !


!RealStack methodsFor: 'actions' stamp: 'MU 5/14/2022 22:02:55'!
pop
	^elements removeLast.! !

!RealStack methodsFor: 'actions' stamp: 'BS 5/15/2022 17:27:30'!
push: elementToPush
	elements add: elementToPush.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'BS 5/15/2022 17:27:44'!
find: aPrefix in: aStack
	| collectionAux selectedCollection |
	
	self checkValid: aPrefix.
	
	collectionAux := OrderedCollection new.
	(aStack size) timesRepeat: [ collectionAux addFirst: (aStack pop)].
	
	selectedCollection := collectionAux select: [:string | string beginsWith: aPrefix].
	
	 ^selectedCollection .
	
	! !


!SentenceFinderByPrefix methodsFor: 'checking' stamp: 'MU 5/15/2022 18:00:31'!
checkValid: aPrefix.
	"Si bien estos chequeos se podrían resolver de otra manera sin usar if, ninguna de las soluciones que encontramos nos resultó adecuada ya que todas incluian 
	sobremodelar para algo tan simple como esto."
	
	aPrefix isEmpty ifTrue:[self error:(SentenceFinderByPrefix prefixEmptyErrorDescription)].
	(aPrefix findString: ' ') = 0 ifFalse:[self error:(SentenceFinderByPrefix prefixContainsSpacesErrorDescription)].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'BS 5/15/2022 16:50:48'!
prefixContainsSpacesErrorDescription
	
	^ 'Prefix contains spaces'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'BS 5/15/2022 16:17:47'!
prefixEmptyErrorDescription
	
	^ 'Prefix is empty'.! !
