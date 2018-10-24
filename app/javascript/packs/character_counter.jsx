import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class CharacterCounter extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      count: this.myCount()
    };
  }

  getChars() {
    this.setState({value: event.target.value});
  }

  myCount() {
    getChars().length
  }



  render() {
    return (
      <div>
        {this.state.characters}
      </div>
    );
  }
}


ReactDOM.render(
  <NameForm placeholder="Username" />,
  document.getElementById('form')
);
