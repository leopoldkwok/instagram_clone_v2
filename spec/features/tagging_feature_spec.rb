require 'rails_helper'

describe 'tagging posts' do 
	it 'displays tags as links under posts' do 
		visit '/posts'
 		click_link 'New post'
 		fill_in 'Title', with: 'A brand new post'
 		fill_in 'Tags', with: '#yolo, #swag'
 		click_button 'Create post'

 		expect(page).to have_link '#yolo'
 		expect(page).to have_link '#swag'
	end
end