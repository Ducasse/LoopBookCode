Class {
	#name : #SLGame,
	#superclass : #Object,
	#instVars : [
		'tiles',
		'players',
		'turns'
	],
	#category : #SnakesAndLadders
}

{ #category : #adding }
SLGame >> addPlayer: aPlayer [
	players add: aPlayer. 
	aPlayer position: 1.
	(tiles at: 1) addPlayer: aPlayer
]

{ #category : #playing }
SLGame >> currentPlayer [

	| rest |
	rest := (turns \\ players size). 
	^ players at: (rest isZero 
		ifTrue: [ players size ]
		ifFalse: [ rest ]) 
	
]

{ #category : #initialization }
SLGame >> initialize [

	players := OrderedCollection new. 
	turns := 0.
]

{ #category : #initialization }
SLGame >> initializeDefaultTiles [

	1 to: tiles size do: [ :i | 
			tiles at: i put: (SLPositionedTile new position: i) ].
	self setStartTile.
	self setEndTile.
]

{ #category : #testing }
SLGame >> isOver [

	^ players anySatisfy: [ :each | each position = tiles size ]
]

{ #category : #playing }
SLGame >> moveCurrentPlayer: aNumber [

	| p targetTile |
	p := self currentPlayer.
	targetTile := self newPlaceFor: p atDistance: aNumber.
	
 
]

{ #category : #playing }
SLGame >> newPlaceFor: aPlayer atDistance: aNumber [

	^ (self tileAt: aPlayer position + aNumber) 
	
	
]

{ #category : #playing }
SLGame >> placeFor: aPlayer [ 

	^ self tileAt: aPlayer position
	
	
]

{ #category : #playing }
SLGame >> play [


	[ self isOver not ] whileTrue: [
		| roll |
		turns := turns + 1.
		roll := 6 atRandom. 
		self moveCurrentPlayer: roll 
		] 
]

{ #category : #printing }
SLGame >> printOn: aStream [

	tiles do: [ :aTile | 
		aStream << aTile printString ]
]

{ #category : #initialization }
SLGame >> setEndTile [

	tiles at: tiles size put: (SLEndTile new position: tiles size)
]

{ #category : #initialization }
SLGame >> setLadderFrom: aSourcePosition to: aTargetPosition [

	tiles at: aSourcePosition put: (SLLadderTile new position: aSourcePosition ; to: aTargetPosition ;yourself)
]

{ #category : #initialization }
SLGame >> setSnakeFrom: aSourcePosition to: aTargetPosition [

	tiles at: aSourcePosition put: (SLSnakeTile new position: aSourcePosition; to: aTargetPosition)
]

{ #category : #initialization }
SLGame >> setStartTile [

	tiles at: 1 put: SLStartTile new
]

{ #category : #accessing }
SLGame >> tileAt: aNumber [

	^ tiles at: aNumber
]

{ #category : #accessing }
SLGame >> tileNumber: aNumber [

	tiles := Array new: aNumber. 
	self initializeDefaultTiles. 
]

{ #category : #private }
SLGame >> turns: aNumber [

	turns := aNumber	
]
