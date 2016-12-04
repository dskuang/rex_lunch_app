var AllRestaurants = React.createClass({
  getInitialState: function() {
    return {
      restaurants: []
    }
  },

  componentDidMount: function() {
    this.grabRestaurants();
    $(document).on('success', '.new_restaurant', function() {
      this.grabRestaurants();
    }.bind(this));
  },

  grabRestaurants: function() {
    $.get('/restaurants/all', null, function (result) {
      this.setState({
        restaurants: result
      });
    }.bind(this));
  },

  openNewForm: function() {
    $('.all-restaurants').trigger('showForm');
  },

  handleSearch: function(e) {
    if(!e.target.value) {
      this.grabRestaurants();
    } else if(e.target.value.length > 3) {
      $.get('/restaurants/search', {name: e.target.value}, function (result) {
        this.setState({
          restaurants: result
        });
      }.bind(this));
    }
  },

  render: function() {
    return(
      <div id='wrapper'>
    		<div id="main">
    			<div className="inner all-restaurants">
    				<header>
              <div className='title-bar'>
      					<h1 className='inline-block'>
                  Restaurants
      					</h1>
                <i className="fa fa-plus inline-block"
                   onClick={this.openNewForm}
                >
                </i>
                <div className='search-container relative'>
                  <i className="fa fa-search search-icon" aria-hidden="true"></i>
                  <input className='search inline-block'
                         type='text'
                         name='search'
                         onChange={this.handleSearch}
                  />
                </div>
              </div>
    					<p>Ready to feast? Pick your poison.</p>
    				</header>
    				<section className="tiles">
              {
                this.state.restaurants.map(function(restaurant, idx) {
                  return <RestaurantItem
                    key={idx}
                    restaurant={restaurant}
                    index={idx}
                  />
                }, this)
              }
    				</section>
    			</div>
    		</div>
      </div>
    );
  }
})
