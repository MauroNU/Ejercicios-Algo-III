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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MU 6/7/2022 21:36:17'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	Deposit register: 50*peso on: account.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MU 6/7/2022 21:36:46'!
test08ReceptiveAccountReceivesTransferenceCorrectly

	| account account2 |
	
	account := ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 50*peso on: account.
	Transference register: 50*peso from: account to: account2.
		
	self assert: account2 balance equals: 50*peso.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MU 6/7/2022 21:03:24'!
test09EmitterAccountHasLessMoney

	| account account2 |
	
	account := ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 75*peso on: account.
	Transference register: 50*peso from: account to: account2.
		
	self assert: account balance equals: 25*peso.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MU 6/7/2022 21:35:03'!
test10CantTransferIfAccountLacksFunds

	| account account2 |
	
	account := ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 75*peso on: account.
		
	self should: [Transference register: 150*peso from: account to: account2.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText = AccountTransaction insufficientFundsErrorMessage ].
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MU 6/7/2022 22:00:38'!
test11AccountRecognizesTransference
	
	| account transference account2 |
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 75*peso on: account.
	transference _ Transference register: 50*peso from: account to: account2.
	
	self assert: (account transactions includes: transference withdraw).
	self assert: (account2 transactions includes: transference deposit).

	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MU 6/7/2022 22:03:09'!
test12AnAccountTransferenceDepositCanReturnHisCounterpart
	
	| account transference account2 |
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 75*peso on: account.
	transference _ Transference register: 50*peso from: account to: account2.
	
	self assert: ((transference deposit) counterpart = (account2 transactions) last).
	
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'MU 6/7/2022 21:34:40'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	(transaction enoughFunds: account balance) ifFalse: [^self error: self insufficientFundsErrorMessage ].
	account register: transaction.
		
	^ transaction! !


!AccountTransaction class methodsFor: 'as yet unclassified' stamp: 'MU 6/7/2022 21:34:17'!
insufficientFundsErrorMessage
	^'Account has insufficient funds'.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'MU 6/7/2022 21:13:13'!
enoughFunds: anAmount
	^true.! !

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


!Withdraw methodsFor: 'value' stamp: 'MU 6/7/2022 20:39:32'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'MU 6/7/2022 21:36:09'!
enoughFunds: anAmount
	^value <= anAmount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MU 6/7/2022 20:44:22'!
balance

	^transactions sum: [ :aTransaction | (aTransaction class = Withdraw) ifTrue:[aTransaction value negated] ifFalse: [aTransaction value] ] ifEmpty: [ 0 ]! !

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


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'as yet unclassified' stamp: 'MU 6/7/2022 21:57:57'!
deposit
	^deposit.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'MU 6/7/2022 21:59:34'!
initializeWith: aDeposit and: aWithdraw
	deposit _ aDeposit.	
	withdraw _ aWithdraw ! !

!Transference methodsFor: 'as yet unclassified' stamp: 'MU 6/7/2022 21:58:11'!
withdraw
	^withdraw.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'category-name' stamp: 'MU 6/7/2022 22:00:01'!
register: anAmount from: originAccount to: destinationAccount
	|withdraw deposit|
	withdraw _ Withdraw register: anAmount on: originAccount. 
	deposit _ Deposit register: anAmount on: destinationAccount.
	^self new initializeWith: deposit and: withdraw.! !