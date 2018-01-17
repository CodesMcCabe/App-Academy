const APISessionUtil = {
  signup: (user)=> {
    return (
      $.ajax({
        url: 'api/users',
        method: 'POST',
        data: user
      })
    );
  },

  login: (user)=> {
    return (
      $.ajax({
        url: 'api/session',
        method: 'POST',
        data: user
      })
    );
  },

  logout: ()=> {
    return (
      $.ajax({
        url: 'api/session',
        method: 'DELETE',
      })
    );
  },
};

export default APISessionUtil;
