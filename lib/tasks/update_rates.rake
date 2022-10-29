namespace :currency do
  task update_rates: :environment do
    begin
      pairs = ConversationPair.includes(:base,:target).all
      cs = CurrencyService.new
      grouped = {}
      responses = []
  
      pairs.each do |p|
        if grouped.key?(p.base.name)
          grouped[p.base.name] << p.target.name
        else
          grouped[p.base.name] = [p.target.name]
        end
      end
  
      grouped.each do |base, targets|
        responses << cs.latest(base, targets.join(","))
      end
      
      responses.each do |res|
        res[:data][:rates].each do |target, rate|
          pair = pairs.find{ |p| p.base.name == res[:data][:base] && p.target.name == target.to_s }
          if pair.update(rate: rate)
            puts "[#{Time.now}] SUCCESS: #{pair.inspect}"
          else
            puts "[#{Time.now}] FAIL: #{pair.inspect}\n#{pair.errors.full_messages.join(", ")}"
          end
        end
      end
    rescue => exception
      p exception
    end
  end
end

# {
#   "base": "EUR",
#   "date": "2022-10-29",
#   "rates": {
#     "BGN": 1.955866,
#     "TRY": 18.517858
#   },
#   "success": true,
#   "timestamp": 1667069524
# }

# {
#   "base": "USD",
#   "date": "2022-10-29",
#   "rates": {
#     "TRY": 18.583604
#   },
#   "success": true,
#   "timestamp": 1667069643
# }