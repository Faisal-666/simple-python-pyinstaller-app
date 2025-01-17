node {
    docker.image('python:2-alpine').inside{
	stage ('Build') {
	    echo 'Starting build....'
		
	    try {
		sh 'python -m py_compile sources/add2vals.py sources/calc.py'
		stash(name: 'compiled-results', includes: 'sources/*.py*')
		echo 'Build done.'
	    } catch (Exception e) {
		echo "build failed: ${e.getMessage()}" 
		error "Stopp due to error build."
	    }
	}
   }
}
