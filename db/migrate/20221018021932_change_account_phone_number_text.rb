class ChangeAccountPhoneNumberText < ActiveRecord::Migration[6.1]
  def change
  	change_column(:accounts, :PhoneNumber, :text)
  end
end
