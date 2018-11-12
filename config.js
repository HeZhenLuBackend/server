const CONF = {
    mysql: {
        host: 'localhost',
        port: 3306,
        user: 'root',
        db: 'hezhenlu',
        pass: '123456',
        char: 'utf8mb4'
    },
    token: {
        secret: 'jwt demo',
        path: [
            /^\/api\/v1\/login/,
            /^\/api\/v1\/user\/identify/,
            /^\/api\/v1\/user\/register/
        ]
    },
    url: {
        prefix: '/api/v1'
    },
    validate_mailer: {
        host: 'smtp.126.com',
        port: 465,
        user: 'hezhenlu_validate@126.com',
        pass: 'hezhenlu16',
        from: 'hezhenlu_validate@126.com'
    }

};

module.exports = CONF;
