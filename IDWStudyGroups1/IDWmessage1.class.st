Class {
	#name : #IDWmessage1,
	#superclass : #Object,
	#instVars : [
		'sender',
		'content'
	],
	#category : #IDWStudyGroups1
}

{ #category : #accessing }
IDWmessage1 >> content [
	^ content
]

{ #category : #accessing }
IDWmessage1 >> content: anObject [
	content := anObject
]

{ #category : #accessing }
IDWmessage1 >> sender [
	^ sender
]

{ #category : #accessing }
IDWmessage1 >> sender: anObject [
	sender := anObject
]
