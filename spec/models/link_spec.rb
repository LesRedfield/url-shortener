require 'rails_helper'

RSpec.describe Link, type: :model do

  describe "ActiveModel validations" do
    it { should validate_length_of(:long_url).is_at_least(6) }
  end

  describe "#generate_short_url" do
    let(:hsw) { Link.create({ long_url: "https://www.linkedin.com/in/les-redfield" }) }
    let(:hw) { Link.create({ long_url: "http://www.fivethirtyeight.com" }) }
    let(:hs) { Link.create({ long_url: "https://github.com/" }) }
    let(:h) { Link.create({ long_url: "http://angel.co" }) }
    let(:w) { Link.create({ long_url: "www.uniteus.com" }) }
    let(:other) { Link.create({ long_url: "lesredfield.com" }) }

    it "generates a short url" do
      expect(hsw.short_url).to_not eq(nil)
    end

    context "parses domain abbreviations correctly" do

      it "parses domain abbreviation for 'https://www.' urls" do
        expect(hsw.short_url[0, 3]).to eq('lin')
      end

      it "parses domain abbreviation for 'http://www.' urls" do
        expect(hw.short_url[0, 3]).to eq('fiv')
      end

      it "parses domain abbreviation for 'https://' urls" do
        expect(hs.short_url[0, 3]).to eq('git')
      end

      it "parses domain abbreviation for 'http://' urls" do
        expect(h.short_url[0, 3]).to eq('ang')
      end

      it "parses domain abbreviation for 'www.' urls" do
        expect(w.short_url[0, 3]).to eq('uni')
      end

      it "parses domain abbreviation for other urls" do
        expect(other.short_url[0, 3]).to eq('les')
      end
    end
  end
end
