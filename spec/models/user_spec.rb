require "rails_helper"

describe User do

    let(:user) do
        FactoryBot.create :user
    end

    it 'can create' do
        user
        expect do 
           FactoryBot.create :user
        end.to change{ User.count }.by(1)
    end


    describe 'created user' do
        before do
            #user create
            user
        end

        it 'can delete' do
    
            
            #delete user
            expect do 
                user.destroy
            end.to change{ User.count }.by(-1)
        end

        it 'can update' do

            #edit email
            user.email = 'edited@email.com'
            user.save  

            expect(User.last.email).to eq('edited@email.com')
        end
    end
end