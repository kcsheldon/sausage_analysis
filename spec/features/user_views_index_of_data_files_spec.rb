require 'rails_helper'

feature 'user views the index of data files', %{
  As a visitor
  I want to see the existing data files
} do

  # Acceptance Criteria:
  #   I must see the start page
  # * I must click on the link and be taken to ,
  #   the correct page that lists the existing data files

  scenario 'View initial page' do
    visit root_path
    expect(page).to have_content('Sausage Production Data Analysis')
    expect(page).to have_content('Data File Index')
  end
  scenario 'View inital page and navigate to the index page of data files' do
    visit root_path

    click_link 'Data File Index'

    expect(page).to have_content('Data File List')
    expect(page).to have_content('Add a new data set')
  end
end
