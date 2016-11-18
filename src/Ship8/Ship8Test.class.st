Class {
	#name : #Ship8Test,
	#superclass : #TestCase,
	#category : #Ship8
}

{ #category : #tests }
Ship8Test >> test [

	| pc ship |
	pc := 1.
	ship := Ship8 new. 
	ship memoryAt: pc put: 16rA2.
	ship memoryAt: pc + 1 put: 16rF0
]

{ #category : #tests }
Ship8Test >> testDecodeOpcode [

	| ship shipPC |
	ship := Ship8 new. 
	shipPC := ship pc. 
	ship memoryAt: 0 + ship pc put: 16rA2.
	ship memoryAt: 1 + ship pc put: 16rF0.
	ship loadCurrentOpcode.
	ship decodeOpcode.
	self assert: ship indexRegister equals: 16r2F0.
	self assert: ship pc equals: shipPC + 2
]

{ #category : #tests }
Ship8Test >> testLoadCurrentOpcode [

	| ship |
	ship := Ship8 new. 
	ship memoryAt: 0 + ship pc put: 16rA2.
	ship memoryAt: 1 + ship pc put: 16rF0.
	self assert: ship loadCurrentOpcode equals: 16rA2F0.
]

{ #category : #tests }
Ship8Test >> testMemoryAtPut [

	| pc ship |
	pc := 0.
	ship := Ship8 new. 
	ship memoryAt: pc put: 16rA2.
	self assert: (ship memoryAt: pc) equals: 16rA2 
]
