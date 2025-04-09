import ROOT

print("Loading the file")
rdf = ROOT.RDataFrame("Events",
    "root://xrootd-cms.infn.it///store/mc/RunIII2024Summer24NanoAODv15/TTto4Q_TuneCP5_13p6TeV_powheg-pythia8/NANOAODSIM/150X_mcRun3_2024_realistic_v1-v2/100000/013c4b44-92a8-42a8-ac27-c127158c4726.root")

print("Finding the mean of Jet_pt")
print(rdf.Mean("Jet_pt").GetValue())
print("Done")
