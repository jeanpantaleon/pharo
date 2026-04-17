Class {
	#name : 'StringWriteStream',
	#superclass : 'WriteStream',
	#category : 'Collections-Streams',
	#package : 'Collections-Streams'
}

{ #category : 'accessing' }
StringWriteStream >> nextPut: anObject [
	"Primitive. Insert the argument at the next position in the Stream
	represented by the receiver. Fail if the collection of this stream is not an
	Array or a String. Fail if the stream is positioned at its end, or if the
	position is out of bounds in the collection. Fail if the argument is not
	of the right type for the collection. Optional. See Object documentation
	whatIsAPrimitive."

	^ position >= writeLimit
		ifTrue: [ self pastEndPut: anObject ]
		ifFalse: [ position := position + 1.
			collection privateAt: position put: anObject ]
]

{ #category : 'private' }
StringWriteStream >> pastEndPut: anObject [
	"Grow the collection, then put <anObject> at the current write position."

	collection := collection grownBy: (collection size max: 20).
	writeLimit := collection size.
	collection privateAt: (position := position + 1) put: anObject.
	^ anObject
]
