require 'rails_helper'

describe 'posts' do 
 context 'no posts' do
 	it 'shows a message' do
 	visit '/posts'
 	expect(page).to have_content 'No posts yet'
 	end
 end

 context 'with posts' do 
 	before do
 		Post.create(title: 'Hello world')
 	end

 	it 'display a list of all posts' do 
 		visit '/posts'
 		expect(page).to have_content 'Hello world'
 	end
 end

describe 'creating posts' do
 	it 'adds the posts from a form' do 
 		visit '/posts'
 		click_link 'New post'
 		fill_in 'Title', with: 'A brand new post'
 		click_button 'Create post'
 		
 		expect(page).to have_content 'A brand new post'
 		expect(current_path).to eq '/posts'
 	end

 	it 'displays no image, if no picture attached' do 
 		visit '/posts'
 		click_link 'New post'
 		fill_in 'Title', with: 'A brand new post'
 		click_button 'Create post'

 		expect(page).not_to have_css 'img.uploaded-pic'
	end

 	it 'can attach an image to a post' do 
		visit '/posts'
 		click_link 'New post'
 		fill_in 'Title', with: 'A brand new post'
 		attach_file 'Picture', Rails.root.join('spec/images/Sunset_2007-1.jpg')
 		click_button 'Create post'

 		expect(page).to have_css 'img.uploaded-pic'
	end
 	end
end