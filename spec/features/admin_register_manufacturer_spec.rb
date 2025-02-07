require 'rails_helper'

feature 'Admin register manufacturer' do
  scenario 'successfully' do
    visit root_path #primeiro teste sempre tem que seguir o caminho completo
    click_on 'Fabricantes'
    click_on 'Registrar novo fabricante'

    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(page).to have_content('Fiat')
  end

  scenario 'and must fill in all fields' do
    visit new_manufacturer_path #segundo teste pode ser direto
    fill_in 'Nome', with:''
    click_on 'Enviar'

    expect(page).to have_content ('Todo os campos devem ser preenxidos')
  end

  scenario 'and name must be unique' do
    Manufacturer.create!(name: 'Fiat')

    visit new_manufacturer_path
    fill_in 'Nome', with:'Fiat'
    click_on 'Enviar'

    expect(page).to have_content ('Fabricante já está em uso')
  end
end