pipleline {
  agent any
  parameters {
    string(name: 'tomcat-dev', defaultvalue: '18.195.241.246', description: 'Staging-Server' )
    string(name: 'tomcat-prod', defaultvalue: '18.185.125.57', description: 'Production-Server' )
    
  }

  triggers {
    pollSCM('* * * * *')
  }

stages {
  stage('Build') {
    steps {
      'sh mvn clean package'
    }

    post {
      success {
        echo 'Now Archiving'
        archiveArtifacts artifacts: '**/target/*.war'
      }
    }
  }

  stage('Deployment'){
    parallel{
     stage ('Deploy to staging'){
      steps sh 'scp -i /home/vibhor/Downloads/tomcat.pem **/target/*.war ec2-user@$(params.tomcat-dev):/var/lib/tomcat8/webapps'
     }
    }
    stage (Deploy to Prod) {
      steps {
        sh 'scp -i /home/vibhor/Downloads/tomcat.pem **/target/*.war ec2-user@$(params.tomcat-prod):/var/lib/tomcat8/webapps'
      }
    }
  }
}
  
}

