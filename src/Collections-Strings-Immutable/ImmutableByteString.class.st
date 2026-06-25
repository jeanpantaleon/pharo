Class {
	#name : 'ImmutableByteString',
	#superclass : 'ByteString',
	#type : 'bytes',
	#category : 'Collections-Strings-Immutable-Base',
	#package : 'Collections-Strings-Immutable',
	#tag : 'Base'
}

{ #category : 'copying' }
ImmutableByteString >> , otherCollection [
	"Concatenate two Strings or Collections."
	"#(2 4 6 8) , #(who do we appreciate) >>> #(2 4 6 8 who do we appreciate)"
	"((2989 storeStringBase: 16) copyFrom: 4 to: 6) , ' boy!!' >>> 'BAD boy!!'"

	| s |
	self beMutable.	
	s :=  self copyReplaceFrom: self size + 1
		  to: self size
		  with: otherCollection.
	self beImmutable.
	s beImmutable.
	^ s
]

{ #category : 'copying' }
ImmutableByteString >> beImmutable [

	ImmutableByteString adoptInstance: self.
	^ self
]

{ #category : 'copying' }
ImmutableByteString >> beMutable [

	self beWritableObject.
	ByteString adoptInstance: self.
	^ self
]
