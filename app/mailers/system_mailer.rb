class SystemMailer < ActionMailer::Base
   def send_test_message
    mail(:to => "stephenallsopp@gmail.com", :subject => "Test", :from => "system@pccn.org.uk")  
  end 
  
end
