require 'rails_helper'

# Example
RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: 19.99
    fill_in 'Published date', with: '2020-09-28'
    # if you use date_select in the form for book:
    # select '2020' :from => 'book_published_date_1i'
    # select '9' :from => 'book_published_date_2i'
    # select '28' :from => 'book_published_date_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('JK Rowling')
    expect(page).to have_content('19.99')
    expect(page).to have_content('2020-09-28')
  end
end
