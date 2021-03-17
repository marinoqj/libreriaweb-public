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
        withCredentials([usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
          withMaven(maven : 'mvn-3.6.3') {
            sh "mvn jib:build"
          }
        }
      } 
    }
  }
}