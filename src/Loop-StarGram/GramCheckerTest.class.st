"
[ [ [ 
[  'ALTRUISME' isIsogramSetImplementation ] bench  '334,371 per second'

[  'ALTRUISME' isIsogramFastestImplementation ] bench  '546,823 per second'

[  'ALTRUISME' isIsogramUsingBagImplementation ] bench  '142,432 per second'

[  'ALTRUISME' isIsogramDictionaryImplementation ] bench  '147,276 per second'
]]]


"
Class {
	#name : #GramCheckerTest,
	#superclass : #TestCase,
	#category : #'Loop-StarGram'
}

{ #category : #data }
GramCheckerTest >> isograms [
	^  #('pharo' 'pathfinder' 'xavier' 'francois' 'lumberjack' 'altruisme' 'antipode')
]

{ #category : #'tests-isogram-string' }
GramCheckerTest >> testAllIsogramFastestImplementation [
	
	self isograms do: [ :word |
		self assert: word isIsogramFastestImplementation ]
]

{ #category : #'tests-isogram-string' }
GramCheckerTest >> testAllIsogramSetImplementation [
	
	self isograms do: [ :word |
		self assert: word isIsogramSetImplementation ]
]

{ #category : #'tests-pangram' }
GramCheckerTest >> testDetectAllMissingLetters [

	self assert: ('the quick brown fox jumps over the lzy do' detectAllMissingLettersFor: 'abcdefghijklmnopqrstuvwxyz') equals:  (Set withAll: #($a $g)).
	self assert: ('the uick brwn fx jumps ver the lazy dg' detectAllMissingLettersFor: 'abcdefghijklmnopqrstuvwxyz') equals: #($q $o) asSet.
	
	
]

{ #category : #'tests-pangram' }
GramCheckerTest >> testDetectFirstMissingLetter [

	self assert: ('the quick brown fox jumps over the lzy dog' detectFirstMissingLetterFor: 'abcdefghijklmnopqrstuvwxyz') equals: $a.
	self assert: ('the uick brown fox jumps over the lazy dog' detectFirstMissingLetterFor: 'abcdefghijklmnopqrstuvwxyz') equals: $q.
	
	
]

{ #category : #'tests-pangram' }
GramCheckerTest >> testIsEnglishPangram [

	self assert: 'the quick brown fox jumps over the lazy dog' isEnglishPangram.
	self assert: 'the five boxing wizards jump quickly' isEnglishPangram.
	self deny: 'the quick brown fox jumps over the  dog' isEnglishPangram.
]

{ #category : #'tests-pangram' }
GramCheckerTest >> testIsPangramIn [

	self assert: ('The quick brown fox jumps over the lazy dog' isPangramIn: 'abcdefghijklmnopqrstuvwxyz').
	self assert: ('ma papa mama' isPangramIn: 'apm').
	
]

{ #category : #tests }
GramCheckerTest >> testIsogram [
	| checker |
	checker := GramChecker new.
	self assert: (checker isIsogramFastest: 'ALTRUISME').
]

{ #category : #tests }
GramCheckerTest >> testIsogramBag [
	| checker |
	checker := GramChecker new.
	self assert: (checker isIsogramBag: 'ALTRUISME').
]

{ #category : #tests }
GramCheckerTest >> testIsogramDict [
	| checker |
	checker := GramChecker new.
	self assert: (checker isIsogramDictionaryImplementation: 'ALTRUISME').
]

{ #category : #'tests-isogram-string' }
GramCheckerTest >> testIsogramSetImplementation [
	
	self assert: 'pharo' isIsogramSetImplementation.
	self assert: 'pharo' isIsogramSetImplementation equals: true.
	
	self assert: 'phaoro' isIsogramSetImplementation not.
	self deny: 'phaoro' isIsogramSetImplementation.
]

{ #category : #tests }
GramCheckerTest >> testIsograms [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogram: each)]
]

{ #category : #tests }
GramCheckerTest >> testIsogramsFastest [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogramFastest: each)]
]

{ #category : #tests }
GramCheckerTest >> testIsogramsSetImp [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogramSetImplementation: each)]
]
