require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe '#tag_list=' do 
  	let(:post) {Post.create(title: 'Example post')}
  	context 'no tags provided' do 
  		it 'gives 0 tags to the post' do 
  			post.tag_list =''
  			expect(post.tags).to be_empty
  		end
  	end

  	context '1 tag' do 
  		it 'adds that tag to our post' do 
  			post.tag_list = '#yolo'
  			expect(post.tags.first.text).to eq '#yolo'
  		end
	end
end

end
