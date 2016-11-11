"
[ [ [ 
[  'ALTRUISME' isIsogramSetImplementation ] bench 
 ] ] ]

[ [ [ 
[ GramChecker new
	isIsogram2: 'ALTRUISME'] bench  '137,937 per second'
]]]

[ [ [ 
[ GramChecker new
	isIsogram3: 'ALTRUISME'] bench  '390,887 per second'
]]]

[ [ [ 
[ GramChecker new
	isIsogram4: 'ALTRUISME'] bench  '570,193 per second'
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

{ #category : #tests }
GramCheckerTest >> test2Isograms [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogram2: each)]
]

{ #category : #tests }
GramCheckerTest >> test3Isograms [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogram3: each)]
]

{ #category : #tests }
GramCheckerTest >> test4Isograms [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogram4: each)]
]

{ #category : #'tests-isogram-string' }
GramCheckerTest >> testAllIsogramSetImplementation [
	
	self isograms do: [ :word |
		self assert: word isIsogramSetImplementation ]
]

{ #category : #'tests-pangram' }
GramCheckerTest >> testDetectFirstMissingLetter [

	self assert: ('the quick brown fox jumps over the lzy dog' detectMissingLettersFor: 'abcdefghijklmnopqrstuvwxyz') equals: $a.
	self assert: ('the uick brown fox jumps over the lazy dog' detectMissingLettersFor: 'abcdefghijklmnopqrstuvwxyz') equals: $q.
	
	
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
	
	
	self assert: (checker isIsogram: 'ALTRUISME').
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
