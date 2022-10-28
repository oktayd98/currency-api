class CurrencyService
  def initialize
    @conn = Faraday.new(ENV["url"]) do |f|
      f.response :json, parser_options: { symbolize_names: true }
      f.headers["apikey"] = ENV["apikey"]
    end
  end

  def latest(base, symbols)
    res = @conn.get("/fixer/latest", { base: base, symbols: symbols })
    return {
      status: res.status,
      data: res.body
    }
  end

  def symbols
    res = @conn.get("/fixer/symbols")
    return {
      status: res.status,
      data: res.body
    }
  end
end