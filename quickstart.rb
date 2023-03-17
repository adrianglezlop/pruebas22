require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new
scheduler.every '30s' do
  cad = "#{Time.now} -- se ejecuto"
  puts cad 
end

scheduler.join
