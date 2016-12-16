Class {
	#name : #GameCollectorTest,
	#superclass : #TestCase,
	#category : #'Loop-GameCollection'
}

{ #category : #'as yet unclassified' }
GameCollectorTest >> testFindGame [
	
	| collector |
	collector := GameCollector new.
	collector
		addGame: GameItem exampleKlonoa; 
		addGame: GameItem exampleWildArm.
		
	self assert: (collector findMatchingTitle: '') size equals: 2.
	self assert: (collector findMatchingTitle: 'k') size equals: 1.
	self assert: (collector findMatchingTitle: 'l') size equals: 2.
	self assert: (collector findMatchingTitle: 'w') size equals: 1
]
