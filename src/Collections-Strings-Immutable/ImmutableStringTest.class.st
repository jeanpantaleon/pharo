Class {
	#name : 'ImmutableStringTest',
	#superclass : 'TestCase',
	#instVars : [
		'subcollection3ElementsSorted',
		'nonEmpty5ElementsSorted',
		'nonEmpty1element',
		'emptyString'
	],
	#category : 'Collections-Strings-Immutable-Base',
	#package : 'Collections-Strings-Immutable',
	#tag : 'Base'
}

{ #category : 'requirements' }
ImmutableStringTest >> empty [
	^ emptyString
]

{ #category : 'accessing' }
ImmutableStringTest >> firstCollection [
	"Return a collection that will be the first part of the concatenation"

	^ nonEmpty5ElementsSorted
]

{ #category : 'as yet unclassified' }
ImmutableStringTest >> immutableString [
	| s |
	s := 'immutable'.
	^ s beImmutable
]

{ #category : 'as yet unclassified' }
ImmutableStringTest >> mutableString [

	^ 'mutable'
]

{ #category : 'accessing' }
ImmutableStringTest >> secondCollection [
	"Return a collection that will be the second part of the concatenation"

	^ nonEmpty1element
]

{ #category : 'running' }
ImmutableStringTest >> setUp [
	
	subcollection3ElementsSorted := 'bcd'.
	nonEmpty5ElementsSorted := 'a' , subcollection3ElementsSorted , 'e'.
	nonEmpty1element := 'a'.
	
	emptyString := ''.
	super setUp.

	"Put here a common initialization logic for tests"
]

{ #category : 'tests' }
ImmutableStringTest >> testAtPutImmutableThrowsError [

	self
		should: [ self immutableString at: 1 put: $a ]
		raise: ModificationForbidden
		with: [ :error |
		self assert: error messageText equals: ' ''immutable'' is read-only, hence its field 1 cannot be modified with $a' ]
]

{ #category : 'running' }
ImmutableStringTest >> testImmutableImmutableConcatenate [

	self assert: (self immutableString , self immutableString) class equals: ImmutableByteString
]

{ #category : 'running' }
ImmutableStringTest >> testImmutablePlainConcatenate [

	self assert: (self immutableString , self mutableString) class equals: ImmutableByteString
]

{ #category : 'running' }
ImmutableStringTest >> testPlainImmutableConcatenate [

	self assert: (self mutableString , self immutableString) class equals: ByteString
]

{ #category : 'running' }
ImmutableStringTest >> testPlainPlainConcatenate [

	self assert: (self mutableString , self mutableString) class equals: ByteString
]
