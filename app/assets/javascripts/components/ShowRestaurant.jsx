var ShowRestaurant = React.createClass({
  getInitialState: function() {
    return {
      foodItems: [],
      showEditForm: false,
      showFoodItemForm: false,
      showFoodItemEditForm: false,
      foodItemToEdit: ''
    }
  },

  showEditForm: function() {
    this.setState({
      showEditForm: true
    })
  },

  hideEditForm: function() {
    this.setState({
      showEditForm: false
    })
  },

  grabRestaurants: function() {
    location.reload();
  },

  componentDidMount: function() {
    this.getFoodItems();
  },

  getFoodItems: function() {
    var options = { restaurant_id: this.props.restaurant.id }
    $.get('/restaurants/food_items', options, function (result) {
      this.setState({
        foodItems: result
      });
    }.bind(this));
  },

  changeFoodLock: function(id) {
    $.post('/food_items/change_item_lock', {id: id}, function (result) {
      this.getFoodItems();
    }.bind(this));
  },

  showFoodItem: function() {
    this.setState({
      showFoodItemForm: true
    })
  },

  hideFoodItemForm: function() {
    this.setState({
      showFoodItemForm: false
    })
  },

  showFoodItemEditForm: function() {
    this.setState({
      showFoodItemEditForm: true
    })
  },

  hideFoodItemEditForm: function() {
    this.setState({
      showFoodItemEditForm: false
    })
  },

  addFoodItem: function(options) {
    $.post('/food_items/add', options, function (result) {
      this.hideFoodItemForm();
      this.getFoodItems();
    }.bind(this));
  },

  restaurantInformation: function() {
    var info;
    if(this.props.restaurant.address_line_2) {
      info =
        <div>
          {this.props.restaurant.address_line_1}
          <br/>
          {this.props.restaurant.address_line_2}
          <br/>
          {this.props.restaurant.url}
        </div>
    } else {
      info =
        <div>
          {this.props.restaurant.address_line_1}
          <br/>
          {this.props.restaurant.url}
        </div>
    }
    return info;
  },

  deleteFoodItem: function(id) {
    $.post('/food_items/delete', {id: id}, function (result) {
      this.getFoodItems();
    }.bind(this));
  },

  showEditFoodItem: function(foodItem) {
    this.setState({
      showFoodItemEditForm: true,
      foodItemToEdit: foodItem
    })
  },

  editFoodItem: function(form) {
    $.post('/food_items/update', form, function (result) {
      this.setState({
        showFoodItemEditForm: false
      });
      this.getFoodItems();
    }.bind(this));
  },

  render: function() {
    return(
      <div id="wrapper">
        <div id="main">
          <div className="inner restaurant-show">
            <EditRestaurant restaurant={this.props.restaurant}
                            show={this.state.showEditForm}
                            grabRestaurants={this.grabRestaurants}
                            hide={this.hideEditForm}
            />
            <EditFoodItem show={this.state.showFoodItemEditForm}
                          hide={this.hideFoodItemEditForm}
                          foodItem={this.state.foodItemToEdit}
                          editFoodItem={this.editFoodItem}
            />
            <div className='title inline-block'>
              <h1 className='inline-block'>{this.props.restaurant.name}</h1>
              <i className="inline-block fa fa-pencil-square-o"
                 aria-hidden="true"
                 onClick={this.showEditForm}>
              </i>
            </div>
            <br/>
            {this.restaurantInformation()}
            <br/>
            <span className="image main banner">
              <img src={this.props.restaurant.banner_link} alt="" />
            </span>
            <br/>
            <input className='add-item-button'
                   type='submit'
                   value='Add Item'
                   onClick={this.showFoodItem}
            />
            <AddFoodItem show={this.state.showFoodItemForm}
                         hide={this.hideFoodItemForm}
                         addFoodItem={this.addFoodItem}
                         restaurant={this.props.restaurant}
            />
            <div className = 'all-items display-inline-flex-start'>
              {
                this.state.foodItems.map(function(item, idx) {
                  return <FoodItem
                    key={idx}
                    foodItem={item}
                    index={idx}
                    changeFoodLock={this.changeFoodLock}
                    deleteFoodItem={this.deleteFoodItem}
                    showEditFoodItem={this.showEditFoodItem}
                  />
                }, this)
              }
            </div>
          </div>
        </div>
      </div>
    );
  }
})
