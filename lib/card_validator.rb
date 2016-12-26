class CardValidator

  def self.identify_provider(card_number)
    if is_amex?(card_number)
      "AMEX"
    elsif is_discover?(card_number)
      "DISCOVER"
    elsif is_mastercard?(card_number)
      "MASTERCARD"
    elsif is_visa?(card_number)
      "VISA"
    else
      "UNKNOWN"
    end
  end

  def self.valid?(card_number)
    if is_numeric?(card_number)
      luhn_validate(card_number)
    else
      false
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
