require 'rails_helper'

describe 'my blog' do
  before do
    create :article, title: 'testingone'
  end

  it 'displays a blog post on the site' do
    visit '/articles'

    expect(page).to have_content('testingone')
  end

  context 'admin' do
    it 'displays a list of blog post' do
      create :article, title: 'testingtwo'
      visit_auth '/admin/articles'

      expect(page).to have_content('testingone')
      expect(page).to have_content('testingtwo')
    end

    it 'creates a new blog post' do
      visit_auth '/admin/articles/new'

      fill_in 'Title', with: 'testingtitle'
      fill_in 'Text', with: 'testingtext'

      click_button 'Create Article'

      expect(current_path).to eq("/articles/#{Article.last.id}")
      expect(page).to have_content('testingtitle')
    end

    it 'edits a blog post' do
      create :article, title: 'testingedit'
      visit_auth "/admin/articles/#{Article.last.id}/edit"

      fill_in 'Title', with: 'edited title'
      fill_in 'Text', with: 'edited text'

      click_button 'Update Article'

      expect(current_path).to eq("/admin/articles")
      expect(page).to have_content('edited title')
    end
  end
end
