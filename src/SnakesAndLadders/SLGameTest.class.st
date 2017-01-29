Class {
	#name : #SLGameTest,
	#superclass : #TestCase,
	#category : #SnakesAndLadders
}

{ #category : #tests }
SLGameTest >> testBoardCurrentPlayer [
	
	| jill jack board |
	board := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	board addPlayer: jill. "first player" 
	board addPlayer: jack. 
	board turns: 9.
	self assert: board currentPlayer equals: jill.
	board turns: 10.
	self assert: board currentPlayer equals: jack.
]

{ #category : #tests }
SLGameTest >> testFullBoardPrintString [

	| board |
	board := SLGame new tileNumber: 12.
	self assert: board printString equals: '[1][2][3][4][5][6][7][8][9][10][11][12]'.
	board	setLadderFrom: 2 to: 6;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	self assert: board printString equals: '[1][2->6][3][4][5][6][7->9][8][9][10][5<-11][12]'
]

{ #category : #tests }
SLGameTest >> testFullBoardSetUp [

	| board |
	board := SLGame new 
		tileNumber: 12; 
		setLadderFrom: 2 to: 4;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	self assert: (board tileAt: 2) isLadder. 
	self deny: (board tileAt: 3) isLadder.
	self assert: (board tileAt: 11) isSnake.
]

{ #category : #tests }
SLGameTest >> testNewPlaceForPlayerAtDistance [
	
	| jill jack board |
	board := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	board addPlayer: jill. "first player" 
	board addPlayer: jack. 
	self assert: (board newPlaceFor: jill atDistance: 4) position equals: 5.
]

{ #category : #tests }
SLGameTest >> testPlaceForPlayer [
	
	| jill jack board |
	board := SLGame new tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	board addPlayer: jill. "first player" 
	board addPlayer: jack. 
	self assert: (board placeFor: jill) position equals: 1.
]

{ #category : #tests }
SLGameTest >> testPlayerAtStart [

	| board jill |
	board := SLGame new 
		tileNumber: 12; 
		setLadderFrom: 2 to: 4;
		setLadderFrom: 7 to: 9;
		setSnakeFrom: 11 to: 5.
	jill := SLPlayer new name: 'Jill'.
	board addPlayer: jill. 
	self assert: ((board tileAt: 1) players includes: jill).
]

{ #category : #tests }
SLGameTest >> testPrintingSimpleBoard [

	| board |
	board := SLGame new 
		tileNumber: 12.
	self assert: board printString equals: '[1][2][3][4][5][6][7][8][9][10][11][12]'
]

{ #category : #tests }
SLGameTest >> testPrintingSimpleBoardWithPlayers [

	| board jill jack |
	board := SLGame new 
		tileNumber: 12.
	jack := SLPlayer new name: 'Jack'.
	jill := SLPlayer new name: 'Jill'.
	board addPlayer: jill. "first player" 
	board addPlayer: jack. 
	self assert: board printString equals: '[1<Jill><Jack>][2][3][4][5][6][7][8][9][10][11][12]'
]
