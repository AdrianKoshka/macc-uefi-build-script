node("bn1") {
    stage("Cleanup and Clone") {
        // clean before build
        cleanWs()
        // clone the repo
        git branch: 'main', url: 'https://github.com/AdrianKoshka/macc-uefi-build-script'
    }
    parallel 'UEFI': {
        stage("Build UEFI") {
            sh 'python3 kickoff.py'
        }
        stage("Archive artefacts") {
            archiveArtifacts artifacts: 'e2b/trusted-firmware-a/build/a80x0_mcbin/release/flash-image.bin', followSymlinks: false
        }
    }, 'Docker Container': {
        stage("Build With Docker") {
            docker.build 'mubs:latest'
        }
    }, 'Podman Container': {
        stage("Build with Buildah") {
            sh '''buildah bud -t mubs:latest .
                buildah rmi mubs:latest '''
        }
    }
}