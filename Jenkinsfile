node {
    docker.image('python:3.9-alpine').inside{
	stage ('Build') {
		sh 'python -m py_compile sources/add2vals.py sources/calc.py'
		stash(name: 'compiled-results', includes: 'sources/*.py*')
		}
	stage ('Test') {
		unstash 'compiled-results'
		sh 'py.test --junit-xml test-reports/results.xml sources/test_calc.py'
			junit 'test-reports/results.xml'
		}
	}
}
