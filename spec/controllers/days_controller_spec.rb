require 'rails_helper'

describe DaysController do
  let(:convention) { create :convention }

  describe 'GET new' do
    it 'assigns the convention' do
      get :new, convention_id: convention.id
      expect(assigns(:convention)).to eq convention
    end

    it 'assigns a new day' do
      get :new, convention_id: convention.id
      expect(assigns(:day)).to be_a_new Day
    end

    it 'assigns the day to the convention' do
      get :new, convention_id: convention.id
      expect(assigns(:day).convention_id).to eq convention.id
    end
  end

  describe 'POST create' do
    it 'assigns the convention' do
      post :create, convention_id: convention.id, day: attributes_for(:day)
      expect(assigns(:convention)).to eq convention
    end

    context 'with valid params' do
      it 'creates a new day on the correct convention' do
        expect do
          post :create, convention_id: convention.id, day: attributes_for(:day)
        end.to change(convention.days, :count).by(1)
      end

      it 'creates the day and assigns it' do
        post :create, convention_id: convention.id, day: attributes_for(:day)
        expect(assigns(:day)).to be_persisted
      end

      it 'redirects to the conventions page' do
        post :create, convention_id: convention.id, day: attributes_for(:day)
        expect(response).to redirect_to convention_path(convention)
      end
    end

    context 'with invalid params' do
      it 'assigns a new day' do
        post :create, convention_id: convention.id, day: { name: '' }
        expect(assigns(:day)).to be_a_new(Day)
      end

      it 're-renders the new template' do
        post :create, convention_id: convention.id, day: { name: '' }
        expect(response).to render_template('new')
      end
    end
  end
end
