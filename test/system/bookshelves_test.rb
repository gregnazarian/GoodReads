require "application_system_test_case"

class BookshelvesTest < ApplicationSystemTestCase
  setup do
    @bookshelf = bookshelves(:one)
  end

  test "visiting the index" do
    visit bookshelves_url
    assert_selector "h1", text: "Bookshelves"
  end

  test "creating a Bookshelf" do
    visit bookshelves_url
    click_on "New Bookshelf"

    fill_in "Name", with: @bookshelf.name
    click_on "Create Bookshelf"

    assert_text "Bookshelf was successfully created"
    click_on "Back"
  end

  test "updating a Bookshelf" do
    visit bookshelves_url
    click_on "Edit", match: :first

    fill_in "Name", with: @bookshelf.name
    click_on "Update Bookshelf"

    assert_text "Bookshelf was successfully updated"
    click_on "Back"
  end

  test "destroying a Bookshelf" do
    visit bookshelves_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bookshelf was successfully destroyed"
  end
end
