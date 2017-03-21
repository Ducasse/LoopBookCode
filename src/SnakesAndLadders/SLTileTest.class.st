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
