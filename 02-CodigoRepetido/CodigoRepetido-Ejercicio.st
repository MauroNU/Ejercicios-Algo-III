!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'BS 5/1/2022 20:50:58'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook johnLennon |
	
	customerBook := CustomerBook new.
	
	johnLennon := 'John Lennon'.
	
	self assert: (customerBook timeTakenToAddACustomerNamed: johnLennon) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MU 5/1/2022 20:24:42'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self assert: (customerBook timeTakenToRemoveACustomerNamed: paulMcCartney) < (100 * millisecond)
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BS 5/1/2022 20:38:46'!
test03CanNotAddACustomerWithEmptyName 
	| customerBook |
	
	customerBook := CustomerBook new.
	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BS 5/1/2022 21:05:53'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon paulMcCartney|
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: johnLennon.
	
	self trySuspendingCustomerNamed: paulMcCartney from: customerBook.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BS 5/1/2022 20:53:44'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addAndSuspendCustomerNamed: paulMcCartney. 
	
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BS 5/1/2022 20:55:22'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addAndSuspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BS 5/1/2022 21:03:26'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon ringoStarr |	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	ringoStarr := 'Ringo Starr'.
	
	customerBook addCustomerNamed: johnLennon.
	
	self trySuspendingCustomerNamed: ringoStarr from: customerBook.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'BS 5/1/2022 21:03:39'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	
	customerBook addAndSuspendCustomerNamed: johnLennon.
	
	self trySuspendingCustomerNamed: johnLennon from: customerBook.! !


!CustomerBookTest methodsFor: 'private' stamp: 'BS 5/1/2022 21:03:08'!
trySuspendingCustomerNamed: aName from: aCustomerBook
	[ aCustomerBook suspendCustomerNamed: aName.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: 'John Lennon') ]
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'BS 5/1/2022 20:54:11'!
addAndSuspendCustomerNamed: aName
	self addCustomerNamed: aName.
	self suspendCustomerNamed: aName.! !

!CustomerBook methodsFor: 'testing' stamp: 'MU 4/30/2022 16:08:22'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'MU 5/1/2022 19:47:59'!
isEmpty
	^active isEmpty and: [ suspended isEmpty ]! !

!CustomerBook methodsFor: 'testing' stamp: 'MU 5/1/2022 20:21:59'!
timeTakenToAddACustomerNamed: aName
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	
	self addCustomerNamed: aName.
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning - millisecondsBeforeRunning )! !

!CustomerBook methodsFor: 'testing' stamp: 'MU 5/1/2022 20:23:55'!
timeTakenToRemoveACustomerNamed: aName
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	
	self removeCustomerNamed: aName.
	
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning - millisecondsBeforeRunning )! !


!CustomerBook methodsFor: 'initialization' stamp: 'MU 5/1/2022 20:08:57'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'MU 5/1/2022 20:17:09'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'MU 5/1/2022 20:06:19'!
numberOfActiveCustomers
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MU 4/30/2022 16:37:12'!
numberOfCustomers
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MU 4/30/2022 16:37:25'!
numberOfSuspendedCustomers
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MU 4/30/2022 16:31:41'!
removeCustomerNamed: aName 
	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent: [
			^ NotFound signal.]].
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'MU 5/1/2022 19:56:10'!
suspendCustomerNamed: aName 

	active remove: aName ifAbsent: [
		^CantSuspend signal].
	
	suspended add: aName.
	
	! !


!CustomerBook methodsFor: 'error signals' stamp: 'MU 4/30/2022 16:37:34'!
signalCustomerAlreadyExists 
	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'error signals' stamp: 'MU 4/30/2022 16:37:38'!
signalCustomerNameCannotBeEmpty 
	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
