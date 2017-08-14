Class {
	#name : #TemperatureLoggerTest,
	#superclass : #TestCase,
	#instVars : [
		'location'
	],
	#category : #Thermometer
}

{ #category : #tests }
TemperatureLoggerTest >> testAverage [
	|office|
	office := TemperatureLogger new.
	office location: 'Office'.
	office recordTemperature: 22.
	office recordTemperature: 23.
	office recordTemperature: 21.
	self assert: office average equals: 22.
]

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
	self assert: office lastTemperature value equals: 19 
]
