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
            sh 'git config --global user.email "faisalakbar661@gmail.com"'
            sh 'git config --global user.name "Faisal"'
            sh 'git checkout --orphan gh-pages'
	    sh 'https://github.com/Faisal-666/simple-python-pyinstaller-app.git'
	    sh 'rm -rf .'
	    sh 'echo "test" > README.md'
	    sh 'git add README.MD'
	    sh 'git commit -m "test branc ghpages"'
	    sh 'git push origin gh-pages'
	    sh 'git clone --branch gh-pages https://Faisal-666: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@github.com/Faisal-666/simple-python-pyinstaller-app.git' gh-pages
            sh 'cp dist/add2vals gh-pages/'
            sh 'cd gh-pages'
            sh 'git add add2vals'
            sh 'git commit -m "Deploy add2vals to GP?"'
            sh 'git push origin gh-pages'
            sleep time: 60, unit: 'SECONDS'
        }
    }
}

