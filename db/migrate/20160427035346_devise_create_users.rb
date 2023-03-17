class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.integer :tipo
      t.string :app
      t.string :apm
      t.string :nom1
      t.string :nom2
      t.string :RFC
      t.string :CURP
      t.string :seguro
      t.string :INE
      t.string :nacionalidad
      t.datetime :fecha_nacimiento
      t.string :nac_ciudad
      t.string :nac_estado
      t.string :nac_pais
      t.boolean :sexo
      t.string :telefono_casa
      t.string :telefono_celular
      t.string :correo1
      t.string :correo2
      t.string :calle
      t.integer :numero_ext
      t.integer :numero_int
      t.string :colonia
      t.integer :codigo_postal
      t.string :municipio
      t.string :estado
      t.string :pais

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
