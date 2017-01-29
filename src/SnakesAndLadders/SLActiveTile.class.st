Class {
	#name : #SLActiveTile,
	#superclass : #SLPositionedTile,
	#instVars : [
		'targetPosition'
	],
	#category : #SnakesAndLadders
}

{ #category : #accessing }
SLActiveTile >> to: aTargetPosition [

	targetPosition := aTargetPosition
]
