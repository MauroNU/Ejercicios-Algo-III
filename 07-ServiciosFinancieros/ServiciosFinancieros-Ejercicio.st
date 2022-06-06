!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BS 6/5/2022 21:57:03'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	Deposit register: 50 * peso on: account.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BS 6/5/2022 22:00:09'!
test05ReceptiveAccountFailsWithdrawWithNoBalance 

	|account|
	
	account := ReceptiveAccount new.
	
	self should:
		[Withdraw register: 50 * peso on: account]
		raise: Error 
		withExceptionDo: [:anError | 
			self assert: anError messageText = 'Lack of funds.']! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BS 6/5/2022 22:00:17'!
test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BS 6/5/2022 22:01:33'!
test07ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BS 6/5/2022 22:01:02'!
test08AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BS 6/5/2022 22:00:52'!
test09
	|JorgesAccount PepesAccount|
	
	JorgesAccount := ReceptiveAccount new.
	PepesAccount := ReceptiveAccount new.
	
	Deposit register: 50 * peso on: JorgesAccount.
	JorgesAccount transfer: 30 * peso to: PepesAccount.
	
	self assert: 20 * peso equals: JorgesAccount balance.
	self assert: 30 * peso equals: PepesAccount balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'BS 6/5/2022 22:00:48'!
test10
	|JorgesAccount PepesAccount|
	
	JorgesAccount := ReceptiveAccount new.
	PepesAccount := ReceptiveAccount new.
	
	self should:
		[JorgesAccount transfer: 30 * peso to: PepesAccount.]
		raise: Error 
		withExceptionDo: [:anError | 
			self assert: anError messageText = 'Lack of funds.']! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'BS 6/2/2022 21:20:28'!
giveValueForBalance
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'BS 6/5/2022 21:55:25'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!AccountTransaction class methodsFor: 'as yet unclassified' stamp: 'BS 6/5/2022 21:52:27'!
noFundsError
	^self error: 'Lack of funds.'.! !

!AccountTransaction class methodsFor: 'as yet unclassified' stamp: 'BS 6/5/2022 21:45:55'!
transfer: anAmount from: originAccount to: destinationAccount	
	Withdraw register: anAmount on: originAccount.
	Deposit register: anAmount on: destinationAccount.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'BS 6/2/2022 21:21:07'!
giveValueForBalance
	^self value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'BS 6/2/2022 21:11:30'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'BS 6/2/2022 21:21:16'!
giveValueForBalance
	^self value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'BS 6/2/2022 21:18:14'!
for: aValue

	^ self new initializeFor: aValue! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'BS 6/5/2022 21:54:57'!
register: aValue on: account

	| transaction |
	
	(aValue <= account balance) ifFalse: [^AccountTransaction noFundsError].
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'BS 6/2/2022 21:42:57'!
balance
	^transactions sum: [ :aTransaction | aTransaction giveValueForBalance] ifEmpty: [ 0 ]
	
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'BS 6/5/2022 21:39:51'!
transfer: anAmount to: destinationAccount
	AccountTransaction transfer: anAmount from: self to: destinationAccount! !
