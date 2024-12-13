pipeline {

	agent any

	stages {

		stage('Checkout Git'){
			steps {
				git branch: 'main', changelog: false, credentialsId: 'Git-Token', url: 'https://github.com/max-az-10/mediplus.git'	
			}	
		}
	}
}

		
