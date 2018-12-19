pipeline {
  agent any
  stages{
    stage('Build') {
      steps {
        sh 'mvn clean package'
      
      }
      post {
        success {
          echo 'now archiving....'
          archiveArtifacts artifacts: '**/target/*.war'
        }
      }
      
    }
    stage ('Deploy to staging'){
      steps {
        build job: 'Deploy-to-staging'
      }
    }
  }
}
