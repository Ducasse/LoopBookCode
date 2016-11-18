Class {
	#name : #Ship8,
	#superclass : #Object,
	#instVars : [
		'currentOpcode',
		'memory',
		'v',
		'indexRegister',
		'pc',
		'gfx',
		'delayTimer',
		'soundTimer',
		'stack',
		'sp',
		'drawFlag',
		'i',
		'stackPointer'
	],
	#category : #Ship8
}

{ #category : #opcodes }
Ship8 >> ANNN [
	"// ANNN: Sets I to the address NNN"
	indexRegister := currentOpcode & 16r0FFF.
	pc := pc + 2
		
		
		
	

]

{ #category : #opcodes }
Ship8 >> FX33 [
	"Stores the Binary-coded decimal representation of VX at the addresses I, I plus 1, and I plus 2"

	"case 0x0033:
 	 memory[I]     = V[(opcode & 0x0F00) >> 8] / 100;
 	 memory[I + 1] = (V[(opcode & 0x0F00) >> 8] / 10) % 10;
 	 memory[I + 2] = (V[(opcode & 0x0F00) >> 8] % 100) % 10;
 	 pc += 2;"

]

{ #category : #opcodes }
Ship8 >> TwoNNN [
	"This opcode calls the subroutine at address NNN. Because we will need to temporary jump to address NNN, it means that we should store the current address of the program counter in the stack. After storing the value of the program counter in the stack, increase the stack pointer to prevent overwriting the current stack. Now that we have stored the program counter, we can set it to the address NNN. Remember, because we’re calling a subroutine at a specific address, you should not increase the program counter by two."
	
  stack at: stackPointer put: pc.
  stackPointer := stackPointer + 1.
  pc := currentOpcode & 16r0FFF
]

{ #category : #opcodes }
Ship8 >> ZeroZeroZeroZero [
	"0x00E0 and 0x00EE"
	
	| opcode | 
	opcode := currentOpcode & 16r000F.
  opcode = 0
		ifTrue: [   
     "case 0x0000: // 0x00E0: Clears the screen
        // Execute opcode"]
		ifFalse: [  
      "case 0x000E: // 0x00EE: Returns from subroutine
        // Execute opcode" ]

		
	

]

{ #category : #emulate }
Ship8 >> decodeOpcode [
	
	| opcode |
	opcode := currentOpcode & 16rF000.
	opcode
		caseOf: 
		{[ 16rA000 ] -> [ self ANNN ].
		[ 0 ] -> [ self ZeroZeroZeroZero ].
		[ 16r2000 ] -> [ self TwoNNN ].
		[ 16r0033 ] -> [ self FX33 ]
		} 

		otherwise: [ (opcode asString, ' unknown opcode') traceCr ]



]

{ #category : #emulate }
Ship8 >> decodeOpcode2 [
	
	"ANNN"
	| opcode | 
	opcode := currentOpcode & 16r000F.
  opcode = 0
		ifTrue: [   
     "case 0x0000: // 0x00E0: Clears the screen
        // Execute opcode"]
		ifFalse: [  
      "case 0x000E: // 0x00EE: Returns from subroutine
        // Execute opcode" ]

]

{ #category : #emulate }
Ship8 >> emulateCycle [
  "// Fetch Opcode
  // Decode Opcode
  // Execute Opcode
  // Update timers"
	self loadCurrentOpcode. 
	self decodeOpcode. 
]

{ #category : #accessing }
Ship8 >> indexRegister [

	^ indexRegister
]

{ #category : #initialization }
Ship8 >> initialize [

	memory := Array new: 4096.
	v := Array new: 16.
	indexRegister := 0.
	pc := 16r200.
	gfx := Array new: 64 * 32. "should be a bitmap"
	delayTimer := Delay new. 
	soundTimer := Delay new.
	stack := OrderedCollection new. 
	stackPointer := 0.
]

{ #category : #emulate }
Ship8 >> loadCurrentOpcode [

	currentOpcode := ((self memoryAt: pc) << 8) | (self memoryAt: pc + 1).
	^ currentOpcode
]

{ #category : #memory }
Ship8 >> loadingProgram [
	
	"for(int i = 0; i < bufferSize; ++i)
  memory[i + 512] = buffer[i]"
	"we should load the program at PC = 16r200"
]

{ #category : #memory }
Ship8 >> memoryAt: index [
	"handles the fact that our arrays start at 1"
	^ memory at: index+1
]

{ #category : #memory }
Ship8 >> memoryAt: index put: aValue [
	"handles the fact that our arrays start at 1"
	memory at: index+1 put: aValue
]

{ #category : #accessing }
Ship8 >> pc [

	^ pc
]

{ #category : #emulate }
Ship8 >> start [

	self emulateCycle.
  drawFlag
			ifTrue: [ self updateGraphics ].
  "self setKeys."
]

{ #category : #timers }
Ship8 >> updateDelayTimer [  

	delayTimer > 0
    ifTrue: [ delayTimer := delayTimer - 1 ]
]

{ #category : #timers }
Ship8 >> updateSoundTimer [  

	soundTimer > 0
    ifTrue: [ 
			soundTimer = 1 ifTrue: [ Transcript show: 'Beep'].  
			soundTimer := delayTimer - 1 ]
]
