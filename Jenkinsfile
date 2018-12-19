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
    stage ('deploy prod'){
      steps {
        timeout(time:5, unit:'DAYS'){
          input message: 'Approve'
        }
        build job: 'deploy-prod'
      }
      post {
        success {
          echo 'code deployed to prod'
        }
        failure {
          echo 'deployment failed'
        }
      }
    }
  }

}
