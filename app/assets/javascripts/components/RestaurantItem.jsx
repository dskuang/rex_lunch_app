var RestaurantItem = React.createClass({
  getInitialState: function() {
    return {
      style: 'style' + this.props.index%6
    }
  },

  navigateRestaurant: function(e) {
    e.preventDefault();
    document.getElementById('hidden_form_' + this.props.restaurant.id).submit();
  },

  render: function() {
    var id = 'hidden_form_' + this.props.restaurant.id
    return(
      <article className={this.state.style}>
        <span className="image">
          <img src={this.props.restaurant.photo_link} alt="" />
        </span>
        <form className='hidden' id={id} action='/restaurants/show'>
          <input type='text'
                 name='restaurant_id'
                 value={this.props.restaurant.id}
                 readOnly='readOnly'
          />
        </form>
        <a href="javascript:;" onClick={this.navigateRestaurant}>
          <h2>{this.props.restaurant.name}</h2>
          <div className="content">
            <p></p>
          </div>
        </a>
      </article>
    );
  }
})
