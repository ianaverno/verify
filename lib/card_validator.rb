class CardValidator

  def self.identify_provider(input_number)
    card_number = input_number.gsub(/\s+/, "")

    if is_amex?(card_number)
      return "AMEX"
    elsif is_discover?(card_number)
      return "DISCOVER"
    elsif is_mastercard?(card_number)
      return "MASTERCARD"
    elsif is_visa?(card_number)
      return "VISA"
    else
      return "UNKNOWN"
    end
  end

  def self.valid?(input_number)
    card_number = input_number.gsub(/\s+/, "")
    if is_numeric?(card_number)
      luhn_validate(card_number)
    else
      return false
    end
  end

  private
    def self.is_amex?(number)
      /^3[47]\d{13}$/ === number
    end

    def self.is_discover?(number)
      /^6011\d{12}$/ === number
    end

    def self.is_mastercard?(number)
      /^5[1-5]\d{14}$/ === number
    end

    def self.is_visa?(number)
      /^4\d{15}$/ === number or /^4\d{12}$/ === number
    end

    def self.is_numeric?(number_string)
      /^\d+$/ === number_string
    end

    def self.luhn_validate(number)
      sum = 0
      number.reverse.each_char.with_index do |digit, index|
        if index.even?
          sum += digit.to_i
        else
          doubled = (digit.to_i * 2).to_s
          doubled.each_char { |d| sum += d.to_i }
        end
      end

      sum % 10 == 0
    end
end
