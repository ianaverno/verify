#!/usr/bin/ruby
require "./lib/card_validator"

card_number        = ARGV.join()

provider_result    = CardValidator.identify_provider(card_number)
valid_result       = CardValidator.valid?(card_number) ? "VALID" : "INVALID"

provider_text      = "This card's provider is:"
valid_text         = "and according to Luhn algorithm it is:"

output_line_length = 60
provider_format    = "%#{output_line_length - provider_text.length}s"
valid_format       = "%#{output_line_length - valid_text.length}s"

puts "\n" + "–" * output_line_length
puts provider_text + sprintf(provider_format, provider_result)
puts valid_text    + sprintf(valid_format, valid_result)
puts "–" * output_line_length
