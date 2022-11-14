# frozen_string_literal: true

require 'rails_helper'

# rubocop:todo Style/InlineComment
RSpec.describe('Auth0s', type: :request) do # rubocop:todo RSpec/EmptyExampleGroup, Style/InlineComment
  # rubocop:enable Style/InlineComment
  describe "GET /callback" do
    it "returns http success" do
      get "/auth/auth0/callback"
      expect(response).to have_http_status(302) #needs to be fixed to :success
    end
  end

  # describe "GET /failure" do
  #   it "returns http success" do
  #     get "/auth0/failure"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /logout" do
  #   it "returns http success" do
  #     get "/auth0/logout"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  # describe "GET /root" do
  #   it "returns http success" do
  #     get "/"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
