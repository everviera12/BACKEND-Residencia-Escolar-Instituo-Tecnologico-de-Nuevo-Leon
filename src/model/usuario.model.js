const db = require("../../config/database");

const getAllUsers = async () => {
  const result = await db.query("SELECT * FROM usuarios");
  return result.rows;
};

const getUserById = async (id) => {
  const result = await db.query("SELECT * FROM usuarios WHERE id = $1", [id]);
  return result.rows[0];
};

const deleteUser = async (id) => {
  const result = await db.query(
    "DELETE FROM usuarios WHERE id = $1 RETURNING *",
    [id]
  );
  return result.rows[0];
};

module.exports = {
  getAllUsers,
  deleteUser,
  getUserById,
};