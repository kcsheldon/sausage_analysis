require 'rails_helper'

feature 'user views data file details and charts', %{
  As a user
  I want to see the details of an existing data file
  So I can view the charts.
} do

  # Acceptance Criteria:
  #   I must add a new data file
  # * Fill in the form
  #  see the new data file in the list of existing data files
  # See the details for that file and view the charts

  scenario 'Upload a new .csv file and go to the show details page and chart page' do
    visit new_data_file_path

    fill_in 'Name', with: 'Sausage Test'
    fill_in 'Category', with: 'Test'
    fill_in 'Description', with: 'Test CSV file'
    attach_file 'Csv file',
    "spec/support/uploads/files/SausageavgComp.csv"
    click_button 'Add Data File'

    expect(page).to have_content('Sausage Test')

    click_link 'Sausage Test'

    expect(page).to have_content('Data File')
    expect(page).to have_content('Sausage Test')
    expect(page).to have_content('Show data file charts')
    expect(page).to have_content('Delete data set')

    click_link 'Show data file charts'

    expect(page).to have_content('Line Chart Information')
    expect(page).to have_content('Sausage Test')
    expect(page).to have_content('Maximum Average Peak Penetration Force')
    expect(page).to have_content('First Ten Rows of data')
  end
end
