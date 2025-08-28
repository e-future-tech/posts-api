REST API untuk aplikasi Post

Fitur yang disediakan
1. Autentikasi 
     Login, Register, Logout. 
2. Manajemen Data 
     User: Basic data + profile info. 
      Category: CRUD kategori artikel. 
     Post: CRUD artikel (title, content, category, cover image). 
     Bookmark: Mark/unmark post yang disukai. 
3. Relasi 
     User hasMany Posts. 
     Post belongsTo Category. 
     User many-to-many Bookmarked Posts. 
4. Catatan 
     Menerapkan soft delete 
     Gunakan Spatie Media Library untuk upload gambar artikel. 
     Pagination pada semua list API.

Fitur tambahan
- email verification
- forgot password

postman : untuk tes endpoint
mailtrap.io : untuk test verifikasi email
disertai juga file mysql

------------------------------------------

Endpoint

post api/register

Header
- Accept: application/json

Body
- name
- email
- password
- password_confirmation

------------------------------------------

post api/login

Header
- Accept: application/json

Body
- email
- password

-------------------------------------------

post api/forgot-password // akan kirim token ke email

Header
- Accept: application/json

body
- email

-------------------------------------------

post api/reset-password

Header
- Accept: application/json

body
- email
- token
- password
- password_confirmation

-------------------------------------------

get api/logout

Header
- Authorization : Bearer <Token>
- Accept: application/json

-------------------------------------------

get api/user

Header
- Authorization : Bearer <Token>
- Accept: application/json

-------------------------------------------

get api/category // show all category

Header
- Accept: application/json

-------------------------------------------

post api/category // create new category

Header
- Accept: application/json

body 
- name

-------------------------------------------

get /api/category/{category name} // show specific category

Header
- Accept: application/json

-------------------------------------------

put /api/category/{category name} // update category

Header
- Accept: application/json

Body // raw
- name

-------------------------------------------

DELETE /api/category/{category name} // delete category

Header
- Accept: application/json

-------------------------------------------

get api/post // Show all posts
get api/post/{group}/{name} // group by category or user, {id category or user}

Header
- Accept: application/json

-------------------------------------------

post api/post // create post

Header
- Authorization : Bearer <Token>
- Accept: application/json

Body 
- title
- slug
- body
- category_id // options di tentukan agar tidak aneh2
- cover // file gambar

-------------------------------------------

DELETE api/post/{id post} // Delete post

Header
- Authorization : Bearer <Token>
- Accept: application/json

-------------------------------------------

POST api/post/update/{id post} // Update post

Header
- Authorization : Bearer <Token>
- Accept: application/json

Body
- title
- slug
- body
- category_id
- cover // file

-------------------------------------------

GET api/bookmark // show all post bookmarked by specific user

Header
- Authorization : Bearer <Token>
- Accept: application/json

-------------------------------------------

GET api/bookmark/{post} // bookmark post by specific user 

Header
- Authorization : Bearer <Token>
- Accept: application/json

-------------------------------------------

Delete api/bookmark/{post} // Delete specific post in bookmark by specific user 

Header
- Authorization : Bearer <Token>
- Accept: application/json





