require 'rails_helper'

describe TracksController do
  let(:convention) { create :convention }

  describe 'GET new' do
    it 'assigns the convention' do
      get :new, convention_id: convention.id
      expect(assigns(:convention)).to eq convention
    end

    it 'assigns a new track' do
      get :new, convention_id: convention.id
      expect(assigns(:track)).to be_a_new Track
    end

    it 'assigns the track to the convention' do
      get :new, convention_id: convention.id
      expect(assigns(:track).convention_id).to eq convention.id
    end
  end

  describe 'POST create' do
    it 'assigns the convention' do
      post :create, convention_id: convention.id, track: attributes_for(:track)
      expect(assigns(:convention)).to eq convention
    end

    context 'with valid params' do
      it 'creates a new track on the correct convention' do
        expect do
          post :create, convention_id: convention.id, track: attributes_for(:track)
        end.to change(convention.tracks, :count).by(1)
      end

      it 'creates the track and assigns it' do
        post :create, convention_id: convention.id, track: attributes_for(:track)
        expect(assigns(:track)).to be_persisted
      end

      it 'redirects to the conventions page' do
        post :create, convention_id: convention.id, track: attributes_for(:track)
        expect(response).to redirect_to convention_path(convention)
      end
    end

    context 'with invalid params' do
      it 'assigns a new track' do
        post :create, convention_id: convention.id, track: { name: '' }
        expect(assigns(:track)).to be_a_new(Track)
      end

      it 're-renders the new template' do
        post :create, convention_id: convention.id, track: { name: '' }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET edit' do
    let!(:track) { create :track }

    it 'assigns the track' do
      get :edit, id: track.id
      expect(assigns(:track)).to eq track
    end
  end

  describe 'PUT update' do
    let!(:track) { convention.tracks.create(attributes_for(:track)) }

    it 'assigns the track' do
      put :update, id: track.id, track: { name: 'abc' }
      expect(assigns(:track)).to eq track
    end

    context 'with valid params' do
      it 'updates the track' do
        put :update, id: track.id, track: { name: 'something else' }
        track.reload
        expect(track.name).to eq 'something else'
      end

      it 'redirects to the tracks page' do
        put :update, id: track.id, track: { name: 'something else' }
        expect(response).to redirect_to convention_path(convention)
      end
    end

    context 'with invalid params' do
      it 're-renders the edit form' do
        put :update, id: track.id, track: { name: '' }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:track) { convention.tracks.create(attributes_for(:track)) }

    it 'destroys the requested track' do
      expect { delete :destroy, id: track.id }
        .to change(Track, :count).by(-1)
    end

    it 'redirects to the tracks page' do
      delete :destroy, id: track.id
      expect(response).to redirect_to convention_path(convention)
    end
  end
end
