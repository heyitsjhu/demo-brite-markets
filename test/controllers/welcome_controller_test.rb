require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index page" do
    get root_url
    assert_response :success
    assert_select 'title', 'Brite Markets | Demo Application by Johnny Hu'

    # Test the presence of the header navigation's main elements.
    assert_select 'header.navbar' do
      assert_select 'div.navbar__brand' do
        assert_select 'img.navbar__logo'
      end
      assert_select 'nav.navbar__nav' do
        assert_select 'ul' do |elements|
          elements.each do |element|
            assert_select element, 'li', 3
          end
        end
      end
    end

    # Test the presence of elements in the first main section of the page.
    assert_select 'section.cmp' do
      assert_select 'h1.cmp__heading', 'Coffee Meets Protein'
      assert_select 'img.cmp__title'
      assert_select 'form.subscribe-form'
      assert_select 'p.cmp__tagline'
    end
    assert_select 'img.cmp__bottles'

    # Test the presence of elements in the footer section of the page.
    assert_select 'footer.footer' do
      assert_select 'div.footer__copyright', 'Copyright 2016 Brite Markets'
      assert_select 'div.footer__social-media' do |elements|
        elements.each do |element|
          assert_select element, 'span'
        end
      end
    end
  end
end
