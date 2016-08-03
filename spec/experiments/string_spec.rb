require 'rails_helper'

describe String do
	describe '#<<' do
		example '文字の追加' do 
			s = "ABC"
			s << 'D'
			expect(s.size).to eq(4)
		end
		example 'nilの追加' do 
			pending('調査中')
			s = "ABC"
			s << nil
			expect(s.size).to eq(4)
		end
		xexample 'nilの追加' do 
			s = "ABC"
			s << nil
			expect(s.size).to eq(4)
		end
		example 'nilは追加できない' do 
			s = "ABC"
			expect { s << nuil }.to raise_error(TypeError)
		end
		example 'nilは追加できない', :exception do 
			s = "ABC"
			expect { s << nuil }.to raise_error(TypeError)
		end
	end
end