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
