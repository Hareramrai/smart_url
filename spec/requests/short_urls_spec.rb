require 'rails_helper'

RSpec.describe "ShortUrls", type: :request do
  let!(:short_urls) { create_list(:short_url, 3) }
  let(:short_url) { short_urls.first }

  describe 'GET /short_urls' do
  
    it 'returns status code 200' do
      get short_urls_path
      expect(response).to have_http_status(200)
    end

    it 'returns all short_urls' do
      get short_urls_path
      expect(response).to render_template(:index)
      expect(response.body).to include(short_url.url)
    end
  end

  describe 'GET /short_urls/new' do

    it 'returns status code 200' do
      get new_short_url_path
      expect(response).to have_http_status(200)
    end

    it 'returns new short_url form' do
      get new_short_url_path
      expect(response).to render_template(:new)
      expect(response.body).to include("New Short Url")
    end
  end

  describe 'POST /short_urls' do

    describe 'when the request is valid' do
      let(:valid_attributes) { { short_url: attributes_for(:short_url) } }
      before {
        post short_urls_path, params: valid_attributes 
      }
      it 'creates a short_url and redirect to show page' do
        expect(response).to redirect_to(assigns(:short_url))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include("Short url was successfully created.")
      end
    end

    describe 'when the request is invalid' do
      before { post short_urls_path, params: invalid_attributes }

      context "when title is blank" do
        let(:invalid_attributes) { { short_url: attributes_for(:short_url, url: nil) } }

        it 'returns a validation failure message' do
          expect(response.body).to include("Url can&#39;t be blank")
        end
      end
    end
  end

  describe 'PATCH /short_urls/:id' do

    context 'when the request is valid' do
      let(:valid_attributes) { { short_url: attributes_for(:short_url) } }
      before {
        patch short_url_path(short_url), params: valid_attributes 
      }

      it 'updates a short_url and redirect to show page' do
        expect(response).to redirect_to(assigns(:short_url))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include("Short url was successfully updated.")
      end
    end

    context 'when the request is invalid' do
      let(:valid_attributes) { { short_url: attributes_for(:short_url, url: nil) } }
      before {
        patch short_url_path(short_url), params: valid_attributes 
      }
      
      it 'failed to updates a short_url and render edit page' do
        expect(response).to render_template(:edit)
        expect(response.body).to include("Url can&#39;t be blank")
      end
    end
  end

  describe 'DELETE /short_urls/:id' do
    context 'when short_url is present' do
      it 'deletes the short_url and redirect to index' do
        delete short_url_path(short_url.id)
        expect(response).to redirect_to(short_urls_path)
        follow_redirect!
        expect(response).to render_template(:index)
        expect(response.body).to include("Short url was successfully destroyed.")
      end
    end
  end

  describe 'GET /:key' do
    it 'redirects to original url based on key' do
      get visit_path(short_url.url_key)
      expect(response).to redirect_to(short_url.url)
    end
  end

end
