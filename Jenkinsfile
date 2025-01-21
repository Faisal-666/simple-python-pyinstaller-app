node {
    docker.image('python:3.9-alpine').inside {
        stage('Checkout SCM') {
            checkout scm
        }
        stage('Setup') {
            sh 'apk add --no-cache git'
        }
        stage('Build') {
            sh 'python -m py_compile sources/add2vals.py sources/calc.py'
            stash(name: 'compiled-results', includes: 'sources/*.py*')
        }
        stage('Test') {
            unstash 'compiled-results'
            sh 'pip install pytest'
            sh 'pytest --junit-xml test-reports/results.xml sources/test_calc.py'
            junit 'test-reports/results.xml'
        }
        stage('Deliver') {
            unstash 'compiled-results'
            sh 'apk add --no-cache binutils gcc musl-dev'
            sh 'pip install pyinstaller'
            sh 'pyinstaller --onefile sources/add2vals.py'
            archiveArtifacts artifacts: 'dist/add2vals', allowEmptyArchive: true
        }
        stage('Manual Approval') {
            input message: 'Lanjutkan ke tahap Deploy?'        
        }
        stage('Deploy'){
            sh './gh-pages.sh'
            sleep time: 60, unit: 'SECONDS'
        }
    }
}

