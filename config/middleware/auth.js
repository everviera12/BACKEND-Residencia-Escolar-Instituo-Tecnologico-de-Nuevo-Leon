// validar la cookie, si no se encuentra redirecciona al HOME
function checkAdminCookie(req, res, next) {
  if (req.cookies.admin) {
      next();
  } else {
      res.redirect('/'); 
  }
}

module.exports = checkAdminCookie;
