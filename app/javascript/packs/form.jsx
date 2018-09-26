// import React from 'react'
// import ReactDOM from 'react-dom'
// import PropTypes from 'prop-types'
//
// class NameForm extends React.Component {
//   constructor(props) {
//     super(props);
//     this.state = {value: ''};
//
//     this.handleChange = this.handleChange.bind(this);
//     this.handleSubmit = this.handleSubmit.bind(this);
//   }
//
//   handleChange(event) {
//     this.setState({value: event.target.value});
//   }
//
//   handleSubmit(event) {
//     event.preventDefault();
//     const data = new FormData(event.target);
//
//     fetch('/accounts', {
//       method: 'POST',
//       body: data,
//     });
//   }
//
//   render() {
//     return (
//       <form onSubmit={this.handleSubmit}>
//         <input type="text" value={this.state.value} onChange={this.handleChange} placeholder={this.props.placeholder} />
//         <input type="submit" value="Next" />
//       </form>
//     );
//   }
// }
//
//
// ReactDOM.render(
//   <NameForm placeholder="Username" />,
//   document.getElementById('form')
// );
