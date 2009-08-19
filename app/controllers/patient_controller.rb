class PatientController < ApplicationController
  def index
    redirect_to :action => :list
  end
  
  def list
    @patients = PatientLoader.get_patients(BASE_URI, LOCAL_MODE)
  end
  
  def show
    @patient_id = params[:id]
    path = params[:path]
    
    if(@patient_id.nil?)
      render :text => "I need a patient id sucka!!"
      return
    end
 
    hdata = Hdata.new(@patient_id, BASE_URI, path, LOCAL_MODE)
    
    @objs = hdata.section_data
    @root_obj = hdata.root
    @error = hdata.error
    
    if(!@objs.empty?) 
      @view_type_id = @objs.first.class.to_s.underscore
    end
  end
end
