Class {
	#name : #IDWCollaborationNetworkRequest,
	#superclass : #Object,
	#instVars : [
		'title',
		'content',
		'destination',
		'user'
	],
	#category : #IDWCollaborationNetwork
}

{ #category : #accessing }
IDWCollaborationNetworkRequest >> content [
	^ content
]

{ #category : #accessing }
IDWCollaborationNetworkRequest >> content: anObject [
	content := anObject
]

{ #category : #accessing }
IDWCollaborationNetworkRequest >> destination [
	^ destination
]

{ #category : #accessing }
IDWCollaborationNetworkRequest >> destination: anObject [
	destination := anObject
]

{ #category : #accessing }
IDWCollaborationNetworkRequest >> title [
	^ title
]

{ #category : #accessing }
IDWCollaborationNetworkRequest >> title: anObject [
	title := anObject
]

{ #category : #accessing }
IDWCollaborationNetworkRequest >> user [
	^ user
]

{ #category : #accessing }
IDWCollaborationNetworkRequest >> user: anObject [
	user := anObject
]
