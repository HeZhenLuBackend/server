const CONF = {
    mysql: {
        host: 'localhost',
        port: 3306,
        user: 'root',
        db: 'hezhenlu',
        pass: 'Hezhenlu16',
        char: 'utf8mb4'
    },
    token: {
        secret: 'jwt demo',
        path: [
            /^\/api\/v1\/user\/login/,
            /^\/api\/v1\/user\/identify/,
            /^\/api\/v1\/user\/register/,
            /^\/api\/v1\/passage\/all/,
            /^\/api\/v1\/passage\/hot/,
            /^\/api\/v1\/passage\/recommend/,
            /^\/api\/v1\/passage\/addHot/,
            /^\/api\/v1\/passage\/class/,
            /^\/api\/v1\/passage\/latest/,
            /^\/api\/v1\/passage\/delete/,
            /^\/api\/v1\/passage\/publish/,
            /^\/api\/v1\/passage\/detail/,
            /^\/api\/v1\/comment\/latest/,
            /^\/api\/v1\/course\/class/,
            /^\/api\/v1\/passage\/comments/,
            /^\/api\/v1\/passage\/comment/
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
