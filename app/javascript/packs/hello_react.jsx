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
      minutes: 59 - new Date().getMinutes(),
      seconds: 59 - new Date().getSeconds()
    };
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
      minutes: 59 - date.getMinutes(),
      seconds: 59 - date.getSeconds()
    });
  }

  render() {
    return (
      <div>
        <div id="timer">{this.zeroPad(this.state.minutes)}:{this.zeroPad(this.state.seconds)}</div>
      </div>
    );
  }
}

ReactDOM.render(
  <Clock />,
  document.getElementById('counter')
);
