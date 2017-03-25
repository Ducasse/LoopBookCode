Class {
	#name : #SLTileTest,
	#superclass : #TestCase,
	#category : #SnakesAndLadders
}

{ #category : #tests }
SLTileTest >> testPrinting [

	| tile |
	tile := SLTile new position: 6.
	self assert: tile printString equals: '[6]'
]

{ #category : #tests }
SLTileTest >> testPrintingLadder [

	| tile |
	tile := SLLadderTile new position: 2; to: (SLTile new position: 6). 
	self assert: tile printString equals: '[2->6]'
]

{ #category : #tests }
SLTileTest >> testPrintingSnake [

	| tile |
	tile := SLSnakeTile new position: 11; to: (SLTile new position: 5). 
	self assert: tile printString equals: '[5<-11]'
]
