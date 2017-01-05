Class {
	#name : #EVariable,
	#superclass : #EExpression,
	#instVars : [
		'id'
	],
	#category : #Expressions
}

{ #category : #evaluate }
EVariable >> evaluateWith: aBindingSet [

	^ (aBindingSet at: id)
]

{ #category : #accessing }
EVariable >> id: aSymbol [

	id := aSymbol
]

{ #category : #printing }
EVariable >> printOn: aStream [ 
	aStream nexPutAll: id asString
]
