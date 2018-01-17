import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';

class Root extends React.Component {
  render () {
    return(
      <div>
        <Clock />
      </div>
    );
  }
}


document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById('main');
  ReactDOM.render(<Root />, main);
});
