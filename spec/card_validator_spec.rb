require "card_validator"

describe CardValidator do

  describe ".identify_provider" do
    context "given a 15-digit string beginning with 37" do
      it "returns AMEX" do
        expect(CardValidator.identify_provider("3708 676657 30107")).to eql("AMEX")
      end
    end

    context "given a 15-digit string beginning with 34" do
      it "returns AMEX" do
        expect(CardValidator.identify_provider("3408 676667 30107")).to eql("AMEX")
      end
    end

    context "given a 16-digit string beginning with 6011" do
      it "returns DISCOVER" do
        expect(CardValidator.identify_provider("6011 2153 8672 5491")).to eql("DISCOVER")
      end
    end

    context "given a 16-digit string beginning with 51" do
      it "returns MASTERCARD" do
        expect(CardValidator.identify_provider("5191 7327 4575 0840")).to eql("MASTERCARD")
      end
    end

    context "given a 16-digit string beginning with 52" do
      it "returns MASTERCARD" do
        expect(CardValidator.identify_provider("5238 7776 3781 5297")).to eql("MASTERCARD")
      end
    end

    context "given a 16-digit string beginning with 53" do
      it "returns MASTERCARD" do
        expect(CardValidator.identify_provider("5368 8267 5487 1179")).to eql("MASTERCARD")
      end
    end

    context "given a 16-digit string beginning with 54" do
      it "returns MASTERCARD" do
        expect(CardValidator.identify_provider("5440 0268 2075 2014")).to eql("MASTERCARD")
      end
    end

    context "given a 16-digit string beginning with 55" do
      it "returns MASTERCARD" do
        expect(CardValidator.identify_provider("5505 8126 5631 0486")).to eql("MASTERCARD")
      end
    end

    context "given a 16-digit string beginning with 4" do
      it "returns VISA" do
        expect(CardValidator.identify_provider("4024 0071 4215 1744")).to eql("VISA")
      end
    end

    context "given a 13-digit string beginning with 4" do
      it "returns VISA" do
        expect(CardValidator.identify_provider("4929315641486")).to eql("VISA")
      end
    end

    context "given a 16-digit string beginning with an unknown pattern" do
      it "returns UNKNOWN" do
        expect(CardValidator.identify_provider("7929 3156 4148 6122")).to eql("UNKNOWN")
      end
    end

    context "given a number string that is too long" do
      it "returns UNKNOWN" do
        expect(CardValidator.identify_provider("4929 3156 4148 6122 1241")).to eql("UNKNOWN")
      end
    end

    context "given a number string that is too short" do
      it "returns UNKNOWN" do
        expect(CardValidator.identify_provider("4929 3156 4112")).to eql("UNKNOWN")
      end
    end

    context "given a string that contains invalid characters" do
      it "returns UNKNOWN" do
        expect(CardValidator.identify_provider("49A9 31-6 4112 C12D")).to eql("UNKNOWN")
      end
    end
  end

  describe ".valid?" do
    context "given a valid number" do
      it "returns true" do
        expect(CardValidator.valid?("4408 0412 3456 7893")).to be true
      end
    end

    context "given an invalid number" do
      it "returns false" do
        expect(CardValidator.valid?("4417 1234 5678 9112")).to be false
      end
    end
  end

end
