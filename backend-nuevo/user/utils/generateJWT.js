const jwt = require('jsonwebtoken');
require('dotenv').config(); 
function generateJWT(email) {
  const payload = {
    user: {
      email: email
    }
  };

  return jwt.sign(payload, process.env.SECRET_KEY, { expiresIn: '1h' });
}

module.exports = generateJWT;