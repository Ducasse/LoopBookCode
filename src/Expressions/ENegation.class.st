Class {
	#name : #ENegation,
	#superclass : #EExpression,
	#instVars : [
		'expression'
	],
	#category : #Expressions
}

{ #category : #'instance creation' }
ENegation class >> expression: anInteger [
	^ self new expression: anInteger
]

{ #category : #evaluation }
ENegation >> evaluateWith: anObject [
	^ (expression evaluateWith: anObject) negated
]

{ #category : #accessing }
ENegation >> expression: anEConstant [ 
	expression := anEConstant
]

{ #category : #evaluation }
ENegation >> negated [

	^ expression
]

{ #category : #printing }
ENegation >> printOn: aStream [

	aStream nextPut: $-.
	aStream nextPut: Character space. 
	expression printOn: aStream
]
