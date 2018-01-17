import { RECEIVE_SESSION_ERRORS, RECEIVE_CURRENT_USER } from '../actions/session_actions';

const sessionReducer = (state = { currentUser: null, errors: [] }, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, state, { currentUser: action.currentUser });
    case RECEIVE_SESSION_ERRORS:
      return Object.assign({}, state, { errors: action.errors });
    default:
      return state;
  }
};

export default sessionReducer;
