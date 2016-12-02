require 'rails_helper'

feature "url shortening" do

  scenario "has a new link page" do
    visit new_link_url
    expect(page).to have_content "URL Shortener"
  end

  feature "shortening an invalid url" do
    before(:each) do
      visit new_link_url
      fill_in 'paste-link', :with => "test"
      click_on "SHORTEN"
    end

    scenario "shows length validation error" do
      expect(page).to have_content "Long url is too short"
    end

    scenario "doesn't show shortened url" do
      expect(page).to_not have_content "Short URL"
    end
  end

  feature "shortening a valid url" do
    before(:each) do
      visit new_link_url
      fill_in 'paste-link', :with => "https://github.com/"
      click_on "SHORTEN"
    end

    scenario "doesn't show length validation error" do
      expect(page).to_not have_content "Long url is too short"
    end

    scenario "shows shortened url" do
      expect(page).to have_content "Short URL"
    end
  end

end
