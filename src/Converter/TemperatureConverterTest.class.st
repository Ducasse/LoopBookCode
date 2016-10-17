Class {
	#name : #TemperatureConverterTest,
	#superclass : #TestCase,
	#category : #Converter
}

{ #category : #'as yet unclassified' }
TemperatureConverterTest >> testCelciusToFahrenheit [

	| converter |
	converter := TemperatureConverter new. 
	self assert: ((converter convertCelsius: 30) = 86.0)
]
