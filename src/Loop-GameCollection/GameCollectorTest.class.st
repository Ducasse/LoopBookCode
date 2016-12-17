Class {
	#name : #GameCollectorTest,
	#superclass : #TestCase,
	#category : #'Loop-GameCollection'
}

{ #category : #tests }
GameCollectorTest >> testCreatingFromSton [
	| read instance |
	read := (STONReader
		on:
			'GameItem{#title:''Klonoa'',#kind:#PS2,#hasDoc:true,#grade:''(16/15)'',#stars:3,#isCollectorEdition:true,#paidPrice:1}'
				readStream) next.
	instance := GameItem exampleKlonoa.
	self assert: (read sameAs: instance) 
]

{ #category : #tests }
GameCollectorTest >> testCreatingFromStonMultipleInstances [
	| read |
	read := (STONReader
		on:
			'[GameItem{#title:''Klonoa'',#kind:#PS2,#hasDoc:true,#grade:''(16/15)'',#stars:3,#isCollectorEdition:true,#paidPrice:1},GameItem{#title:''Wild Arm'',#kind:#PS2,#hasDoc:true,#grade:''(16/15)'',#stars:3,#isCollectorEdition:true,#paidPrice:1}]'
				readStream) next.
	self assert: (read first sameAs: GameItem exampleKlonoa).
	self assert: (read second sameAs: GameItem exampleWildArm)
]

{ #category : #tests }
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

{ #category : #tests }
GameCollectorTest >> testSton [
	self assert: (STON toString: GameItem exampleKlonoa) equals:  'GameItem{#title:''Klonoa'',#kind:#PS2,#hasDoc:true,#grade:''(16/15)'',#stars:3,#isCollectorEdition:true,#paidPrice:1}'.
	
	self assert: (STON toString: {GameItem exampleKlonoa . GameItem exampleWildArm}) equals: '[GameItem{#title:''Klonoa'',#kind:#PS2,#hasDoc:true,#grade:''(16/15)'',#stars:3,#isCollectorEdition:true,#paidPrice:1},GameItem{#title:''Wild Arm'',#kind:#PS2,#hasDoc:true,#grade:''(16/15)'',#stars:3,#isCollectorEdition:true,#paidPrice:1}]'
]

{ #category : #tests }
GameCollectorTest >> testStonPretty [
	self
		assert: (STON toStringPretty: GameItem exampleKlonoa)
		equals:
			'GameItem {
	#title : ''Klonoa'',
	#kind : #PS2,
	#hasDoc : true,
	#grade : ''(16/15)'',
	#stars : 3,
	#isCollectorEdition : true,
	#paidPrice : 1
}'.
	self
		assert:
			(STON
				toStringPretty:
					{GameItem exampleKlonoa.
					GameItem exampleWildArm})
		equals:
			 '[
	GameItem {
		#title : ''Klonoa'',
		#kind : #PS2,
		#hasDoc : true,
		#grade : ''(16/15)'',
		#stars : 3,
		#isCollectorEdition : true,
		#paidPrice : 1
	},
	GameItem {
		#title : ''Wild Arm'',
		#kind : #PS2,
		#hasDoc : true,
		#grade : ''(16/15)'',
		#stars : 3,
		#isCollectorEdition : true,
		#paidPrice : 1
	}
]'
]
