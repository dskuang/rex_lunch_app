var EditRestaurant = React.createClass({
  getInitialState: function() {
    return {
      formValues: this.formValues()
    }
  },

  submitForm: function(e) {
    var data = {
      'restaurant': this.state.formValues['restaurant'],
      'restaurant_id': this.props.restaurant.id
    };
    e.preventDefault();
    $.ajax({
      url: '/restaurants/update',
      method: 'POST',
      data: data,
      dataType: 'json',
      context: this,
      success: function(data) {
        this.props.grabRestaurants();
      },
      error: function(data) {
      }
    });
  },

  closeForm: function(e) {
    this.props.hide();
    this.setState({
      formValues: this.formValues()
    });
  },

  formValues: function() {
    return {
      'restaurant': {
        'name':              this.props.restaurant.name || '',
        'address_line_1':    this.props.restaurant.address_line_1 || '',
        'address_line_2':    this.props.restaurant.address_line_2 || '',
        'url':               this.props.restaurant.url || '',
        'photo_link':        this.props.restaurant.photo_link || '',
        'banner_link':       this.props.restaurant.banner_link || ''
      }
    };
  },

  setField: function(e) {
    var formValues = this.state.formValues;
    formValues['restaurant'][e.target.id] = e.target.value;
    this.setState({
      formValues: formValues
    });
  },

  render: function() {
    if(this.props.show){
      return(
        <div className='overshadow display-flex-vertical-center'>
          <div className="inner new_restaurant">
            <a className='close'
               onClick={this.closeForm}
            ></a>
            <section>
              <h2>Edit Restaurant</h2>
              <form action="">
                <div className="field first">
                  <input type="text"
                         name="restaurant[name]"
                         id="name"
                         placeholder="Name"
                         onChange={this.setField}
                         value={this.state.formValues['restaurant']['name']}
                  />
                </div>
                <div className="field">
                  <input type="text"
                         name="restaurant[address_line_1]"
                         id="address"
                         placeholder="Address line 1"
                         onChange={this.setField}
                         value={this.state.formValues['restaurant']['address_line_1']}
                  />
                </div>
                <div className="field">
                  <input type="text"
                         name="restaurant[address_line_2]"
                         id="address"
                         placeholder="Address line 2"
                         onChange={this.setField}
                         value={this.state.formValues['restaurant']['address_line_2']}
                  />
                </div>
                <div className="field">
                  <input type="text"
                         name="restaurant[url]"
                         id="url"
                         placeholder="Url"
                         onChange={this.setField}
                         value={this.state.formValues['restaurant']['url']}
                  />
                </div>
                <div className="field">
                  <input type="text"
                         name="restaurant[photo_link]"
                         id="photo_link"
                         placeholder="Photo Link"
                         onChange={this.setField}
                         value={this.state.formValues['restaurant']['photo_link']}
                  />
                </div>
                <div className="field">
                  <input type="text"
                         name="restaurant[banner_link]"
                         id="banner_link"
                         placeholder="Banner Link"
                         onChange={this.setField}
                         value={this.state.formValues['restaurant']['banner_link']}
                  />
                </div>
                <ul className="actions">
                  <li><input type="submit"
                             value="Submit"
                             className="special"
                             onClick={this.submitForm}
                      />
                  </li>
                </ul>
              </form>
            </section>
          </div>
        </div>
      );
    } else {
      return null;
    }
  }
})
