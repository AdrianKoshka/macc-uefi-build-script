node("rpi4") {
    stage("Clone") {
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
    stage("Build") {
        sh 'python3 kickoff.py'
    }
}