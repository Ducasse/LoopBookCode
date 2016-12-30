Class {
	#name : #EConstant,
	#superclass : #EExpression,
	#instVars : [
		'value'
	],
	#category : #Expressions
}

{ #category : #examples }
EConstant class >> constant5 [
	<sampleData>
	^ self new value: 5 
]

{ #category : #evaluation }
EConstant >> evaluate [
	
	^ value
]

{ #category : #evaluation }
EConstant >> negated [

	^ ENegation new expression: self
]

{ #category : #accessing }
EConstant >> value [ 

	^ value
]

{ #category : #accessing }
EConstant >> value: anInteger [

	value := anInteger
]
