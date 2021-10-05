pipeline {
  agent any

  tools {
    jdk 'jdk1.8'
    maven 'mvn-3.6.3'
  }

  stages {
    stage('Build') {
      steps {
        withMaven(maven : 'mvn-3.6.3') {
          bat "mvn package -DskipTests"
        }
      }
    }

	
	stage('Create and push container') {
      steps {        
          withMaven(maven : 'mvn-3.6.3') {
            bat "mvn dockerfile:build dockerfile:push"
          }
        }
      } 
    
    stage('Deploy to K8s') {
      steps {
        withKubeConfig([credentialsId: 'kubernetes-config']) {
          bat "kubectl apply -f libreriaweb-public-deployment.yaml"
        }
      } 
    }    
    
  }
}