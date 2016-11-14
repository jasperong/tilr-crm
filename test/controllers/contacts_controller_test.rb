# require 'test_helper'
#
# class ContactsControllerTest < ActionDispatch::IntegrationTest
#   setup do
#     @contact = contacts(:one)
#     @user = users(:one)
#   end
#
#   test "should get index" do
#     get user_contacts_url(@user)
#     assert_response :success
#   end
#
#   test "should get new" do
#     get new_user_contact_url(@user)
#     assert_response :success
#   end
#
#   test "should create contact" do
#     assert_difference('Contact.count') do
#       post user_contacts_url(@user), params: { contact: { company: @contact.company, email: @contact.email, first_name: @contact.first_name, last_name: @contact.last_name, phone_number: @contact.phone_number, user_id: @contact.user_id } }
#     end
#
#     assert_redirected_to user_contact_url(Contact.last)
#   end
#
#   test "should show contact" do
#     get user_contact_url(@user,@contact)
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get edit_user_contact_url(@user, @contact)
#     assert_response :success
#   end
#
#   test "should update contact" do
#     patch user_contact_url(@user, @contact), params: { contact: { company: @contact.company, email: @contact.email, first_name: @contact.first_name, last_name: @contact.last_name, phone_number: @contact.phone_number, user_id: @contact.user_id } }
#     assert_redirected_to user_contact_url(@user, @contact)
#   end
#
#   test "should destroy contact" do
#     assert_difference('Contact.count', -1) do
#       delete user_contact_url(@user, @contact)
#     end
#
#     assert_redirected_to contacts_url
#   end
# end
