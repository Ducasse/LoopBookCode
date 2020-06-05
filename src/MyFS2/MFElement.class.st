"
A naive filesystem
"
Class {
	#name : #MFElement,
	#superclass : #Object,
	#instVars : [
		'name',
		'parent'
	],
	#category : #MyFS2
}

{ #category : #description }
MFElement >> describe [     
	^ 'I m a ', self kind, ' named ', self name  
]

{ #category : #description }
MFElement >> name [

	^ name  
]

{ #category : #initialization }
MFElement >> name: aString [
	name := aString
]

{ #category : #initialization }
MFElement >> parent [
	^ parent
]

{ #category : #accessing }
MFElement >> parent: aFile [
	parent := aFile
]

{ #category : #printing }
MFElement >> printOn: aStream [
	parent isNil ifFalse: [ 
		parent printOn: aStream ].
	aStream << name
]
