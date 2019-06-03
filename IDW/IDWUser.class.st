Class {
	#name : #IDWUser,
	#superclass : #Object,
	#instVars : [
		'userName',
		'email',
		'password'
	],
	#category : #IDW
}

{ #category : #accessing }
IDWUser >> email [
	^ email
]

{ #category : #accessing }
IDWUser >> email: anObject [
	email := anObject
]

{ #category : #accessing }
IDWUser >> password [
	^ password
]

{ #category : #accessing }
IDWUser >> password: anObject [
	password := anObject
]

{ #category : #accessing }
IDWUser >> userName [
	^ userName
]

{ #category : #accessing }
IDWUser >> userName: anObject [
	userName := anObject
]
