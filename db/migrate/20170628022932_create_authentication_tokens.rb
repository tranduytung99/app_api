class CreateAuthenticationTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :authentication_tokens do |t|
      t.string :token
      t.references :user, foreign_key: true
      t.datetime :expires_at

      t.timestamps
    end
  end
end
