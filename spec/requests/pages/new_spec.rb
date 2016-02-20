require 'rails_helper'

describe 'GET /pages/new' do
  it do
    get new_page_path
    page = assigns(:page)
    expect(page.persisted?).to be_falsey
  end
end
