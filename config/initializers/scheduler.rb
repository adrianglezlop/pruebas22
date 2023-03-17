
require 'rufus-scheduler'


scheduler = Rufus::Scheduler::singleton
unless scheduler.down?
#  scheduler.cron '0 22 * * *' do
#    Coman.create(c:"#{Time.now} yaaaa jala")
#  end
#  scheduler.every("1m", :blocking => true) do
#    Coman.create(c:Coman.last.c.to_i + 1)
#  end
end

