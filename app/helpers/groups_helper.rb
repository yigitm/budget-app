module GroupsHelper
  def list_payments(group)
    group.payments.order(created_at: :desc)
  end

  def icons
     { 'Shopping' => 'shopping.png', 'Travel' => 'travel.png', 'Clothing' => 'clothing.png', 
      'Grocery' => 'grocery.png' }
  end
end
