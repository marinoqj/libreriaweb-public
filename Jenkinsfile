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
          bat "mvn package"
        }
      }
    }

    stage('SonarQube analysis') {
      steps {
        withSonarQubeEnv(installationName: 'sonarqube-server') {
          withMaven(maven : 'mvn-3.6.3') {
            bat 'mvn sonar:sonar -Dsonar.dependencyCheck.jsonReportPath=target/dependency-check-report.json -Dsonar.dependencyCheck.xmlReportPath=target/dependency-check-report.xml -Dsonar.dependencyCheck.htmlReportPath=target/dependency-check-report.html'
          }
        }
      }
    }
	
	
	stage('Create and push container') {
      steps {        
          withMaven(maven : 'mvn-3.6.3') {
            bat "mvn clean package dockerfile:build dockerfile:push"
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