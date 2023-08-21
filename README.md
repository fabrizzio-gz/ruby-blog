# How to run

Set up DB and dummy data:

```bash
$ rails db:migrate
$ rails db:seed
```

It will create 2 users:

1. email: `admin@blog.com`, password: `admin`
2. email: `user_1@blog.com`, password: `123456`

Run server:

```bash
$ rails s
```

Finally, navigate to: http://127.0.0.1:3000 in your browser.

**Notes:**
- Register a new user support was not added.
- There is no support to log out. Delete cookies manually.
