const CONF = {
    mysql: {
        host: 'localhost',
        port: 3306,
        user: 'root',
        db: 'paint_it',
        pass: '123456',
        char: 'utf8mb4'
    },
    token: {
        secret: 'jwt demo',
        path: [
            /^\/api\/v1\/login/,
            /^\/api\/v1\/addUser/
        ]
    }
};

module.exports = CONF;
