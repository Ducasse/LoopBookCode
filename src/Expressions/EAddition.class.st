Class {
	#name : #EAddition,
	#superclass : #EExpression,
	#instVars : [
		'right',
		'left'
	],
	#category : #Expressions
}

{ #category : #example }
EAddition class >> fivePlusThree [
	<sampleInstance>
	| ep1 ep2 |
	ep1 := (EConstant new value: 5).
	ep2 := (EConstant new value: 3).
	^ self new left: ep1 ; right: ep2 
]

{ #category : #'instance creation' }
EAddition class >> left: anInteger right: anInteger2 [

	^ self new left: anInteger ; right: anInteger2 
]

{ #category : #evaluation }
EAddition >> evaluate [

	^  right evaluate +  left evaluate
]

{ #category : #accessing }
EAddition >> left: anEConstant [ 
	left := anEConstant
]

{ #category : #printing }
EAddition >> printOn: aStream [

	aStream nextPutAll: '( '.
	left printOn: aStream. 
	aStream nextPutAll: ' + '.
	right printOn: aStream.
	aStream nextPutAll: ' )'
]

{ #category : #accessing }
EAddition >> right: anEConstant [ 
	right := anEConstant
]
