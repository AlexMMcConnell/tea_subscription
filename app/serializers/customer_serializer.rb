class CustomerSerializer
  def self.new(customer)
    { data:
      {
      id: customer.id,
      type: "customer",
      attributes: {
        name: customer.name,
        email: customer.email,
        address: customer.address
        }
      }
    }
  end
end
