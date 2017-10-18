require "spec_helper"
require "nutrientes/alimento"

RSpec.describe Nutrientes do
  it "tiene un numero de version" do
    expect(Nutrientes::VERSION).not_to be nil
  end
end

RSpec.describe Alimento do
  it "tiene un nombre" do
    expect{Alimento.new("Pollo")}.not_to raise_error
  end
end
