Class {
	#name : #SLGameTest,
	#superclass : #TestCase,
	#category : #SnakesAndLadders
}

{ #category : #tests }
SLGameTest >> testCheckingSimpleGame [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: game tileNumber equals: 12
]

{ #category : #tests }
SLGameTest >> testPrintingSimpleGame [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: game printString equals: '[1][2][3][4][5][6][7][8][9][10][11][12]'
]
