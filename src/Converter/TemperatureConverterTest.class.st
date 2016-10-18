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

{ #category : #'as yet unclassified' }
TemperatureConverterTest >> testFToCScale [

	| converter results exceptedFahrenheit exceptedCelcius |
	converter := TemperatureConverter new. 
	results := (converter convertFarhenheitFrom: 50 to: 70 by: 2).
	exceptedFahrenheit := {50 . 52 . 54 . 56 .  58. 60. 62. 64. 66. 68 . 70}.
	exceptedCelcius := #(10.0 11.1 12.2 13.3 14.4 15.5 16.6 17.7 18.8 20.0 21.1 22.2 23.3 24.4 25.5 26.6).
	
	1 to: results size do: [:i |
		self assert: ((results at: i) value closeTo: (exceptedCelcius at: i) precision: 0.1) ] 
]
