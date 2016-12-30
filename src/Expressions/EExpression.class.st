Class {
	#name : #EExpression,
	#superclass : #Object,
	#category : #Expressions
}

{ #category : #evaluation }
EExpression >> negated [

	^ ENegation new expression: self
]
