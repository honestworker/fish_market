namespace :meter do
  desc "Reset the meter to 0"
  task reset: :environment do
    Meter.update_all(percentage: 0)
  end

end
