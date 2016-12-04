var EditFoodItem = React.createClass({
  getInitialState: function() {
    return {
      formValues: this.formValues()
    }
  },

  editForm: function(e) {
    e.preventDefault();
    this.props.editFoodItem(this.state.formValues);
    this.setState({
      formValues: this.formValues()
    });
  },

  componentWillReceiveProps: function(nextProps) {
    var form = {
      'food_item': {
        'name': nextProps.foodItem['name'],
        'photo_link': nextProps.foodItem['photo_link'],
        'side_dish': nextProps.foodItem['side_dish'] + '',
        'vegetarian': nextProps.foodItem['vegetarian'] + '',
        'disabled': nextProps.foodItem['disabled'] + ''
      },
      'id': nextProps.foodItem['id']
    };
    this.setState({
      formValues: form
    })
  },

  closeForm: function(e) {
    this.props.hide();
    this.setState({
      formValues: this.formValues()
    });
  },

  formValues: function() {
    return {
      'food_item': {
        'name':       '',
        'photo_link': '',
        'side_dish':  '',
        'vegetarian': '',
        'disabled': ''
      }
    };
  },

  setField: function(e) {
    var formValues = this.state.formValues;
    formValues['food_item'][e.target.id] = e.target.value;
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
              <h2>Edit Food Item</h2>
              <form action="">
                <div className="field first">
                  <input type="text"
                         name="food_item[name]"
                         id="name"
                         placeholder="Name"
                         onChange={this.setField}
                         value={this.state.formValues['food_item']['name']}
                  />
                </div>
                <div className="field">
                  <input type="text"
                         name="food_item[photo_link]"
                         id="photo_link"
                         placeholder="Photo Link"
                         onChange={this.setField}
                         value={this.state.formValues['food_item']['photo_link']}
                  />
                </div>
                <div className="field">
                  <span className='attribute'>{'Vegetarian'}</span>
                  <div className='inline-block'>
                    <input type="radio"
                           className='radio-button inline-block'
                           name="food_item[vegetarian]"
                           id="vegetarian"
                           onChange={this.setField}
                           value='true'
                           checked={this.state.formValues['food_item']['vegetarian'] === 'true'}
                    />
                    <span className='span-truth'>true</span>
                    <input type="radio"
                           className='radio-button inline-block'
                           name="food_item[vegetarian]"
                           id="vegetarian"
                           onChange={this.setField}
                           value='false'
                           checked={this.state.formValues['food_item']['vegetarian'] === 'false'}
                    />
                    <span>false</span>
                  </div>
                </div>

                <div className="field">
                  <span className='attribute side-dish'>{'Side Dish'}</span>
                  <div className='inline-block'>
                    <input type="radio"
                           className='radio-button inline-block'
                           name="food_item[side_dish]"
                           id="side_dish"
                           onChange={this.setField}
                           checked={this.state.formValues['food_item']['side_dish'] === 'true'}
                           value='true'
                    />
                    <span className='span-truth'>true</span>
                    <input type="radio"
                           className='radio-button inline-block'
                           name="food_item[side_dish]"
                           id="side_dish"
                           onChange={this.setField}
                           checked={this.state.formValues['food_item']['side_dish'] === 'false'}
                           value='false'
                    />
                    <span>false</span>
                  </div>
                </div>

                <div className="field">
                  <span className='attribute disabled-attr'>Disabled</span>
                  <div className='inline-block'>
                    <input type="radio"
                           className='radio-button inline-block'
                           name="food_item[disabled]"
                           id="disabled"
                           onChange={this.setField}
                           value='true'
                           checked={this.state.formValues['food_item']['disabled'] === 'true'}
                    />
                    <span className='span-truth'>true</span>
                    <input type="radio"
                           className='radio-button inline-block'
                           name="food_item[disabled]"
                           id="disabled"
                           onChange={this.setField}
                           value='false'
                           checked={this.state.formValues['food_item']['disabled'] === 'false'}
                    />
                    <span>false</span>
                  </div>
                </div>

                <ul className="actions">
                  <li><input type="submit"
                             value="Submit"
                             className="special"
                             onClick={this.editForm}
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
