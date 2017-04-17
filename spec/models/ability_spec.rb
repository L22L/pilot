require 'rails_helper'

RSpec.describe User do
  describe "abilities" do
    context "#initialize" do
      it "admin can do anything" do
        user = User.create(name: "admin", email: "admin@gmail.com", password: "123456", role: 1)
        ability = Ability.new(user)
        assert ability.can?(:read, Book.new)
        assert ability.can?(:read, Lesson.new)
        assert ability.can?(:destroy, Word.new)
        assert ability.can?(:edit, User.new)
      end

      it "user read only" do
        user = User.create(name: "long", email: "long@gmail.com", password: "123456")
        ability = Ability.new(user)
        assert ability.can?(:read, Book.new)
        assert ability.can?(:read, Lesson.new)
        assert ability.can?(:read, Word.new)
      end
    end
  end
end
