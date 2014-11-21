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


describe 'filtering by tags' do 
	before do 
		Post.create(title: 'Post A', tag_list: '#yolo, #swag')
		Post.create(title: 'Post B', tag_list: '#yolo, #bob')
	end

	it 'filters to show only tagged posts' do 
		visit '/posts'
		click_link '#swag'

		expect(page).to have_css 'h1', text: 'Posts tagged with #swag'
		expect(page).to have_content 'Post A'
		expect(page).not_to have_content 'Post B'
	end

	it 'accessible via pretty URLs' do 
		visit '/tags/swag'

		expect(page).to have_content 'Post A'
		end

end
end