require 'rails_helper'

RSpec.describe 'Creating a status', type: :feature do
  scenario 'valid inputs' do
    visit new_status_path
    fill_in 'Value', with: 'Officer'
    click_on 'Create Status'
    visit statuses_path
    expect(page).to have_content('Officer')
  end
end
