# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def generate_navigation(sections, patient_id, base_url=[])
    str = ["<ul>"]
    
    sections.each do |section|
      section_base_url = base_url + [section.path]
      
      str << ["<li>"]
      str << [link_to(section.name, :id=>patient_id, :path=>section_base_url)]
      
      if(!section.sections.empty?)
        str << generate_navigation(section.sections, patient_id, section_base_url)
      end
      
      str << ["</li>"]
    end
    
    str << ["</ul>"]
    
    str.join("")
  end
  
  def generate_root_document_section_html(sections, path_prefix="")
    str = []
    
    sections.each do |section|
      if(path_prefix.blank?)
        section_path_prefix = section.path
      else
        section_path_prefix = path_prefix+"/"+section.path
      end
      
      str << "<tr class='"+cycle('even', 'odd')+"'>"
      str << "<td class='section_id'>#{section.type_id}</td>"
      str << "<td class='section_name'>#{section.name}</td>"
      str << "<td class='section_path'>#{section_path_prefix}</td>"
      str << "</tr>"

      if(!section.sections.empty?)
        str << generate_root_document_section_html(section.sections, section_path_prefix)
      end
    end
    
    return str.join("")
  end
  
  def format_date(dt)
    if(dt.nil?)
      return "N/A"
    elsif(dt.respond_to?(:value))
      dt = dt.value
    end
    
    return dt.strftime("%d %b %Y at %I:%M %p")
  end
  
  def calculate_age(birth_time)  
    age = Date.today.year - birth_time.year
    if Date.today.month < birth_time.month ||
    (Date.today.month == birth_time.month && birth_time.day >= Date.today.day)
      age = age - 1
    end
    age.to_s
  end
end
