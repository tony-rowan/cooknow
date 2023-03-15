require "application_system_test_case"

class FlowTest < ApplicationSystemTestCase
  test "navigating through the entire flow" do
    visit root_url

    click_on "dinner"
    click_on "Italian"
    check "onion", allow_label_click: true
    check "garlic", allow_label_click: true
    click_on "Search"

    assert_selector "h2", text: "Chinese Egg Rolls"
  end
end
