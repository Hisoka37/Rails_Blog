require 'rails_helper'

require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET index' do
    it 'renders the index template' do
      get user_posts_path(user_id: 1)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    let(:post) { create(:post) }

    it 'renders the show template' do
      get user_post_path(user_id: 1, id: post.id)
      expect(response).to render_template(:show)
    end
  end

  describe 'POST create' do
    it 'creates a new post' do
      post user_posts_path(user_id: 1), params: { post: { title: 'New Post' } }
      expect(response).to have_http_status(:created)
      # Add any additional expectations based on your implementation
    end
  end

  describe 'PUT update' do
    let(:post) { create(:post) }

    it 'updates the post' do
      put user_post_path(user_id: 1, id: post.id), params: { post: { title: 'Updated Post' } }
      expect(response).to have_http_status(:ok)
      # Add any additional expectations based on your implementation
    end
  end

  describe 'DELETE destroy' do
    let!(:post) { create(:post) }

    it 'deletes the post' do
      delete user_post_path(user_id: 1, id: post.id)
      expect(response).to have_http_status(:no_content)
      # Add any additional expectations based on your implementation
    end
  end
end
