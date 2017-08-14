Class {
	#name : #TemperatureLogger,
	#superclass : #Object,
	#instVars : [
		'location',
		'temperatures'
	],
	#category : #Thermometer
}

{ #category : #initialization }
TemperatureLogger >> initialize [
	
	self location: ''.
	self temperatures: OrderedCollection new.
	
]

{ #category : #accessing }
TemperatureLogger >> lastTemperature [

	^ self temperatures last.
]

{ #category : #'as yet unclassified' }
TemperatureLogger >> location [
	^ location
]

{ #category : #'as yet unclassified' }
TemperatureLogger >> location: aString [ 
	location := aString
]

{ #category : #'as yet unclassified' }
TemperatureLogger >> recordTemperature: anInteger [ 
	self temperatures add: anInteger.
]

{ #category : #'as yet unclassified' }
TemperatureLogger >> temperatures [
	^ temperatures
]

{ #category : #'as yet unclassified' }
TemperatureLogger >> temperatures: anOrderedCollection [ 
	temperatures := anOrderedCollection
]
