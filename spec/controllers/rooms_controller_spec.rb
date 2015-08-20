require 'rails_helper'

describe RoomsController do
  fixtures :users

  before do
    @user = users(:dan)
    login_user
  end

  let(:convention) { create :convention }

  describe 'GET new' do
    it 'assigns the convention' do
      get :new, convention_id: convention.id
      expect(assigns(:convention)).to eq convention
    end

    it 'assigns a new room' do
      get :new, convention_id: convention.id
      expect(assigns(:room)).to be_a_new Room
    end

    it 'assigns the room to the convention' do
      get :new, convention_id: convention.id
      expect(assigns(:room).convention_id).to eq convention.id
    end
  end

  describe 'POST create' do
    it 'assigns the convention' do
      post :create, convention_id: convention.id, room: attributes_for(:room)
      expect(assigns(:convention)).to eq convention
    end

    context 'with valid params' do
      it 'creates a new room on the correct convention' do
        expect do
          post :create, convention_id: convention.id, room: attributes_for(:room)
        end.to change(convention.rooms, :count).by(1)
      end

      it 'creates the room and assigns it' do
        post :create, convention_id: convention.id, room: attributes_for(:room)
        expect(assigns(:room)).to be_persisted
      end

      it 'redirects to the conventions page' do
        post :create, convention_id: convention.id, room: attributes_for(:room)
        expect(response).to redirect_to convention_path(convention)
      end
    end

    context 'with invalid params' do
      it 'assigns a new room' do
        post :create, convention_id: convention.id, room: { name: '' }
        expect(assigns(:room)).to be_a_new(Room)
      end

      it 're-renders the new template' do
        post :create, convention_id: convention.id, room: { name: '' }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET edit' do
    let!(:room) { create :room }

    it 'assigns the room' do
      get :edit, id: room.id
      expect(assigns(:room)).to eq room
    end
  end

  describe 'PUT update' do
    let!(:room) { convention.rooms.create(attributes_for(:room)) }

    it 'assigns the room' do
      put :update, id: room.id, room: { name: 'abc' }
      expect(assigns(:room)).to eq room
    end

    context 'with valid params' do
      it 'updates the room' do
        put :update, id: room.id, room: { name: 'something else' }
        room.reload
        expect(room.name).to eq 'something else'
      end

      it 'redirects to the rooms page' do
        put :update, id: room.id, room: { name: 'something else' }
        expect(response).to redirect_to convention_path(convention)
      end
    end

    context 'with invalid params' do
      it 're-renders the edit form' do
        put :update, id: room.id, room: { name: '' }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:room) { convention.rooms.create(attributes_for(:room)) }

    it 'destroys the requested room' do
      expect { delete :destroy, id: room.id }
        .to change(Room, :count).by(-1)
    end

    it 'redirects to the rooms page' do
      delete :destroy, id: room.id
      expect(response).to redirect_to convention_path(convention)
    end
  end
end
