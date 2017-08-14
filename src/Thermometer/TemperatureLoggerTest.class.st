Class {
	#name : #TemperatureLoggerTest,
	#superclass : #TestCase,
	#instVars : [
		'location'
	],
	#category : #Thermometer
}

{ #category : #tests }
TemperatureLoggerTest >> testIfLocationIsRight [

	| office |
	office := TemperatureLogger new.
	office location: 'Office'.
]

{ #category : #tests }
TemperatureLoggerTest >> testInitialize [

	| tLog |
	tLog := TemperatureLogger new.
	self assert: tLog location equals: ''.
	self assert: tLog temperatures equals: OrderedCollection new.
	
]

{ #category : #tests }
TemperatureLoggerTest >> testRecordTemperature [

	|office|
	office := TemperatureLogger new.
	office location: 'Office'.
	office recordTemperature: 19.
	self assert: office lastTemperature equals: 19 
]
