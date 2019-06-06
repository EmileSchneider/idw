Class {
	#name : #IDWAuthentication,
	#superclass : #WAComponent,
	#instVars : [
		'action',
		'userName',
		'password',
		'email'
	],
	#category : #IDWAuth
}

{ #category : #rendering }
IDWAuthentication >> renderContentOn: html [
	html heading level3 with: 'Authenticate' . 
	self session isLoggedIn ifTrue: [ 
		 self renderIsLoggedIn: html
	]; ifFalse: [ self renderIsNotLoggedIn: html .
	 ].
	
	html anchor  callback:  [ action := 'signup'];with: 'Signup' .
	html anchor  callback: [ action := 'login' ]; with: 'Login'.
	html break.
	html text: action .
	action = 'login' ifTrue: [ 
		self renderLoginForm: html ].
	action = 'signup' ifTrue: [ 
		self renderSignUpForm: html ]
]

{ #category : #rendering }
IDWAuthentication >> renderIsLoggedIn: html [
	html text: 'islogedin'
]

{ #category : #rendering }
IDWAuthentication >> renderIsNotLoggedIn: html [
	html text: 'isNotLoggedIn'
]

{ #category : #rendering }
IDWAuthentication >> renderLoginForm: html [
	 html form: [
      html text: 'email'.
      html textInput
         value:  email;
         callback: [ :value |  email := value ].
      html break.
		html text: 'password'.
      html textInput
         value:  password;
         callback: [ :value |  password := value ].
      html break.
      html submitButton callback: [ self session login: email password: password ]; with: 'finish Login']
]

{ #category : #rendering }
IDWAuthentication >> renderSignUpForm: html [
	 html form: [
		html text: 'UserName'.
      html textInput
         value:  userName;
         callback: [ :value |  userName := value ].
      html break.
      html text: 'email'.
      html textInput
         value:  email;
         callback: [ :value |  email := value ].
      html break.
		html text: 'password'.
      html textInput
         value:  password;
         callback: [ :value |  password := value ].
      html break.
      html submitButton callback: [ 
			self session registerUser: userName password: password email: email ]; with: 'finish signup']
]
