pipeline{
    agent {
        label 'AGENT-1'
    }
    environment{
          Deploy_to = Production
    }
    options{
        timeout(time: 30, unit: 'minutes')  
        ansiColor('xterm')
        disableConcurrentBuilds()   
    }
    parameters {
        choice(name: 'choose', choices: ['apply', 'destroy'], description: 'Pick something')
    }

    stages{
        stage{
            steps('init'){
                sh"""
                  cd vpc-cicd
                  terraform init
                """
            }
        }
        stage{
            steps('paln'){
                when{
                    expression{
                        params.action == 'apply'
                    }
                }
                sh"""
                  cd vpc-cicd
                  terraform plan
                """
            }
        }
        stage{
            steps('apply'){
                when{
                    expression{
                        params.action == 'apply'
                    }
                }
                sh"""
                  cd vpc-cicd
                  terraform apply -auto-approve
                """
            }
        }
        stage{
            steps('destroy'){
                sh"""
                  cd vpc-cicd
                  terraform destroy -auto-approve
                """
            }
        }
    }
    post{
        always{
            echo "i will always say hello"
             deleteDir()
        }
    }

}