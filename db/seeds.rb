users = User.create([
  {
    email: 'admin@blog.com',
    password: 'admin'
  },
  {
    email: 'user_1@blog.com',
    password: '123456'
  }
])

Post.create([
  {
    title: 'An admin blog post',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed faucibus turpis in eu mi bibendum. Ut enim blandit volutpat maecenas. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum. Pellentesque sit amet porttitor eget dolor.',
    user_id: users[0].id
  },
  {
    title: 'An author blog post',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed faucibus turpis in eu mi bibendum. Ut enim blandit volutpat maecenas. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum. Pellentesque sit amet porttitor eget dolor.',
    user_id: users[1].id
  }
])