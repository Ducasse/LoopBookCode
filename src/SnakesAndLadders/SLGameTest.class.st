Class {
	#name : #SLGameTest,
	#superclass : #TestCase,
	#category : #SnakesAndLadders
}

{ #category : #'tests - play' }
SLGameTest >> testCanMoveToPosition [
	
	| game |
	game := SLGame new tileNumber: 12.
	self assert: (game canMoveToPosition: 8).
	self assert: (game canMoveToPosition: 12).
	self deny: (game canMoveToPosition: 13).
	
]

{ #category : #'tests start' }
SLGameTest >> testCheckingSimpleGame [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: game tileNumber equals: 12
]

{ #category : #'tests - play' }
SLGameTest >> testCurrentPlayer [
	
	| jack game jill |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jack; addPlayer: jill. 
	game turns: 1.
	self assert: game currentPlayer equals: jack. 
	game turns: 2.
	self assert: game currentPlayer equals: jill. 
	game turns: 3.
	self assert: game currentPlayer equals: jack. 
]

{ #category : #'tests start' }
SLGameTest >> testFullGamePrintString [

	| game |
	game := SLGame new tileNumber: 12.
	self assert: game printString equals: '[1][2][3][4][5][6][7][8][9][10][11][12]'.
	game	setLadderFrom: 2 to: 6;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	self assert: game printString equals: '[1][2->6][3][4][5][6][7->9][8][9][10][5<-11][12]'
]

{ #category : #'tests - play' }
SLGameTest >> testIsOver [
	
	| jack game |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	game addPlayer: jack. 
	self assert: jack position equals: 1. 
	game movePlayer: jack distance: 11.
	"(game tileAt: 12) acceptPlayer: jack. "
	self assert: jack position equals: 12.
	self assert: game isOver.
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

{ #category : #'test - game play' }
SLGameTest >> testPlayOneStep [
	
	| jill jack game |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. 
	game addPlayer: jack. 
	self assert: jill position equals: 1. 
	game playOneStepWithRoll: 3.
	self assert: jill position equals: 4.
	self assert: (game tileAt: 1) players size equals: 1. 
	self assert: ((game tileAt: 4) players includes: jill). 
]

{ #category : #'test - game play' }
SLGameTest >> testPlayOneStepOnALadder [
	
	| jill jack game |
	game := SLGame new 
				tileNumber: 12; 
				setLadderFrom: 2 to: 6;
				setLadderFrom: 7 to: 9;
				setSnakeFrom: 11 to: 5.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. 
	game addPlayer: jack. 
	game playOneStepWithRoll: 1.
	self assert: jill position equals: 6.
	self assert: (game tileAt: 1) players size equals: 1. 
	self assert: ((game tileAt: 6) players includes: jill). 
]

{ #category : #'test - game play' }
SLGameTest >> testPlayOneStepOnExactFinish [
	
	| jill jack game |
	game := SLGame new 
			tileNumber: 12; 
			setLadderFrom: 2 to: 6;
			setLadderFrom: 7 to: 9;
			setSnakeFrom: 11 to: 5.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. 
	game addPlayer: jack. 

	game playOneStepWithRoll: 11.
	"jill lands on the finish tile!"
	self assert: jill position equals: 12.
	self assert: (game tileAt: 1) players size equals: 1. 
	self assert: ((game tileAt: 12) players includes: jill).
	self assert: game isOver.
]

{ #category : #'test - game play' }
SLGameTest >> testPlayOneStepOnInexactFinish [
	
	| jill jack game |
	game := SLGame new 
			tileNumber: 12; 
			setLadderFrom: 2 to: 6;
			setLadderFrom: 7 to: 9;
			setSnakeFrom: 11 to: 5.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. 
	game addPlayer: jack. 
     "jill moves"
	game playOneStepWithRoll: 9.
	self assert: jill position equals: 10.
	self assert: ((game tileAt: 10) players includes: jill).
	"jack moves"
	game playOneStepWithRoll: 2. 
	"jill tries to move but in fact stays at her place"
	game playOneStepWithRoll: 5.
	self assert: jill position equals: 10.
	self assert: ((game tileAt: 10) players includes: jill).
	self deny: game isOver.
]

{ #category : #'test - game play' }
SLGameTest >> testPlayTwoSteps [
	
	| jill jack game |
	game := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill.
	game addPlayer: jack.
	self assert: jill position equals: 1. 
	game playOneStepWithRoll: 3.
	game playOneStepWithRoll: 2.
	"nothing changes for jill"
	self assert: jill position equals: 4.
	self assert: ((game tileAt: 4) players includes: jill). 
	"now let us verify that jack moved correctly"	
	self assert: (game tileAt: 1) players size equals: 0. 
	self assert: jack position equals: 3.
	self assert: ((game tileAt: 3) players includes: jack). 
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

{ #category : #'tests moving' }
SLGameTest >> testPlayerStepOnASnake [
	
	| jill game |
	game := SLGame new 
		tileNumber: 12; 
		setLadderFrom: 2 to: 6;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	jill := SLPlayer new name: 'Jill'.
	game addPlayer: jill. 
	game movePlayer: jill distance: 10. 
	self assert: jill position equals: 5.
	self assert: (game tileAt: 1) players isEmpty. 
	self assert: ((game tileAt: 5) players includes: jill). 
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
