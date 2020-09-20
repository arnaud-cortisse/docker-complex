module.exports = {
  redisHost: process.env.REDIS_HOST,
  redisPort: parseInt(process.env.REDIS_PORT),
  pgUser: process.env.PGUSER,
  pgHost: process.env.PGHOST,
  pgDatabase: process.env.PGDATABASE,
  pgPassword: process.env.PGPASSWORD,
  pgPort: parseInt(process.env.PGPORT),
};
