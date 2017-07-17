require "rails_helper"

RSpec.describe AuthenticationToken, type: :model do
  describe " AuthenticationToken validate" do
    context "relationship" do
      it{is_expected.to have_one(:user)}
    end
    context "column_specifications" do
      it{expect have_db_column(:token)}
    end
  end
end
