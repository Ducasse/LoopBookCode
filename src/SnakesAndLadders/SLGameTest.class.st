Class {
	#name : #SLGameTest,
	#superclass : #TestCase,
	#category : #SnakesAndLadders
}

{ #category : #'tests start' }
SLGameTest >> testCheckingSimpleGame [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: game tileNumber equals: 12
]

{ #category : #'tests moving' }
SLGameTest >> testMovePlayerADistance [
	
	| jill game |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. 
	self assert: jill position equals: 1.
	game movePlayer: jill distance: 4.
	self assert: jill position equals: 5.
	self assert: (game tileAt: 1) players isEmpty.
	self assert: ((game tileAt: 5) players includes: jill).
]

{ #category : #'test player introduction' }
SLGameTest >> testPlayerAtStart [

	| game jill |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	self assert: ((game tileAt: 1) players includes: jill).
]

{ #category : #'test player introduction' }
SLGameTest >> testPlayerAtStartIsAtPosition1 [

	| game jill |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	self assert: jill position equals: 1.
]

{ #category : #'tests start' }
SLGameTest >> testPrintingSimpleGame [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: game printString equals: '[1][2][3][4][5][6][7][8][9][10][11][12]'
]

{ #category : #'test player introduction' }
SLGameTest >> testPrintingSimpleGameWithPlayers [

	| game jill jack |
	game := SLGame new 
		tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. "first player" 
	game addPlayer: jack. 
	self assert: game printString equals: '[1<Jill><Jack>][2][3][4][5][6][7][8][9][10][11][12]'
]

{ #category : #'test player introduction' }
SLGameTest >> testSeveralPlayersAtStart [

	| game jill jack |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	jack := SLPlayer new name: 'Jack'.
	game addPlayer: jill.
	game addPlayer: jack.
	self assert: ((game tileAt: 1) players includes: jill).
	self assert: ((game tileAt: 1) players includes: jack).
]

{ #category : #'tests start' }
SLGameTest >> testTileAt [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: (game tileAt: 6) printString equals: '[6]'
]

{ #category : #'tests moving' }
SLGameTest >> testTileForAtDistance [
	
	| jill game |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. 
	self assert: (game tileFor: jill atDistance: 4) position equals: 5.
]

{ #category : #'tests moving' }
SLGameTest >> testTileOfPlayer [
	
	| jill game |
	game := SLGame new tileNumber: 12.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. 
	self assert: (game tileOfPlayer: jill) position equals: 1.
]
