class AddLenderAndDeadlineToBooks < ActiveRecord::Migration
  def change
    add_column :books, :lender, :string
    add_column :books, :deadline, :date
    Book.where(allapot: :kolcsonozve).each do |book| 
      lending = book.lendings.last
      book.lender = lending.lender
      book.deadline = lending.deadline
      book.save
    end
  end
end
