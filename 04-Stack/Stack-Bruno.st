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

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 13:27:45'!
setUp
	|stack finder prefix |
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	prefix := 'Wint'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 12:50:02'!
test01cantFindAnythingOnEmptyStack
	|stack finder prefix |
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	prefix := 'Wint'.
	
	self
		should: [finder find: prefix on: stack.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 13:33:04'!
test02givenAStackWithMatchingElementsElementIsFound
	|stack finder prefix matchedWords|
	stack := OOStack new.
	finder := SentenceFinderByPrefix new.
	prefix := 'Wint'.
	
	stack push: prefix.
	
	matchedWords := finder find: prefix on: stack.
	
	self assert: [(matchedWords at: 1) = prefix].! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'quantity elements status'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 11:41:05'!
errorIfEmpty
	^status errorIfEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 11:29:34'!
initialize
	quantity := 0.
	elements := OrderedCollection new.
	status := NullStack new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 12:19:50'!
isEmpty
	^status isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 12:03:41'!
pop
	self errorIfEmpty.
	quantity := quantity - 1.
	self switchStatusIfRequired.
	^elements removeLast.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 11:54:54'!
push: elementToPush
	elements add: elementToPush.
	quantity := quantity + 1.
	self switchStatusIfRequired.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/12/2022 20:11:47'!
size
	^quantity! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 12:19:04'!
switchStatusIfRequired
	quantity = 0 ifTrue:[^status:= NullStack new].
	status := NotNullStack new.! !

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


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 13:19:44'!
find: aPrefix on: aStack
	|wordsMatched wordToEvaluate|
	wordsMatched := OrderedCollection new.
	wordToEvaluate := aStack pop.
	[wordToEvaluate beginsWith: aPrefix] ifTrue:[wordsMatched add: wordToEvaluate].
	
	[aStack isEmpty] whileFalse: 
		[
			[wordToEvaluate beginsWith: aPrefix] ifTrue:[wordsMatched add: wordToEvaluate].
			wordToEvaluate := aStack pop.
		].
	
	^wordsMatched.	! !


!classDefinition: #State category: 'Stack-Exercise'!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!State methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 11:42:13'!
errorIfEmpty
	^self subclassResponsibility.! !


!classDefinition: #NotNullStack category: 'Stack-Exercise'!
State subclass: #NotNullStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotNullStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 12:17:40'!
errorIfEmpty! !

!NotNullStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 12:17:52'!
isEmpty
	^false.! !

!NotNullStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 11:56:39'!
switchStatusIfRequired
	^NullStack new.! !


!classDefinition: #NullStack category: 'Stack-Exercise'!
State subclass: #NullStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 12:17:26'!
errorIfEmpty
	^self error: OOStack stackEmptyErrorDescription.! !

!NullStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 12:18:01'!
isEmpty
	^true.! !

!NullStack methodsFor: 'as yet unclassified' stamp: 'BS 5/14/2022 11:56:21'!
switchStatusIfRequired
	^NotNullStack new.! !
