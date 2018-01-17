import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import APISessionUtil from './util/session_api_util';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.signup = APISessionUtil.signup;
  window.login = APISessionUtil.login;
  window.logout = APISessionUtil.logout;

  const root = document.getElementById('root');
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});
