pipeline {

	agent any
                                        }

	//environment {
        //	SONAR_SCANNER_HOME = tool 'SonarQubeScanner'
		
	//}	

	stages {

		stage('Checkout Git') {
			steps {
				git branch: 'main', changelog: false, credentialsId: 'Git-Token', url: 'https://github.com/max-az-10/mediplus.git'	
			}	
		}
		stage('SonarQube Analysis') {
   			def scannerHome = tool 'SonarQubeScanner';
    			withSonarQubeEnv('SonarQube') {
      				sh "${scannerHome}/bin/sonar-scanner"
    			}
  		}		
	}
}
