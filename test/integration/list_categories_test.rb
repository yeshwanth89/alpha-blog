require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
   def setup
     @category = Category.create(name: "philosophy")
     @category1 = Category.create(name: "programming")

   end
   test "should show categories listing " do
     get categories_path
     assert_template 'categories/index'
     assert_select "a[href=?]", category_path(@category), text: @category.name
     assert_select "a[href=?]", category_path(@category1), text: @category1.name

   end
end




