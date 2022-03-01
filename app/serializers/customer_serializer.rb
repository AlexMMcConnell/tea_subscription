class CustomerSerializer
  def self.new(customer)
    { data:
      {
      id: customer.id,
      attributes: {
        name: customer.name,
        email: customer.email,
        address: customer.address
        },
      }
    }
  end
end
