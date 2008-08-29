class CreateHushCmsComponents < ActiveRecord::Migration
  def self.up
    create_table :hush_cms_pages do |t|
      t.integer :parent_id, :position, :redirect_to
      t.string :title, :slug
      t.text :content
      t.datetime :published_at
      t.boolean :permanent, :default => false
      t.timestamps
    end
    
    add_index :hush_cms_pages, :slug
    add_index :hush_cms_pages, :parent_id
    add_index :hush_cms_pages, [ :slug, :parent_id ]
    
    
    create_table :hush_cms_categories do |t|
      t.string :name, :slug
      t.text :description
      t.boolean :has_comments, :default => false
      t.boolean :has_feed, :default => false
    end
    
    # TODO: Add indexes for categories when analysed better
    
    
    create_table :hush_cms_posts do |t|
      t.integer :category_id
      t.string :title, :author, :slug
      t.text :content
      t.datetime :published_at
      t.timestamps
    end
    
    # TODO: Add indexes for posts when analysed better
    
    
    create_table :hush_cms_comments do |t|
      t.integer :post_id
      t.string :name, :email
      t.text :content
      t.boolean :approved, :default => false
      t.timestamps
    end
    
    # TODO: Add indexes for comments when analysed better
    
    
    create_table :hush_cms_snippets do |t|
      t.integer :page_id
      t.string :name, :slug
      t.text :content
      t.timestamps
    end
    
    add_index :hush_cms_snippets, :slug
    add_index :hush_cms_snippets, :page_id
    add_index :hush_cms_snippets, [ :slug, :page_id ]
    
    
    create_table :hush_cms_images do |t|
      t.string :name, :image_file_name, :image_content_type
      t.integer :image_file_size
      t.text :content
      t.timestamps
    end
    
    add_index :hush_cms_image, :name
  end

  def self.down
    drop_table :hush_cms_pages
    drop_table :hush_cms_categories
    drop_table :hush_cms_posts
    drop_table :hush_cms_comments
    drop_table :hush_cms_snippets
    drop_table :hush_cms_images
  end
end
