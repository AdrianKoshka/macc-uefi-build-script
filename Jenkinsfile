def clone() {
    cleanWs()
        if (env.BRANCH_NAME ==~ /PR.*/) {
            branch = "${env.CHANGE_BRANCH}"
        }
            else if (env.BRANCH_NAME ==~ /main.*/)
        {
            branch = "${env.BRANCH_NAME}"
        }
        git branch: branch, credentialsId: 'git', url: 'git@github.com:AdrianKoshka/macc-uefi-build-script.git'
}

node("rpi4") {
    stage("Build") {
        parallel 'Stock': {
            ws('stock') {
                clone()
                sh 'python3 kickoff.py'
            }
        }, 'with ECAM patch': {
            ws('ECAM') {
                clone()
                sh 'python3 kickoff.py -e'
            }
        }
    }
}