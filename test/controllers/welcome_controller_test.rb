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

    # Test the presence of elements in the first section——Coffee Meets Protein.
    assert_select 'section.cmp' do
      assert_select 'h1.cmp__heading', 'Coffee Meets Protein'
      assert_select 'img.cmp__title'
      assert_select 'form.subscribe-form'
      assert_select 'p.cmp__tagline'
    end
    assert_select 'img.cmp__bottles'

    # Test the presence of elements in the second section——Healthy Wholesome Food.
    assert_select 'section.hwf' do
      assert_select 'h2.hwf__heading'
      assert_select 'div.hwf__subsection' do
        assert_select 'img.hwf__bottle'
        assert_select 'p', "100% Soy"
        assert_select 'p', "100% Vegan"
        assert_select 'p', "Dairy Free"
        assert_select 'p', "Gluten Free"
      end

      assert_select 'h2'
      assert_select 'ul' do |ingredients_listing|
        ingredients_listing.each do |item|
          assert_select 'li' do
            assert_select 'img'
            assert_select 'span'
          end
        end
      end
    end

    # Test the presence of elements in the first section——Subscription Form.
    assert_select 'section.sf' do
      assert_select 'form.subscribe-form'
      assert_select 'p.sf__tagline'
    end

    # Test the presence of elements in the fourth section——Story and Location.
    assert_select 'section.snl' do
      assert_select 'div.snl__subsection', count: 2 do
        assert_select 'h3.snl__heading'
      end
      assert_select 'p.snl__text', count: 2
      assert_select 'img.snl__image'
    end

    # Test the presence of elements in the footer section of the page.
    assert_select 'footer.footer' do
      assert_select 'div.footer__copyright', 'Copyright 2016 Brite Markets'
      assert_select 'div.footer__social-media' do |elements|
        elements.each do |element|
          assert_select element, 'span'
        end
      end
    end

    # Test the presence of elements in the developer section of the page.
    assert_select 'div.developer' do 
      assert_select 'p', count: 2
      assert_select 'a', count: 9
    end
  end
end
