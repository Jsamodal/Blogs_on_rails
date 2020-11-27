class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title, index: {unique: true}
      t.text :body 
      t.timestamps
    end
  end
end
