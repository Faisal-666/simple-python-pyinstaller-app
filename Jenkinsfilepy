node {
    def img = 'python:2-alpine'
    docker.image(img).inside('-p 3000:3000') {
	stage('Build') {
	    sh 'python -m py_compile sources/add2vals.py sources/calc.py'
	    stash(name: 'compiled-results', includes: 'sources/*.py*')
	}
    }
}
