# Endpoints

## Customer
- POST /api/v1/customers
- GET /api/v1/customers/:id

#### `POST /api/v1/customers`
##### Required Query Parameters:
- `name={string}`
- `email={string}`
- `address={string}`

```json
{
   "data": {
       "id": "1",
       "type": "customer",
       "attributes": {
           "email": "email@gmail.com",
           "name": "FirstName LastName",
           "address": "1234 Main St, Denver, CO, 80200"
       }
   },
   "success": "success message"
}
```

#### `GET /api/v1/customers/1`

 ```json
 {
    "data":
      {
        "id": "1",
        "type": "customer",
        "subscriptions":
          [
            {
              "customer_id": 1,
              "tea_id": 1,
              "active": true,
              "frequency": "monthly"
            }
          ]
     },
     "success": "success message"
    
}
 ```

## Teas
- POST /api/v1/teas

#### `POST /api/v1/teas`
##### Required Query Parameters:
- `name={string}`
- `description={string}`
- `temperature={string}`
- `brew_time={integer}`

```json
{
    "data":
        {
            "id": 1,
            "type": "tea",
            "attributes": {
                "name": "Mint Tea",
                "description": "Fresh and minty",
                "temperature": "125 C",
                "brew_time": 15,
            }
        },
    "success": "success message"
}
```

### Letters
- POST /api/v1/subscriptions
- PATCH /api/v1/subscriptions

#### `POST /api/v1/subscriptions`
##### Required Query Parameters:
- `customer_id={integer}`
- `tea_id={integer}`

```json
  {
    "data":
      {
        "id": 1,
        "attributes": {
          "customer_id": 1,
          "tea_id": 1,
          "title": "customer's tea subscription",
          "active": true,
          "frequency": "monthly"
        }
      },
      "success": "success message"
  }
```

#### `PATCH /api/v1/subscriptions`
##### Required Query Parameters:
- `customer_id={integer}`
- `tea_id={integer}`

```json
  {
    "data":
      {
        "id": 1,
        "attributes": {
          "customer_id": 1,
          "tea_id": 1,
          "title": "customer's tea subscription",
          "active": false,
          "frequency": "monthly"
       }
     },
    "success": "success message"
  }
```
