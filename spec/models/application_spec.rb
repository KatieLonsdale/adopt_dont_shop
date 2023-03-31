require 'rails_helper'

RSpec.describe Application do
  describe 'relationships' do
    it {should have_many :pets_applications}
    it {should have_many(:pets).through(:pets_applications)}
  end
end