var FoodItem = React.createClass({
  getInitialState: function() {
    return {
      show: false
    };
  },

  changeFoodLock: function() {
    this.props.changeFoodLock(this.props.foodItem.id)
  },

  text_truncate: function(str, length, ending) {
    if (length == null) {
      length = 100;
    }
    if (ending == null) {
      ending = '...';
    }
    if (str.length > length) {
      return str.substring(0, length - ending.length) + ending;
    } else {
      return str;
    }
  },

  deleteFoodItem: function() {
    this.props.deleteFoodItem(this.props.foodItem.id)
  },

  showEditForm: function() {
    this.props.showEditFoodItem(this.props.foodItem)
  },

  render: function() {
    var vegetarian = this.props.foodItem.vegetarian ? ' (V)' : null
    var imgClasses = this.props.foodItem.disabled ? ['disabled'] : null
    var lockClasses = this.props.foodItem.disabled ? 'fa fa-lock lock' : 'fa fa-unlock lock'
    return(
      <div className='food-item inline-block'>
        <i className={lockClasses} onClick={this.changeFoodLock}></i>
        <i className="absolute edit-food-item fa fa-pencil-square-o"
           aria-hidden="true"
           onClick={this.showEditForm}>
        </i>
        <i className="absolute delete fa fa-times"
           aria-hidden="true"
           onClick={this.deleteFoodItem}
        >
        </i>
        <img className={imgClasses} src={this.props.foodItem.photo_link}/>
        <span className='black'>
          {this.text_truncate(this.props.foodItem.name, 31, '..')}
          <span className='green'>
            {vegetarian}
          </span>
        </span>
      </div>
    );
  },
})
