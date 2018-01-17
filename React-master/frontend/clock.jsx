import React from 'react';

class Clock extends React.Component {
  constructor (props) {
    super(props);
    this.state = { date: new Date()};
  }

  tick () {
    this.setState({ date: new Date() });
  }

  componentDidMount() {
    this.intervalId = setInterval (this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalId);
  }

  render() {
    return (<div>
      <h1>Cody's Clock</h1>
      <span>{this.state}</span>
    </div>
    );
  }
}

export default Clock;
