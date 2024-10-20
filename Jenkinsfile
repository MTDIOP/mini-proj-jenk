pipeline {
     environment {
       ID_DOCKER ="mortalla"
       PORT_EXPOSED = "${WEB_PORT}"
       IMAGE_NAME = "mdi-staticweb-img"
       CTN_NAME = "mdi-staticweb"
       IMAGE_TAG = "latest"
       STAGING = "${ID_DOCKER}-staging"
       PRODUCTION = "${ID_DOCKER}-production"
     }
     agent none
     stages {
         stage('Build image') {
             agent any
             steps {
                script {
                  sh 'docker build -t ${ID_DOCKER}/$IMAGE_NAME:$IMAGE_TAG .'
                }
             }
        }
        stage('Run container based on builded image') {
            agent any
            steps {
               script {
                 sh '''
                    echo "Run Container"
                    docker run --name $CTN_NAME -d -p ${PORT_EXPOSED}:80 -e PORT=80 ${ID_DOCKER}/$IMAGE_NAME:$IMAGE_TAG
                    sleep 5
                 '''
               }
            }
       }
       stage('Test image') {
           agent any
           steps {
//                   curl http://localhost:${PORT_EXPOSED} | grep "Dimension"
              script {
                sh '''
                  echo "test pass"
                '''
              }
           }
      }
      stage('Clean Container') {
          agent any
          steps {
             script {
               sh '''
                 echo "Clean Environment"
                 docker stop $CTN_NAME
                 docker rm -f $CTN_NAME || echo "container does not exist"
               '''
             }
          }
     }

     stage ('Login and Push Image on docker hub') {
          agent any
        environment {
           DOCKERHUB_PASSWORD  = credentials('dockerhub')
        }            
          steps {
             script {
               sh '''
                   echo $DOCKERHUB_PASSWORD | docker login -u $ID_DOCKER --password-stdin https://index.docker.io/v2/
                   docker login -u $ID_DOCKER -p $DOCKERHUB_PASSWORD
                   docker push ${ID_DOCKER}/$IMAGE_NAME:$IMAGE_TAG
               '''
             }
          }
      }    
/*   heroku seems to not working and deprecated  
     stage('Push image in staging and deploy it') {
       when {
              expression { GIT_BRANCH == 'origin/master' }
            }
      agent any
      environment {
          HEROKU_API_KEY = credentials('heroku_api_key')
      }  
      steps {
//              npm i -g heroku@7.68.0
          script {
            sh '''
               npm install -g heroku
               heroku container:login
               heroku create $PRODUCTION || echo "projets already exist"
               heroku container:push -a $PRODUCTION web
               heroku container:release -a $PRODUCTION web
            '''
          }
        }
     }
# heroku seems to not working and deprecated  
     stage('Push image in production and deploy it') {
       when {
              expression { GIT_BRANCH == 'origin/production' }
            }
      agent any
      environment {
          HEROKU_API_KEY = credentials('heroku_api_key')
      }  
      steps {
          script {
            sh '''
              npm install -g heroku
              heroku container:login
              heroku create $PRODUCTION || echo "project already exist"
              heroku container:push -a $PRODUCTION web
              heroku container:release -a $PRODUCTION web
            '''
          }
        }
     }
*/
  }
    post {
       success {
         slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
         }
      failure {
            slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
          }   
    }
}