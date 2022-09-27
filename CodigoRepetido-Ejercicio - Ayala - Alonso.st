!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio - Ayala - Alonso'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio - Ayala - Alonso'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio - Ayala - Alonso'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio - Ayala - Alonso'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio - Ayala - Alonso'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'aCustomer1 aCustomer2 customerBookTest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio - Ayala - Alonso'!

!CustomerBookTest methodsFor: 'testing' stamp: 'ga 9/27/2022 16:50:43'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self assert: (self timeAnOperation: [customerBookTest addCustomerNamed: 'John Lennon'.]) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ga 9/27/2022 16:43:12'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	customerBookTest addCustomerNamed: aCustomer2 .
	
	self assert: (self timeAnOperation: [customerBookTest removeCustomerNamed: aCustomer2 ]) < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ga 9/27/2022 16:43:34'!
test03CanNotAddACustomerWithEmptyName

	[ customerBookTest addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBookTest isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ga 9/27/2022 16:44:20'!
test04CanNotRemoveAnInvalidCustomer
	
	customerBookTest addCustomerNamed: aCustomer1 .
	
	[ customerBookTest removeCustomerNamed: aCustomer2 .
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: [customerBookTest checkNumberOfCustomer: 1 andCustomerIsIncluded: aCustomer1 ] ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ga 9/27/2022 16:45:15'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	customerBookTest addCustomerNamed: aCustomer2 .
	customerBookTest suspendCustomerNamed: aCustomer2 .

	self assert: [self in: customerBookTest checkNumberOfActiveClients: 0 andSuspendedClients: 1].
	self assert: (customerBookTest includesCustomerNamed: aCustomer2 ).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ga 9/27/2022 16:46:14'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	
	customerBookTest addCustomerNamed: aCustomer2.
	customerBookTest suspendCustomerNamed: aCustomer2.
	customerBookTest removeCustomerNamed: aCustomer2.
	
	self assert: [self in: customerBookTest checkNumberOfActiveClients: 0 andSuspendedClients: 0].
	self deny: (customerBookTest includesCustomerNamed: aCustomer2 ).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ga 9/27/2022 16:46:56'!
test07CanNotSuspendAnInvalidCustomer
	
	customerBookTest addCustomerNamed: aCustomer1 .
	
	[ customerBookTest suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: [customerBookTest checkNumberOfCustomer: 1 andCustomerIsIncluded: aCustomer1 ] ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'ga 9/27/2022 16:47:48'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	customerBookTest addCustomerNamed: aCustomer1.
	customerBookTest suspendCustomerNamed: aCustomer1.
	
	[ customerBookTest suspendCustomerNamed: aCustomer1.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: [customerBookTest checkNumberOfCustomer: 1 andCustomerIsIncluded: aCustomer1] ]
! !


!CustomerBookTest methodsFor: 'testingTools' stamp: 'ga 9/26/2022 23:18:47'!
milisecondsTakedOfAnActionn: anAction
	|millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	anAction value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	^(millisecondsAfterRunning-millisecondsBeforeRunning).! !


!CustomerBookTest methodsFor: 'testing-helper' stamp: 'TA 9/27/2022 00:21:38'!
in: aCustomerBook checkNumberOfActiveClients: activeClients andSuspendedClients: suspendedClients
	^ aCustomerBook numberOfActiveCustomers = activeClients and: [aCustomerBook numberOfSuspendedCustomers = suspendedClients] and: [aCustomerBook numberOfCustomers = (activeClients + suspendedClients)]! !

!CustomerBookTest methodsFor: 'testing-helper' stamp: 'TA 9/26/2022 23:11:33'!
timeAnOperation: anOperation

	| millisecondsAfterRunning millisecondsBeforeRunning |
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	anOperation  value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ millisecondsAfterRunning - millisecondsBeforeRunning ! !


!CustomerBookTest methodsFor: 'initialization' stamp: 'ga 9/27/2022 16:41:53'!
initialize
	super initialize.
	aCustomer1 := 'Jhon Lennon'.
	aCustomer2 := 'Paul McCartney'.
	customerBookTest  := CustomerBook new.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio - Ayala - Alonso'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio - Ayala - Alonso'!

!CustomerBook methodsFor: 'testing' stamp: 'TA 9/27/2022 00:10:05'!
checkNumberOfCustomer: aNumberOfCustomer andCustomerIsIncluded: aCustomer 
	^ self numberOfCustomers = aNumberOfCustomer and: [self includesCustomerNamed: aCustomer].! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'TA 9/26/2022 23:32:46'!
addCustomerNamed: aName
	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName ) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'TA 9/26/2022 23:27:43'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent: [ suspended remove: aName ifAbsent: [^ NotFound signal.] ].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio - Ayala - Alonso'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
