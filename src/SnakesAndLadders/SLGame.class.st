Class {
	#name : #SLGame,
	#superclass : #Object,
	#instVars : [
		'tiles'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SLGame >> tileNumber [
	
	^ tiles
]

{ #category : #accessing }
SLGame >> tileNumber: aNumber [

	tiles := aNumber
]
