pipeline {

    agent any

    environment {
        APP_NAME="loremapp"
        MASTER_BRANCH_NAME='master'
        DOCKER_TAG_NAME="$GIT_BRANCH-$BUILD_NUMBER"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    sh 'cd lorem && composer install --no-interaction'
                }
            }
        }

        stage('Dockerize') {
            when {
                branch "$MASTER_BRANCH_NAME";
            }
            steps {
                sh "./make-containers.sh $DOCKER_TAG_NAME"
            }
        }

        stage('Deploy') {
            when {
                branch "$MASTER_BRANCH_NAME"
            }
            steps {
                sh "helm upgrade -i --wait $APP_NAME deploy/helm/lorem --set image.php.tag=$DOCKER_TAG_NAME --set image.web.tag=$DOCKER_TAG_NAME --set image.cache.tag=$DOCKER_TAG_NAME"
            }
        }

    }

    post {
        always {
            cleanWs()
        }
    }
}
