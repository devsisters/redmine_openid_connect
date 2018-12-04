class ChangeOicSessionsCodeColumnToText < ActiveRecord::Migration
  def self.up
    remove_index :oic_sessions, :access_token
    remove_index :oic_sessions, :refresh_token

    change_column :oic_sessions, :code, :text
    change_column :oic_sessions, :access_token, :text
    change_column :oic_sessions, :refresh_token, :text

    add_index :oic_sessions, :access_token, length: 64
    add_index :oic_sessions, :refresh_token, length: 64
  end

  def self.down
    remove_index :oic_sessions, :access_token
    remove_index :oic_sessions, :refresh_token

    change_column :oic_sessions, :code, :string
    change_column :oic_sessions, :access_token, :string
    change_column :oic_sessions, :refresh_token, :string

    add_index :oic_sessions, :access_token
    add_index :oic_sessions, :refresh_token
  end
end
