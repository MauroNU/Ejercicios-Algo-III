!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'WithdrawAndDepositTests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'WithdrawAndDepositTests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'WithdrawAndDepositTests' stamp: 'MU 6/7/2022 21:36:17'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	Deposit register: 50*peso on: account.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !


!ReceptiveAccountTest methodsFor: 'ListOfTransactionsTests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'ListOfTransactionsTests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'ListOfTransactionsTests' stamp: 'BS 6/9/2022 14:55:34'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account allTransactions size.
	self assert: (account allTransactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'TransferenceTests' stamp: 'MU 6/7/2022 21:36:46'!
test08ReceptiveAccountReceivesTransferenceCorrectly

	| account account2 |
	
	account := ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 50*peso on: account.
	Transference register: 50*peso from: account to: account2.
		
	self assert: account2 balance equals: 50*peso.
! !

!ReceptiveAccountTest methodsFor: 'TransferenceTests' stamp: 'MU 6/7/2022 21:03:24'!
test09EmitterAccountHasLessMoney

	| account account2 |
	
	account := ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 75*peso on: account.
	Transference register: 50*peso from: account to: account2.
		
	self assert: account balance equals: 25*peso.
! !

!ReceptiveAccountTest methodsFor: 'TransferenceTests' stamp: 'MU 6/7/2022 21:35:03'!
test10CantTransferIfAccountLacksFunds

	| account account2 |
	
	account := ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 75*peso on: account.
		
	self should: [Transference register: 150*peso from: account to: account2.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText = AccountTransaction insufficientFundsErrorMessage ].
! !

!ReceptiveAccountTest methodsFor: 'TransferenceTests' stamp: 'BS 6/9/2022 14:57:19'!
test11AccountRecognizesTransference
	
	| account transference account2 |
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 75*peso on: account.
	transference _ Transference register: 50*peso from: account to: account2.
	
	self assert: (account allTransactions includes: transference withdraw).
	self assert: (account2 allTransactions includes: transference deposit).

	
! !

!ReceptiveAccountTest methodsFor: 'TransferenceTests' stamp: 'BS 6/9/2022 14:57:42'!
test12AnAccountTransferenceLegsRecognizeTheirCounterparts
	
	| account transference account2 |
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 75*peso on: account.
	transference _ Transference register: 50*peso from: account to: account2.
	
	self assert: ((transference deposit) counterpart = (account allTransactions) last).
	self assert: ((transference withdraw) counterpart = (account2 allTransactions) last).
	
! !


!ReceptiveAccountTest methodsFor: 'PortfolioTests' stamp: 'MU 6/8/2022 20:02:49'!
test13APortfolioCanAssociateAccounts
	
	| account portfolio account2 |
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	
	portfolio register: account.
	portfolio register: account2.
	
	self assert: portfolio size = 2.
! !

!ReceptiveAccountTest methodsFor: 'PortfolioTests' stamp: 'MU 6/8/2022 19:23:55'!
test14APortfolioCanReturnATotalBalance
	
	| account portfolio account2 |
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	
	Deposit register: 40*peso on: account.
	Deposit register: 60*peso on: account2.
	
	portfolio register: account.
	portfolio register: account2.
	
	self assert: (portfolio balance) = (100*peso).
! !

!ReceptiveAccountTest methodsFor: 'PortfolioTests' stamp: 'MU 6/8/2022 20:11:55'!
test15PortfolioKnowsIfItHasTransactions
	
	| account portfolio account2 |
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	
	Deposit register: 40*peso on: account.
	Deposit register: 60*peso on: account2.
	
	portfolio register: account.
	portfolio register: account2.
	
	self assert: portfolio hasTransactions.
! !

!ReceptiveAccountTest methodsFor: 'PortfolioTests' stamp: 'MU 6/8/2022 19:29:40'!
test16PortfolioCanReturnAllTransactions
	
	| account portfolio account2 transactions |
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	transactions _ OrderedCollection new.
	
	transactions add: (Deposit register: 40*peso on: account).
	transactions add: (Deposit register: 60*peso on: account2).
	transactions add: (Withdraw register: 25*peso on: account2).
	
	
	portfolio register: account.
	portfolio register: account2.
	
	self assert: (portfolio allTransactions) = transactions.
! !

!ReceptiveAccountTest methodsFor: 'PortfolioTests' stamp: 'MU 6/8/2022 20:02:54'!
test17APortfolioCanAssociatePortfolios
	
	| account portfolio account2 portfolio2 |
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	portfolio2 _ Portfolio new.
	
	portfolio register: account.
	portfolio register: account2.
	
	portfolio2 register: portfolio.
	
	self assert: portfolio2 size = 2.
! !

!ReceptiveAccountTest methodsFor: 'PortfolioTests' stamp: 'MU 6/8/2022 20:06:48'!
test18APortfolioWithPortfoliosCanReturnATotalBalance
	
	| account portfolio account2 account3 portfolio2 |
	
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	account3 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	portfolio2 _ Portfolio new.
	
	Deposit register: 40*peso on: account.
	Deposit register: 60*peso on: account2.
	Withdraw register: 15*peso on: account2.
	Deposit register: 20*peso on: account3.
	
	portfolio register: account.
	portfolio register: account2.
	portfolio2 register: portfolio.
	portfolio2 register: account3.
	
	self assert: (portfolio2 balance) = (105*peso).
! !

!ReceptiveAccountTest methodsFor: 'PortfolioTests' stamp: 'MU 6/8/2022 20:11:55'!
test19PortfolioWithPortfoliosKnowsIfItHasTransactions
	
	| account portfolio account2 account3 portfolio2 |
	
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	account3 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	portfolio2 _ Portfolio new.
	
	Deposit register: 40*peso on: account.
	Deposit register: 60*peso on: account2.
	Withdraw register: 15*peso on: account2.
	Deposit register: 20*peso on: account3.
	
	portfolio register: account.
	portfolio register: account2.
	portfolio2 register: portfolio.
	portfolio2 register: account3.
	
	self assert: portfolio hasTransactions.
! !

!ReceptiveAccountTest methodsFor: 'PortfolioTests' stamp: 'MU 6/8/2022 20:16:19'!
test20PortfolioWithPortfoliosCanReturnAllTransactions
	
	| account portfolio account2 account3 portfolio2 transactions |
	
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	account3 _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	portfolio2 _ Portfolio new.
	transactions _ OrderedCollection new.
	
	transactions add: (Deposit register: 40*peso on: account).
	transactions add: (Deposit register: 60*peso on: account2).
	transactions add: (Withdraw register: 15*peso on: account2).
	transactions add: (Deposit register: 20*peso on: account3).
	
	portfolio register: account.
	portfolio register: account2.
	portfolio2 register: portfolio.
	portfolio2 register: account3.
	
	self assert: (portfolio2 allTransactions) = transactions.
! !

!ReceptiveAccountTest methodsFor: 'PortfolioTests' stamp: 'BS 6/9/2022 17:13:59'!
test21PortfolioCannotAddADuplicatedAccount
	
	| account portfolio|
	account _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	
	portfolio register: account.
	
	self should: [portfolio register: account.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText = Portfolio accountAlreadyExistsError ].! !

!ReceptiveAccountTest methodsFor: 'PortfolioTests' stamp: 'BS 6/9/2022 15:29:21'!
test22DuplicatedAccountDoesNotAddsToAnidatedPortfolio	
	| account portfolio portfolio2 |
	account _ ReceptiveAccount new.
	portfolio _ Portfolio new.
	portfolio2 _ Portfolio new.
	
	portfolio2 register: account.
	portfolio register: portfolio2.
	
	self should: [portfolio register: account.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText = Portfolio accountAlreadyExistsError ].! !

!ReceptiveAccountTest methodsFor: 'PortfolioTests' stamp: 'BS 6/9/2022 15:33:19'!
test23PortfolioCanNotRegisterItself
	| portfolio |
	portfolio _ Portfolio new.
	
	self should: [portfolio register: portfolio.]
		raise: Error
		withExceptionDo: [:anError | self assert: anError messageText = Portfolio tryingToRegisterItselfError].! !


!ReceptiveAccountTest methodsFor: 'ReceptiveAccountTests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
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


!Deposit methodsFor: 'funds' stamp: 'MU 6/7/2022 21:13:13'!
enoughFunds: anAmount
	^true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
Deposit subclass: #TransferDeposit
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'association' stamp: 'MU 6/8/2022 18:45:44'!
associateWith: aWithdraw
	counterpart _ aWithdraw.! !

!TransferDeposit methodsFor: 'association' stamp: 'MU 6/8/2022 18:38:16'!
counterpart
	^counterpart! !


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


!Withdraw methodsFor: 'funds' stamp: 'MU 6/7/2022 21:36:09'!
enoughFunds: anAmount
	^value <= anAmount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Withdraw subclass: #TransferWithdraw
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'association' stamp: 'MU 6/8/2022 18:45:58'!
associateWith: aDeposit
	counterpart _ aDeposit.! !

!TransferWithdraw methodsFor: 'association' stamp: 'MU 6/8/2022 18:38:28'!
counterpart
	^counterpart! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'associatedAccounts fatherPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'validation' stamp: 'BS 6/9/2022 16:56:58'!
isNewFinancialRecordAlreadyRegistered: financialRecordToRegister
	(associatedAccounts anySatisfy: [:aFinancialRecord| aFinancialRecord contains: financialRecordToRegister]) ifTrue: [^self error: Portfolio accountAlreadyExistsError].! !

!Portfolio methodsFor: 'validation' stamp: 'BS 6/9/2022 16:02:39'!
isNewFinancialRecordSelf: accountToRegister
	(self = accountToRegister) ifTrue: [^self error: Portfolio tryingToRegisterItselfError].! !


!Portfolio methodsFor: 'transactions' stamp: 'MU 6/8/2022 20:14:01'!
allTransactions
	| allTransactions |
	allTransactions _ OrderedCollection new.
	associatedAccounts do: [:anAccount | (anAccount allTransactions) do: [:aTransaction | allTransactions add: aTransaction]].
	^allTransactions.! !

!Portfolio methodsFor: 'transactions' stamp: 'MU 6/8/2022 20:12:44'!
hasTransactions
	^associatedAccounts anySatisfy: [:anAccount | anAccount hasTransactions].! !


!Portfolio methodsFor: 'accounts' stamp: 'MU 6/8/2022 19:21:48'!
balance
	^associatedAccounts sum: [:anAccount | anAccount balance.]! !

!Portfolio methodsFor: 'accounts' stamp: 'BS 6/9/2022 16:16:51'!
contains: anAccount
	^associatedAccounts anySatisfy: [:associatedAccount | associatedAccount = anAccount].! !

!Portfolio methodsFor: 'accounts' stamp: 'MU 6/8/2022 20:02:35'!
size
	^associatedAccounts sum: [:anAccount| anAccount size].! !


!Portfolio methodsFor: 'initialization' stamp: 'BS 6/9/2022 16:31:22'!
initialize
	associatedAccounts _ OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'BS 6/9/2022 16:35:01'!
register: financialRecordToRegister
	
	self isNewFinancialRecordSelf: financialRecordToRegister.
	
	self isNewFinancialRecordAlreadyRegistered: financialRecordToRegister.
	
	financialRecordToRegister setFather: self.
	associatedAccounts add: financialRecordToRegister.! !

!Portfolio methodsFor: 'initialization' stamp: 'BS 6/9/2022 16:34:28'!
setFather: aPortfolio
	fatherPortfolio _ aPortfolio.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'BS 6/9/2022 14:42:47'!
accountAlreadyExistsError
	^'The account is already registered in this portfolio'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'BS 6/9/2022 15:34:03'!
tryingToRegisterItselfError
	^'A portfolio cannot register itself.'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MU 6/8/2022 20:14:12'!
allTransactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MU 6/8/2022 19:00:55'!
balance

	^transactions sum: [ :aTransaction | ((aTransaction class = Withdraw) or: (aTransaction class = TransferWithdraw)) ifTrue:[aTransaction value negated] 
		ifFalse: [aTransaction value] ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'BS 6/9/2022 15:15:11'!
contains: anAccount
	^ self = anAccount.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MU 6/8/2022 20:12:34'!
hasTransactions 

	^ (transactions size) > 0! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'BS 6/9/2022 16:35:35'!
setFather: aPortfolio
	self.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MU 6/8/2022 20:02:01'!
size
	^1.! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'MU 6/8/2022 18:45:15'!
initializeWith: aDeposit and: aWithdraw
	deposit _ aDeposit.	
	withdraw _ aWithdraw.
	deposit associateWith: withdraw.
	withdraw associateWith: deposit.
	value _ deposit value.
 ! !


!Transference methodsFor: 'access' stamp: 'MU 6/7/2022 21:57:57'!
deposit
	^deposit.! !

!Transference methodsFor: 'access' stamp: 'MU 6/7/2022 21:58:11'!
withdraw
	^withdraw.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'category-name' stamp: 'MU 6/8/2022 18:43:55'!
register: anAmount from: originAccount to: destinationAccount
	| withdraw deposit |
	withdraw _ TransferWithdraw register: anAmount on: originAccount. 
	deposit _ TransferDeposit register: anAmount on: destinationAccount.
	^self new initializeWith: deposit and: withdraw.! !
