class PatientLoader
  def self.get_patients(hdata_repo_uri, from_local=true)
    if(from_local)
      PatientLoader.get_patients_from_fs(hdata_repo_uri)
    else
      PatientLoader.get_patients_from_remote(hdata_repo_uri)
    end
  end
  
private 
  def self.get_patients_from_fs(hdata_repo_uri)
    if(!File.directory?(hdata_repo_uri))
      error = "I cannot find the path: " + hdata_repo_uri
    else
      patients = []
      d = Dir.new(hdata_repo_uri)
      d.entries.each { |n| patients << n if ((n.index(".") != 0) && !File.file?(d.path+"/"+n)) } 
    end
    
    patients
  end
  
  def self.get_patients_from_remote(hdata_repo_uri)
    []
  end
end