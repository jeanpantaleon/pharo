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
ImmutableStringTest >> testConcatenation [
	| result index |
	result:= self firstCollection , self secondCollection .
	"first part : "
	index := 1.
	self firstCollection do:
		[:each |
		self assert: (self firstCollection at: index)=each.
		index := index+1.].
	"second part : "
	1 to: self secondCollection size do:
		[:i |
		self assert: (self secondCollection at:i)= (result at:index).
		index:=index+1].
	"size : "
	self assert: result size = (self firstCollection size + self secondCollection size)
]

{ #category : 'tests' }
ImmutableStringTest >> testConcatenationWithEmpty [
	| result |
	result:= self empty,self secondCollection .

	1 to: self secondCollection size do:
		[:i |
		self assert: (self secondCollection at:i)= (result at:i).
		].
	"size : "
	self assert: result size = ( self secondCollection size)
]
