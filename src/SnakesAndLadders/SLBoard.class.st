Class {
	#name : #SLBoard,
	#superclass : #Object,
	#instVars : [
		'tiles',
		'players',
		'turns'
	],
	#category : #SnakesAndLadders
}

{ #category : #adding }
SLBoard >> addPlayer: aPlayer [
	players add: aPlayer. 
	aPlayer position: 1.
	(tiles at: 1) addPlayer: aPlayer
]

{ #category : #playing }
SLBoard >> currentPlayer [

	| rest |
	rest := (turns \\ players size). 
	^ players at: (rest isZero 
		ifTrue: [ players size ]
		ifFalse: [ rest ]) 
	
]

{ #category : #initialization }
SLBoard >> initialize [

	players := OrderedCollection new. 
	turns := 0.
]

{ #category : #initialization }
SLBoard >> initializeDefaultTiles [

	1 to: tiles size do: [ :i | 
			tiles at: i put: (SLPositionedTile new position: i) ].
	self setStartTile.
	self setEndTile.
]

{ #category : #testing }
SLBoard >> isOver [

	^ players anySatisfy: [ :each | each position = tiles size ]
]

{ #category : #playing }
SLBoard >> play [


	[ self isOver not ] whileTrue: [
		| roll |
		turns := turns + 1.
		roll := 6 atRandom. 
		self moveCurrentPlayer: roll
	] 
]

{ #category : #printing }
SLBoard >> printOn: aStream [

	tiles do: [ :aTile | 
		aStream << aTile printString ]
]

{ #category : #initialization }
SLBoard >> setEndTile [

	tiles at: tiles size put: (SLEndTile new position: tiles size)
]

{ #category : #initialization }
SLBoard >> setLadderFrom: aSourcePosition to: aTargetPosition [

	tiles at: aSourcePosition put: (SLLadderTile new position: aSourcePosition ; to: aTargetPosition ;yourself)
]

{ #category : #initialization }
SLBoard >> setSnakeFrom: aSourcePosition to: aTargetPosition [

	tiles at: aSourcePosition put: (SLSnakeTile new position: aSourcePosition; to: aTargetPosition)
]

{ #category : #initialization }
SLBoard >> setStartTile [

	tiles at: 1 put: (SLStartTile new position: 1)
]

{ #category : #accessing }
SLBoard >> tileAt: aNumber [

	^ tiles at: aNumber
]

{ #category : #accessing }
SLBoard >> tileNumber: aNumber [

	tiles := Array new: aNumber. 
	self initializeDefaultTiles. 
]

{ #category : #private }
SLBoard >> turns: aNumber [

	turns := aNumber	
]
