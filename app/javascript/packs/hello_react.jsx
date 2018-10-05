// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      minutes: this.setMin(),
      seconds: 59 - new Date().getSeconds()
    };
  }

  setMin() {
    let min = 59 - new Date().getMinutes()
    if (min >= 53) {
      min = min - 53
    }
    return min
  }

  componentDidMount() {
    this.timerID = setInterval(
      () => this.tick(),
      1000
    );
  }

  componentWillUnmount() {
    clearInterval(this.timerID);
  }

  zeroPad(number) {
    if (number < 10) {
      number = ("0" + number).slice(-2);
    }
    return number
  }

  tick() {
    const date = new Date ()
    this.setState({
      minutes: this.setMin(),
      seconds: 59 - date.getSeconds()
    });
  }

  setText() {
    if ((59 - new Date().getMinutes()) >= 53) {
      return "*IN PROGRESS*"
    } else {
      return "round begins"
    }
  }

  render() {
    return (
      <div>
        <div>{this.setText()}</div>
        <div id="timer">{this.zeroPad(this.state.minutes)}:{this.zeroPad(this.state.seconds)}</div>
      </div>
    );
  }
}

ReactDOM.render(
  <Clock />,
  document.getElementById('counter')
);
