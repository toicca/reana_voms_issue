rule all:
    input:
        "rootfile.root"
        
rule processing:
    input:
        "openfile.py"
    output:
        "rootfile.root"
    container:
        "gitlab-registry.cern.ch/sft/docker/alma9-core:latest"
    resources:
        voms_proxy=True
    shell:
        """
        set +u # LCG contains unset variables
        source /cvmfs/sft.cern.ch/lcg/views/LCG_107a/x86_64-el9-gcc14-opt/setup.sh
        set -u

        # Check that the proxy is set
        echo $X509_USER_PROXY

        # Check if xrdcp works
        echo "xrdcp root://xrootd-cms.infn.it///store/mc/RunIII2024Summer24NanoAODv15/TTto4Q_TuneCP5_13p6TeV_powheg-pythia8/NANOAODSIM/150X_mcRun3_2024_realistic_v1-v2/100000/013c4b44-92a8-42a8-ac27-c127158c4726.root rootfile.root"
        xrdcp root://xrootd-cms.infn.it///store/mc/RunIII2024Summer24NanoAODv15/TTto4Q_TuneCP5_13p6TeV_powheg-pythia8/NANOAODSIM/150X_mcRun3_2024_realistic_v1-v2/100000/013c4b44-92a8-42a8-ac27-c127158c4726.root rootfile.root

        # Test opening the file in python
        echo "python3 openfile.py"
        python3 openfile.py
        """
