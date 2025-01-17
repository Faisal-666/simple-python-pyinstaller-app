node {
    docker.image('python:3.9-alpine').inside{
	stage ('Build') {
		sh 'python -m py_compile sources/add2vals.py sources/calc.py'
		stash(name: 'compiled-results', includes: 'sources/*.py*')
		}
	stage ('Test') {
		unstash 'compiled-results'
		sh 'pip install pytest'
		sh 'pytest --junit-xml test-reports/results.xml sources/test_calc.py'
		always {
			junit 'test-reports/results.xml'
			}
		}
	stage ('Deliver') {
		unstash 'compiled-results'
		sh 'apk add --no-cache binutils'
		sh 'pip install pyinstaller'
		sh 'pyinstaller --onefile sources/add2vals.py'
		post {
			success {
				archiveArtifacts 'dist/add2vals'
			}
		}
	    }
	}
}
