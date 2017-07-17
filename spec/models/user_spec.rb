require "rails_helper"

RSpec.describe User, type: :model do
  describe " User validate" do
    context "relationship" do
      it{expect have_one(:authentication_token)}
    end
    context "column_specifications" do
      it{expect have_db_column(:email).of_type(:text)}
    end
  end
end
