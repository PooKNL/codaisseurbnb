require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "association with booking" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:room) { create :room, user: host_user }
    let!(:booking) { create :booking, room: room, user: guest_user }

    it "has bookings" do
      expect(guest_user.booked_rooms).to include(room)
    end
  end
end
