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
	<sampleInstance>
	^ self new value: 5 
]

{ #category : #'instance creation' }
EConstant class >> value: anInteger [
	
	^ self new value: anInteger 
]

{ #category : #evaluation }
EConstant >> evaluateWith: anObject [
	
	^ value
]

{ #category : #printing }
EConstant >> printOn: aStream [

	aStream nextPutAll: value printString
]

{ #category : #accessing }
EConstant >> value [ 

	^ value
]

{ #category : #accessing }
EConstant >> value: anInteger [

	value := anInteger
]
