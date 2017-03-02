require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |holiday, supplies|
    supplies << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring].each do |holiday, supplies|
    if holiday == :memorial_day
      supplies << supply
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash.each do |key, value|
    if key == season
      holiday_hash[season][holiday_name] = supply_array
    end
  end

  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holidays|
    season = season.to_s.capitalize
    puts "#{season}:"
    holidays.each do |holiday, supplies|
      holiday = holiday.to_s.split("_")
      holiday.each {|word| word.capitalize!}
      holiday = holiday.join(" ")
      supplies = supplies.join(", ")
      puts "  #{holiday}: #{supplies}"
    end
  end

end

def all_holidays_with_bbq(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  result = []

  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      if supplies.include?("BBQ")
        result << holiday
      end
    end
  end

  result
end

