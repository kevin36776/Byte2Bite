from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash
from flask_cors import CORS
import decimal

app = Flask(__name__)
CORS(app)

# CORRECTED a typo in the port number here (was 3C07)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost:3307/byte2bite_db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# --- Database Models ---
class Restaurants(db.Model):
    __tablename__ = 'Restaurants'
    RestaurantID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(100), nullable=False)
    Address = db.Column(db.String(255), nullable=False)
    PhoneNumber = db.Column(db.String(20))

class MenuItems(db.Model):
    __tablename__ = 'MenuItems'
    MenuItemID = db.Column(db.Integer, primary_key=True)
    RestaurantID = db.Column(db.Integer, db.ForeignKey('Restaurants.RestaurantID'))
    Name = db.Column(db.String(100), nullable=False)
    Description = db.Column(db.Text)
    Price = db.Column(db.Numeric(10, 2), nullable=False)
    Category = db.Column(db.String(50))
    IsAvailable = db.Column(db.Boolean, default=True)

class Customers(db.Model):
    __tablename__ = 'Customers'
    CustomerID = db.Column(db.Integer, primary_key=True)
    FirstName = db.Column(db.String(50), nullable=False)
    LastName = db.Column(db.String(50), nullable=False)
    Email = db.Column(db.String(100), unique=True, nullable=False)
    PasswordHash = db.Column(db.String(255), nullable=False)
    PhoneNumber = db.Column(db.String(20))

class Orders(db.Model):
    __tablename__ = 'Orders'
    OrderID = db.Column(db.Integer, primary_key=True)
    CustomerID = db.Column(db.Integer, db.ForeignKey('Customers.CustomerID'))
    RestaurantID = db.Column(db.Integer, db.ForeignKey('Restaurants.RestaurantID'))
    OrderTime = db.Column(db.TIMESTAMP, server_default=db.func.current_timestamp())
    TotalPrice = db.Column(db.Numeric(10, 2), nullable=False)
    Status = db.Column(db.String(50), default='Pending')

class OrderItems(db.Model):
    __tablename__ = 'OrderItems'
    OrderItemID = db.Column(db.Integer, primary_key=True)
    OrderID = db.Column(db.Integer, db.ForeignKey('Orders.OrderID'))
    MenuItemID = db.Column(db.Integer, db.ForeignKey('MenuItems.MenuItemID'))
    Quantity = db.Column(db.Integer, nullable=False)
    PricePerItem = db.Column(db.Numeric(10, 2), nullable=False)

# --- API Endpoints ---
@app.route('/')
def hello():
    return "API is running!"

@app.route('/api/restaurants', methods=['GET'])
def get_restaurants():
    all_restaurants = Restaurants.query.all()
    restaurant_list = [
        {"id": r.RestaurantID, "name": r.Name, "address": r.Address}
        for r in all_restaurants
    ]
    return jsonify(restaurant_list)

@app.route('/api/menu/<int:location_id>', methods=['GET'])
def get_menu(location_id):
    items = MenuItems.query.filter_by(RestaurantID=location_id, IsAvailable=True).all()
    menu_list = [
        {
            "id": item.MenuItemID,
            "name": item.Name,
            "description": item.Description,
            "price": str(item.Price),
            "category": item.Category
        }
        for item in items
    ]
    return jsonify(menu_list)

@app.route('/api/customers', methods=['POST'])
def create_customer():
    data = request.get_json()
    hashed_password = generate_password_hash(data['password'])
    new_customer = Customers(
        FirstName=data['firstName'],
        LastName=data['lastName'],
        Email=data['email'],
        PasswordHash=hashed_password,
        PhoneNumber=data['phoneNumber']
    )
    db.session.add(new_customer)
    db.session.commit()
    return jsonify({'message': 'Account created successfully'}), 201

@app.route('/api/orders', methods=['POST'])
def place_order():
    data = request.get_json()

    location_id = data['locationId']
    cart_items = data['items']
    customer_id = data.get('customerId', None)

    total_price = 0
    for item in cart_items:
        # Use a session to get the item, not the class directly
        menu_item = db.session.get(MenuItems, item['id'])
        if menu_item:
            total_price += menu_item.Price * item['quantity']

    new_order = Orders(
        CustomerID=customer_id,
        RestaurantID=location_id,
        TotalPrice=total_price,
        Status='Pending'
    )
    db.session.add(new_order)
    db.session.commit()

    for item in cart_items:
        menu_item = db.session.get(MenuItems, item['id'])
        if menu_item:
            order_item = OrderItems(
                OrderID=new_order.OrderID,
                MenuItemID=item['id'],
                Quantity=item['quantity'],
                PricePerItem=menu_item.Price
            )
            db.session.add(order_item)

    db.session.commit()

    return jsonify({'message': 'Order placed successfully', 'orderId': new_order.OrderID}), 201

@app.route('/api/orders/active', methods=['GET'])
def get_active_orders():
    # UPDATED: Now fetches all orders that are not yet ready for pickup.
    active_orders_query = db.session.query(
        Orders, 
        Restaurants.Name
    ).join(
        Restaurants, Orders.RestaurantID == Restaurants.RestaurantID
    ).filter(
        Orders.Status.in_(['Pending', 'Preparing', 'Completed'])
    ).all()

    orders_list = []
    for order, restaurant_name in active_orders_query:
        items_query = db.session.query(
            OrderItems, 
            MenuItems.Name
        ).join(
            MenuItems, OrderItems.MenuItemID == MenuItems.MenuItemID
        ).filter(
            OrderItems.OrderID == order.OrderID
        ).all()

        items_list = [
            {"name": item_name, "quantity": order_item.Quantity}
            for order_item, item_name in items_query
        ]
        
        orders_list.append({
            "orderId": order.OrderID,
            "restaurantName": restaurant_name,
            "totalPrice": str(order.TotalPrice),
            "status": order.Status,
            "items": items_list
        })

    return jsonify(orders_list)


@app.route('/api/orders/<int:order_id>/status', methods=['PUT'])
def update_order_status(order_id):
    order = db.session.get(Orders, order_id)
    if not order:
        return jsonify({'message': 'Order not found'}), 404

    data = request.get_json()
    new_status = data.get('status')

    # UPDATED: All statuses are now valid for updates.
    if new_status not in ['Pending', 'Preparing', 'Completed', 'Ready for Pickup']:
        return jsonify({'message': 'Invalid status update'}), 400

    order.Status = new_status
    db.session.commit()

    return jsonify({'message': f'Order {order_id} status updated to {new_status}'})


if __name__ == '__main__':
    app.run(debug=True)

