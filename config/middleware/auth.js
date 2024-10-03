// validar la cookie, si no se encuentra redirecciona al HOME
function checkAdminCookie(req, res, next) {
  const { usuario } = req.body;
  const expectedCookieName = `admin-${usuario}`;

  // debbuging logs (server)
  console.log(`Expected Cookie Name: ${expectedCookieName}`); 
  console.log(`Cookies: `, req.cookies); 
  

  if (req.cookies[expectedCookieName]) {
    next();
  } else {
    res.redirect('/');
  }
}

module.exports = checkAdminCookie;



// function checkAdminCookie(req, res, next) {
//   const adminCookieName = Object.keys(req.cookies).find((cookie) =>
//     cookie.startsWith("admin-")
//   );

//   if (adminCookieName && req.cookies[adminCookieName]) {
//     next();
//   } else {
//     res.redirect("/");
//   }
// }

// module.exports = checkAdminCookie;
