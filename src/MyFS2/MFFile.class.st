Class {
	#name : #MFFile,
	#superclass : #Object,
	#instVars : [
		'parent',
		'name',
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

{ #category : #accessing }
MFFile >> name: aString [
	name := aString
]

{ #category : #accessing }
MFFile >> parent [
	^ parent
]

{ #category : #accessing }
MFFile >> parent: aFile [
	parent := aFile
]

{ #category : #printing }
MFFile >> printOn: aStream [
	parent isNil ifFalse: [ 
		parent printOn: aStream ].
	aStream << name
]

{ #category : #size }
MFFile >> size [
	^ contents size + name size
]
