pipeline {

 environment {  DOCKERHUB_CREDENTIALS=credentials('user11_mezghichdokub') }
agent any

     tools {
          maven 'maven'
     }

     stages{

          stage('Creation du jar ') {

               steps {
                         sh 'mvn clean install -DskipTests'
               }
          }

          stage('build docker image sur serveur') {

               steps {
                         sh 'docker build -t ams_app_data_v9 .'
                    }
          }

         
          stage('tag and push image to dockerhub') {

                    steps {

                    echo "tag and push image ..."

                    sh "docker tag ams_app_data_v9 mezghichdokub/ams_app_data_v9"

                    sh "docker login -u $DOCKERHUB_CREDENTIALS_USR -p      $DOCKERHUB_CREDENTIALS_PSW"

                    sh "docker push mezghichdokub/ams_app_data_v9"

                    sh "docker logout"

                    }

               post{

                    success{
                         echo "====++++success++++===="
                         }

                    failure{
                         echo "====++++failed++++===="
                         }
          
                    }
          }


          stage('run docker-compose') {

               steps {
                         sh 'docker-compose up -d'
                    }
          }
     }
}
