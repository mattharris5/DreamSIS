class StudentPersonResource < UwWebResource
  self.prefix = "/student/v4/"
  self.element_name = "person"
  self.collection_name = "person"
  self.primary_key = "UWRegID"
  self.caller_class = "StudentPersonResource"
  
  def self.find(*args)
    sws_log args.inspect, "Find"
    super
  end
  
  # def self.find_by_uwnetid(uwnetid)
  #   results = self.find(nil, :params => {:uwnetid => uwnetid})
  #   return nil if results.Persons.nil?
  #   self.find results.Persons.Person.PersonURI.UWRegID
  # end
  
  def photo
    @photo ||= StudentPhoto.new(id)
  end

  def active_registrations(quarter)
    params = { :reg_id => self.RegID, :is_active => "on" }
    params[:year] = quarter.year if quarter
    params[:quarter] = quarter.quarter_title if quarter
    @active_registrations ||= RegistrationResource.find("registration", :params => params)
  end
  
end