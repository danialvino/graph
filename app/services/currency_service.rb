class CurrencyService

  BASE_URL = "https://free.currencyconverterapi.com/api/v6/convert"

  def initialize(data)
    @coin  = data
  end

  def call
    request
  end


  private

  def request
    ini_date = 1.week.ago.to_date.strftime('%Y-%m-%d')
    end_date = Date.today.strftime('%Y-%m-%d')
    path = "?q=#{@coin}_BRL&compact=ultra&date=#{ini_date}&endDate=#{end_date}&apiKey=0fc4a092ba4b80cf1a1a"
    response = RestClient.get(BASE_URL+path)
    response_obj = JSON.parse(response)
    currency = []
    response_obj.first[1].each do |day, coin|
      date = Time.parse(day).to_i*1000
      array = []
      array << date
      array << coin
      currency << array
      array = []
    end
    currency
  end

end
