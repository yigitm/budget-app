module GroupsHelper
  def list_payments(group)
    group.payments.order(created_at: :desc)
  end
end
