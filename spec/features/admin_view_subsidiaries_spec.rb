require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Almeidinha Cars', cnpj: '00.000.000/0000-00', 
                       address: 'Alameda Santos, 1293')

    visit root_path
    click_on 'Filiais'
    click_on 'Almeidinha Cars'

    expect(page).to have_content('Almeidinha Cars')
    expect(page).to have_content('00.000.000/0000-00')
    expect(page).to have_content('Alameda Santos, 1293')
  end

  scenario 'and subsidiaries are not registered' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Não existe filiais cadrastadas no sistema')
  end
end