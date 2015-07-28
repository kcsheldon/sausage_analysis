require 'rails_helper'

feature 'user adds a new data file', %{
  As a user
  I want to see the existing data files
  and add a new one.
} do

  # Acceptance Criteria:
  #   I must see the Add New data file page
  # * Fill in the form
  #   and see the new data file in the list of existing data files

  scenario 'View index page of data files and navigate to the add new file page' do
    visit data_files_path

    expect(page).to have_content('Data File List')
    expect(page).to have_content('Add a new data set')

    click_link 'Add a new data set'

    expect(page).to have_content('New Data Set')
    expect(page).to have_content('Csv file')
    expect(page).to have_content('Name')
  end

  scenario 'provide valid file information to upload a new .csv file' do
    visit new_data_file_path

    fill_in 'Name', with: 'Sausage Test'
    fill_in 'Category', with: 'Test'
    fill_in 'Description', with: 'Test CSV file'
    attach_file 'Csv file',
    "spec/support/uploads/files/SausageavgComp.csv"
    click_button 'Add Data File'

    expect(page).to have_content('Sausage Test')
  end
end
