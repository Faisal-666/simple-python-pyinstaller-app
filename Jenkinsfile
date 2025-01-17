node {
    docker.image('python:2-alpine').inside{
	stage ('Build') {
		sh 'usr/local/bin/python -m pip install --upgrade pip'
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
		sh 'apk add --no-cache binutils gcc musl-dev'
		sh 'pip install pyinstaller'
		sh 'pyinstaller --onefile sources/add2vals.py'
	    }
      }
}
