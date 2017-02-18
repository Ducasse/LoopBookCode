Class {
	#name : #MFFile,
	#superclass : #MFElement,
	#instVars : [
		'contents'
	],
	#category : #MyFS2
}

{ #category : #accessing }
MFFile >> contents: aString [
	 contents := aString
]

{ #category : #initialization }
MFFile >> initialize [
	contents := ''
]

{ #category : #description }
MFFile >> kind [ 

	^ 'file'
]

{ #category : #printing }
MFFile >> printOn: aStream [
	parent isNil ifFalse: [ 
		parent printOn: aStream ].
	aStream << name
]

{ #category : #'typing/selecting keys' }
MFFile >> search: aString [
	^ '*', aString, '*' match: contents
]

{ #category : #size }
MFFile >> size [
	^ contents size + name size
]
