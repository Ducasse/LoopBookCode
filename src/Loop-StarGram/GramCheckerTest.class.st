"
[ [ [ 
[ GramChecker new
	isIsogram: 'ALTRUISME'] bench '99,720 per second'
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

{ #category : #'as yet unclassified' }
GramCheckerTest >> isograms [
	^ #('PHARO' 'PATHFINDER' 'XAVIER' 'LUMBERJACK' 'ALTRUISME')
]

{ #category : #'as yet unclassified' }
GramCheckerTest >> test2Isograms [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogram2: each)]
]

{ #category : #'as yet unclassified' }
GramCheckerTest >> test3Isograms [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogram3: each)]
]

{ #category : #'as yet unclassified' }
GramCheckerTest >> test4Isograms [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogram4: each)]
]

{ #category : #'as yet unclassified' }
GramCheckerTest >> testIsogram [
	| checker |
	checker := GramChecker new.
	
	
	self assert: (checker isIsogram: 'ALTRUISME').
]

{ #category : #'as yet unclassified' }
GramCheckerTest >> testIsograms [
	| checker |
	checker := GramChecker new.
	
	self isograms do: [ :each |
		self assert: (checker isIsogram: each)]
]
