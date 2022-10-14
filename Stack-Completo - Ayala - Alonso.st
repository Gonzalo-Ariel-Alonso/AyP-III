!classDefinition: #OOStackTest category: 'Stack-Completo - Ayala - Alonso'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Completo - Ayala - Alonso'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Completo - Ayala - Alonso'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack stackWithNoStrings sentenceFinder stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Completo - Ayala - Alonso'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 10:42:30'!
setUp
	
	emptyStack := OOStack new.
	stackWithNoStrings := OOStack new.
	stackWithNoStrings push: 1.
	stackWithNoStrings push: Object new.
	stackWithNoStrings push: OrderedCollection new.
	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 10:47:15'!
test01SentenceFinderByPrefixOfAnEmptyStackReturnsAnEmptyCollection

	| resultCollection |
	
	resultCollection := sentenceFinder searchByPrefix: 'ho' inStack: emptyStack.
	
	self assert: resultCollection isEmpty description: 'Searching through an Empty Stack should return an empty collection'! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 10:57:28'!
test02SentenceFinderByPrefixWithThatDoesntMatchTheStringReturnsAnEmptyCollection

	| resultCollection |
	
	stack push: 'The moment'.
	stack push: 'The situation'.
	
	resultCollection := sentenceFinder searchByPrefix: 'Win' inStack: stack.
	
	self assert: resultCollection isEmpty description: 'Searching for a prefix that is not present in the Stack should return an empty collection'! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 10:59:04'!
test03SentenceFinderByPrefixReturnsTheAppropiateSizeOfTheMatchingStrings

	| resultCollection |
	
	stack push: 'Awful'.
	stack push: 'Awesome'.
	stack push: 'Good'.
	
	resultCollection := sentenceFinder searchByPrefix: 'Aw' inStack: stack.
	
	self assert: resultCollection size equals: 2! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 11:01:14'!
test04SentenceFinderByPrefixReturnsACollectionWithTheAppropiateMatchingString

	| resultCollection |
	
	stack push: 'Superaman'.
	stack push: 'Batman'.
	stack push: 'Wonderwoman'.
	
	resultCollection := sentenceFinder searchByPrefix: 'Ba' inStack: stack.
	
	self assert: (resultCollection at: 1) equals: 'Batman'! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 11:04:26'!
test05IfMultipleStringsMatchedThePrefixTheyAppearInTheOrderInWhichTheyWerePresentInTheStack

	| resultCollection |
	
	stack push: 'Spiderman 1'.
	stack push: 'Spiderman 2'.
	stack push: 'Spiderman 3'.
	stack push: 'Amazing Spiderman'.
	
	resultCollection := sentenceFinder searchByPrefix: 'Spider' inStack: stack.
	
	self assert: resultCollection size equals: 3.
	
	self assert: (resultCollection at: 1) equals: 'Spiderman 3'.
	self assert: (resultCollection at: 2) equals: 'Spiderman 2'.
	self assert: (resultCollection at: 3) equals: 'Spiderman 1'.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 11:05:06'!
test06AnErrorIsRaisedWhenTryingToSearchThroughAStackThatIsNotPurelyMadeOfStrings

	self should: [ sentenceFinder searchByPrefix: 'in' inStack: stackWithNoStrings ] raise: Error ! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 11:17:52'!
test07TheStackThatWasSearchedThroughtIsUnaltered

	stack push: 'Invincible'.
	stack push: 'Deadpool'.
	stack push: 'Invisible'.
	
	sentenceFinder searchByPrefix: 'In' inStack: stack.
	
	self assert: stack pop equals: 'Invisible'.
	self assert: stack pop equals: 'Deadpool'.
	self assert: stack pop equals: 'Invincible'! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 11:49:11'!
test08TheSearchForThePrefixIsCaseSentive

	| resultCollection |
	
	stack push: 'bokita'.
	stack push: 'bonaerense'.
	stack push: 'Boca'.
	
	resultCollection := sentenceFinder searchByPrefix: 'bo' inStack: stack.
	
	self assert: resultCollection size equals: 2.
	self assert: (resultCollection count: [:string | string = 'Boca']) equals: 0! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 11:51:43'!
test09IfThePrefixIsAnEmptyStringItReturnsAnEmptyCollection

	| resultCollection|
	
	stack push: 'Messi'.
	stack push: 'Aguero'.
	stack push: 'Ronaldo'.
	
	resultCollection := sentenceFinder searchByPrefix: '' inStack: stack.
	
	self assert: resultCollection isEmpty description: 'If an empty string is searched, it should return an empty collection'! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 11:57:07'!
test10IfThePrefixIsAnEmptySpaceItReturnsAnEmptyCollection

	| resultCollection |
	
	stack push: 'Juan Carlos'.
	stack push: 'Jose'.
	stack push: 'juan Cruz'.
	
	resultCollection := sentenceFinder searchByPrefix: ' ' inStack: stack.
	
	self assert: resultCollection isEmpty description: 'If an empty space is searched the resulting collection should be empty'! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'TA 10/14/2022 12:37:52'!
test11AnErrorIsRaisedWhenTryingtoSearchForAPrefixThatIsNotAString
	
	stack push: 'Captain Marvel'.
	stack push: 'She-Hulk'.
	
	self should: [sentenceFinder searchByPrefix: 1 inStack: stack] raise: Error.
	self should: [sentenceFinder searchByPrefix: Object new inStack: stack] raise: Error! !


!classDefinition: #OOStack category: 'Stack-Completo - Ayala - Alonso'!
Object subclass: #OOStack
	instanceVariableNames: 'topContainer size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Completo - Ayala - Alonso'!

!OOStack methodsFor: 'initialization' stamp: 'TA 10/11/2022 12:23:21'!
initialize
	topContainer := OOStackContainerNull new.
	size:= 0.! !


!OOStack methodsFor: 'accesing' stamp: 'TA 10/11/2022 12:24:14'!
isEmpty
	
	^ topContainer isEmpty! !

!OOStack methodsFor: 'accesing' stamp: 'TA 10/11/2022 12:38:09'!
size
	^ size! !


!OOStack methodsFor: 'operations' stamp: 'TA 10/11/2022 12:34:08'!
pop
	| poppedContainer |
	
	poppedContainer := topContainer.
	
	topContainer := topContainer pop.
	
	size := size -1.
	
	^ poppedContainer getElement.! !

!OOStack methodsFor: 'operations' stamp: 'TA 10/11/2022 12:26:51'!
push: anElement
	
	| container |
	
	container := OOStackContainer with: anElement over: topContainer.
	
	topContainer := container.
	
	size := size +1.! !

!OOStack methodsFor: 'operations' stamp: 'TA 10/11/2022 12:36:46'!
top
	
	^ topContainer getElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Completo - Ayala - Alonso'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackElement category: 'Stack-Completo - Ayala - Alonso'!
Object subclass: #OOStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Completo - Ayala - Alonso'!

!OOStackElement methodsFor: 'initialization' stamp: 'TA 10/11/2022 20:53:12'!
initializeWith: anElement over: fatherContainer
 	self subclassResponsibility ! !


!OOStackElement methodsFor: 'operations' stamp: 'TA 10/11/2022 20:53:51'!
pop
	self subclassResponsibility ! !


!OOStackElement methodsFor: 'accessing' stamp: 'TA 10/11/2022 20:54:23'!
getElement
	self subclassResponsibility ! !


!OOStackElement methodsFor: 'testing' stamp: 'TA 10/11/2022 20:54:53'!
isEmpty
	self subclassResponsibility ! !


!classDefinition: #OOStackContainer category: 'Stack-Completo - Ayala - Alonso'!
OOStackElement subclass: #OOStackContainer
	instanceVariableNames: 'element previousContainer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Completo - Ayala - Alonso'!

!OOStackContainer methodsFor: 'initialization' stamp: 'TA 10/11/2022 12:29:25'!
initializeWith: anElement over: fatherContainer
	
	element := anElement.
	previousContainer := fatherContainer ! !


!OOStackContainer methodsFor: 'operations' stamp: 'TA 10/11/2022 12:35:27'!
pop
	^ previousContainer ! !


!OOStackContainer methodsFor: 'accesing' stamp: 'TA 10/11/2022 12:36:03'!
getElement
	
	^ element ! !

!OOStackContainer methodsFor: 'accesing' stamp: 'TA 10/11/2022 12:24:46'!
isEmpty
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackContainer class' category: 'Stack-Completo - Ayala - Alonso'!
OOStackContainer class
	instanceVariableNames: ''!

!OOStackContainer class methodsFor: 'initialization' stamp: 'TA 10/11/2022 12:30:56'!
with: anElement over: previousContainer
	
	^ self new initializeWith: anElement over: previousContainer.! !


!classDefinition: #OOStackContainerNull category: 'Stack-Completo - Ayala - Alonso'!
OOStackElement subclass: #OOStackContainerNull
	instanceVariableNames: 'topContainer size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Completo - Ayala - Alonso'!

!OOStackContainerNull methodsFor: 'operations' stamp: 'TA 10/11/2022 12:40:57'!
pop
	
	Error signal: OOStack stackEmptyErrorDescription.! !


!OOStackContainerNull methodsFor: 'accesing' stamp: 'TA 10/11/2022 12:41:26'!
getElement
	
	Error signal: OOStack stackEmptyErrorDescription .! !

!OOStackContainerNull methodsFor: 'accesing' stamp: 'TA 10/11/2022 12:25:08'!
isEmpty
	
	^ true! !


!OOStackContainerNull methodsFor: 'initialization' stamp: 'TA 10/11/2022 20:55:36'!
initializeWith: anElement over: fatherContainer
! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Completo - Ayala - Alonso'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'resultingCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Completo - Ayala - Alonso'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'TA 10/14/2022 12:17:24'!
emptySpace
	
	^ ' '! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'TA 10/14/2022 12:04:27'!
reverseStack: originalStack into: aStack
	
	[originalStack isEmpty not] whileTrue: [ aStack push: (originalStack pop)]! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'TA 10/14/2022 12:06:16'!
reverseStack: originalStack into: aStack andDo: aBlockClosure

	| aValue |
	
	[originalStack isEmpty not] whileTrue: 
		[
			aValue := originalStack pop.
			aBlockClosure value: aValue.
			aStack push: aValue	
		].! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'TA 10/14/2022 12:15:48'!
searchByPrefix: aPrefix inStack: aStack

	| reversedStack |
	
	resultingCollection := OrderedCollection new.
	reversedStack := OOStack new.
	
	((aPrefix isEmpty) or: (aPrefix includesSubString: self emptySpace)) ifTrue: [ ^resultingCollection ].
	
	self reverseStack: aStack into: reversedStack andDo: [:string | (string beginsWith: aPrefix) ifTrue: [resultingCollection add: string]].
	
	self reverseStack: reversedStack into: aStack.
	
	^ resultingCollection ! !
