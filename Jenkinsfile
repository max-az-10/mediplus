pipeline {

	agent any

	environment {
       		SONAR_SCANNER_HOME = tool 'SonarQubeScanner'
		IMAGE_TAG = 'latest'
        	ECR_REPO = 'mediplus-repo'
        	ECR_REGISTRY = '381492139836.dkr.ecr.us-west-2.amazonaws.com'
        	//ECS_CLUSTER = 'my-app-cluster'
        	//ECS_SERVICE = 'my-app-service'
        	//ECS_TASK_DEF = 'my-app-taskdef'
        	TRIVY_IMAGE = "${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG}"	
	}	

	stages {

		stage('Checkout Git') {
			steps {
		}

		stage('SonarQube Analysis') {
			steps {
				withCredentials([string(credentialsId: 'Sonar-Token', variable: 'SONAR_TOKEN')]) {
    					withSonarQubeEnv('SonarQube') {
      						sh "${SONAR_SCANNER_HOME}/bin/sonar-scanner"
					}
    				}
  			}			
		}
		stage('Build image') {
                        steps {
				script {
					sh """
					docker build -t ${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG} .
					docker tag $ECR_REPO:${IMAGE_TAG} ${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG}
					"""
				}
			
                        }

                }
		stage('Trivy scan') {
                        steps {
                                script {
					trivy image --severity HIGH,MEDIUM --format table -o trivy-report.html ${TRIVY_IMAGE}
                                }

                        }

                }

		stage('Login to ECR') {
                        steps {
                                script {
					aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin ${ECR_REGISTRY}
                                }

                        }

                }
		stage('Push to ECR') {
                        steps {
                                script {
					docker push ${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG}
                                }

                        }

                }


	}
}
