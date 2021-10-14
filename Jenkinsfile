node("bn1") {
    parallel 'Clean and Clone Node 1': {
        node("bn1") {
            stage("Cleanup and Clone") {
                // clean before build
                cleanWs()
                // clone the repo
                git branch: 'main', credentialsId: 'github-clone-key', url: 'git@github.com:AdrianKoshka/macc-uefi-build-script.git'
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
    }, 'Clean and Clone Node 2': {
        node("bn2") {
            stage("Cleanup and Clone") {
                // clean before build
                cleanWs()
                // clone the repo
                git branch: 'main', credentialsId: 'github-clone-key', url: 'git@github.com:AdrianKoshka/macc-uefi-build-script.git'
            }
            parallel 'Cross-compile UEFI': {
                stage("Build UEFI") {
                    dir('actions/scripts') {
                        sh 'python3 kickoff.py'
                    }
                }
            }, 'Compile x86_64 Container': {
                stage("Build with Docker") {
                    docker.build("mubs-cc:latest", "-f cross-compile.Dockerfile .")
                }
            }
        }
    }
}