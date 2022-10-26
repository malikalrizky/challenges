class Charity < ActiveRecord::Base
  validates :name, presence: true

  def credit_amount(amount)
    # Fix the race condition in the balance amount column.
    # allow decimal input
    self.with_lock do
      update_column :total, total.to_f + amount.to_f
    end
  end
end
