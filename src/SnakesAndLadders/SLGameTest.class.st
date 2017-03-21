Class {
	#name : #SLGameTest,
	#superclass : #TestCase,
	#category : #SnakesAndLadders
}

{ #category : #tests }
SLGameTest >> testPrintingSimpleGame [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: game tileNumber equals: 12

]

{ #category : #tests }
SLGameTest >> testTileAt [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: (game tileAt: 6) printString equals: '[6]'
]
