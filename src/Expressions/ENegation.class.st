Class {
	#name : #ENegation,
	#superclass : #EExpression,
	#instVars : [
		'expression'
	],
	#category : #Expressions
}

{ #category : #evaluation }
ENegation >> evaluate [
	
	^ expression evaluate negated.
]

{ #category : #evaluation }
ENegation >> expression [
	
	^ expression.
]

{ #category : #accessing }
ENegation >> expression: anEConstant [ 
	expression := anEConstant
]

{ #category : #evaluation }
ENegation >> negated [

	^ expression.
]

{ #category : #printing }
ENegation >> printOn: aStream [

	aStream nextPut: $-.
	aStream nextPut: Character space. 
	"aStream nextPutAll: '- '"
	aStream nextPutAll: expression printString
]
