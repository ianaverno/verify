require "card_validator"

describe CardValidator do

  describe ".identify_provider" do
    context "given a 15-digit string beginning with 37" do
      it "returns AMEX" do
        expect(CardValidator.identify_provider("370867665730107")).to eql("AMEX")
      end
    end

    context "given a 15-digit string beginning with 34" do
      it "returns AMEX" do
        expect(CardValidator.identify_provider("340867666730107")).to eql("AMEX")
      end
    end

    context "given a 16-digit string beginning with 6011" do
      it "returns DISCOVER" do
        expect(CardValidator.identify_provider("6011215386725491")).to eql("DISCOVER")
      end
    end

    context "given a 16-digit string beginning with 51" do
      it "returns MASTERCARD" do
        expect(CardValidator.identify_provider("5191732745750840")).to eql("MASTERCARD")
      end
    end

    context "given a 16-digit string beginning with 52" do
      it "returns MASTERCARD" do
        expect(CardValidator.identify_provider("5238777637815297")).to eql("MASTERCARD")
      end
    end

    context "given a 16-digit string beginning with 53" do
      it "returns MASTERCARD" do
        expect(CardValidator.identify_provider("5368826754871179")).to eql("MASTERCARD")
      end
    end

    context "given a 16-digit string beginning with 54" do
      it "returns MASTERCARD" do
        expect(CardValidator.identify_provider("5440026820752014")).to eql("MASTERCARD")
      end
    end

    context "given a 16-digit string beginning with 55" do
      it "returns MASTERCARD" do
        expect(CardValidator.identify_provider("5505812656310486")).to eql("MASTERCARD")
      end
    end

    context "given a 16-digit string beginning with 4" do
      it "returns VISA" do
        expect(CardValidator.identify_provider("4024007142151744")).to eql("VISA")
      end
    end

    context "given a 13-digit string beginning with 4" do
      it "returns VISA" do
        expect(CardValidator.identify_provider("4929315641486")).to eql("VISA")
      end
    end

    context "given a 16-digit string beginning with an unknown pattern" do
      it "returns UNKNOWN" do
        expect(CardValidator.identify_provider("7929315641486122")).to eql("UNKNOWN")
      end
    end

    context "given a number string that is too long" do
      it "returns UNKNOWN" do
        expect(CardValidator.identify_provider("49293156414861221241")).to eql("UNKNOWN")
      end
    end

    context "given a number string that is too short" do
      it "returns UNKNOWN" do
        expect(CardValidator.identify_provider("492931564112")).to eql("UNKNOWN")
      end
    end

    context "given a string that contains invalid characters" do
      it "returns UNKNOWN" do
        expect(CardValidator.identify_provider("49A931-64112C12D")).to eql("UNKNOWN")
      end
    end
  end

  describe ".valid?" do
    context "given a valid number" do
      it "returns true" do
        expect(CardValidator.valid?("4408041234567893")).to be true
      end
    end

    context "given an invalid number" do
      it "returns false" do
        expect(CardValidator.valid?("4417123456789112")).to be false
      end
    end
  end
end
