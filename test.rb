package 'httpd' do
    action :install
end

service 'httpd' do
    action [:enable, :start]
end

file '/etc/motd' do
    owner 'root'
    group 'root'
    mode '0644'
    content 'Hello world'
end

user 'Rubee.Yadav' do
    comment 'Rubee Yadav'        
    home '/home/Rubee.Yadav'     
    shell '/bin/bash'                   
    manage_home true                    
    action :create                      
end

cron 'daily_test_command' do
    minute '45'
    hour '5'
    command '/path/to/test_command'  # Replace with the actual command you want to run
    user 'root'                       # Replace with the user you want the command to run as, if not root
    action :create
end

timezone 'Europe/London' do
    action :set
end
  
