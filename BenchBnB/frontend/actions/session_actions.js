import APISessionUtil from '../util/session_api_util';
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';


export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveSessionErrors = (errors) => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const login = (user) => dispatch => (
  APISessionUtil.login(user).then(
    user => dispatch(receiveCurrentUser(user)),
    err => dispatch(receiveSessionErrors(err))
  )
);

export const logout = () => dispatch => (
  APISessionUtil.logout().then(
    success => dispatch(receiveCurrentUser(null)),
    err => dispatch(receiveSessionErrors(err))
  )
);

export const signup = (user) => dispatch => (
  APISessionUtil.signup(user).then(
    user => dispatch(receiveCurrentUser(user)),
    err => dispatch(receiveSessionErrors(err))
  )
);
