from flask import Flask, render_template, jsonify, request, redirect, url_for
from mysql.connector import connect

app = Flask(__name__)

db = connect(
    host='localhost',
    user='root',
    # password = 'root',
    password='',
    database='blog_db'
)
cursor = db.cursor()
# cursor.execute('USE blog_db')
""" cursor = db.cursor()
cursor.execute('CREATE DATABASE IF NOT EXISTS blog_db')
cursor.execute('USE blog_db')
query = 'create table if not exists blogs (id int primary key auto_increment, title varchar(150), subtitle varchar(150), content TEXT)'
cursor.execute(query) """


@app.route('/')
@app.route('/home')
def home():
    # def myblogs():
    cursor.execute('SELECT * FROM blogs')
    items = cursor.fetchall()
    myblogs = list(map(lambda lst: {
        'id': lst[0],
        'title': lst[1],
        'subtitle': lst[2],
        'content': lst[3],
        'image': lst[4]
    }, items))

    # first_blog = myblogs[0] if myblogs else None
    # print(first_blog)
    # return render_template('blogs.html', blogs=blogs, number=len(blogs))
    return render_template('index.html', myblogs=myblogs, number=len(myblogs))
    # return render_template('index.html', blog=first_blog, number=len(myblogs))
    # return render_template('/blogs')


@app.route('/about')
def about():
    return render_template('about.html')


@app.route('/api/v1/blogs')
def blog_api():
    cursor.execute('SELECT * FROM blogs')
    items = cursor.fetchall()
    blogs = list(map(lambda lst: {
        'id': lst[0],
        'title': lst[1],
        'subtitle': lst[2],
        'content': lst[3]
    }, items))
    return jsonify(blogs)


@app.route('/blogs')
def blogs():

    cursor.execute('SELECT * FROM blogs')
    items = cursor.fetchall()
    blogs = list(map(lambda lst: {
        'id': lst[0],
        'title': lst[1],
        'subtitle': lst[2],
        'content': lst[3],
        'image': lst[4]
    }, items))
    return render_template('blogs.html', blogs=blogs, number=len(blogs))


@app.route('/blog/<id>', methods=['GET', 'POST'])
def blog_details(id):

    delete_requested = request.args.get('delete')   
    mybutton = None
    if delete_requested is not None:
        print('bonjour')
        mybutton = 1

    cursor.execute('SELECT * FROM blogs WHERE id = %s', (id,))
    item = cursor.fetchone()
    blog = {
            'id': None,
            'title': None,
            'subtitle': None,
            'content': None,
            'image': None
        }
    if item is not None:
        blog = {
            'id': item[0],
            'title': item[1],
            'subtitle': item[2],
            'content': item[3],
            'delete': mybutton
                }
    if request.method == 'POST':
        if 'edit' in request.form:
            # Edit button was clicked
            return 'Post submitted via Edit'
        elif 'delete' in request.form:
            # Delete button was clicked
            cursor.execute('DELETE FROM blogs WHERE id = %s', (id,))
            db.commit()
            return redirect(url_for('blogs'))        
    return render_template('blog-details.html', blog=blog)


@app.route('/blog/create/', methods=['GET', 'POST'])
# def add_blog(id):
def add_blog():
    if request.method == 'POST':
        form = request.form 
        title = form.get('title') 
        subtitle = form.get('subtitle')
        content = form.get('content')
        cursor.execute('INSERT INTO blogs (title, subtitle, content) VALUES (%s, %s, %s)', (title, subtitle, content))
        db.commit()
        return redirect(url_for('blogs'))
    # return render_template('add-blog.html', blog = blog)
    return render_template('add-blog.html')


@app.route('/blog/edit/<id>', methods=['GET', 'POST'])
def edit_blog(id):
    blog = {
            'id': None,
            'title': None,
            'subtitle': None,
            'content': None
        }
    if id is not None:
        cursor.execute('SELECT * FROM blogs WHERE id = %s', (id,))
        item = cursor.fetchone()
        if item is not None:
            blog = {
                'id': item[0],
                'title': item[1],
                'subtitle': item[2],
                'content': item[3]
            }
    if request.method == 'POST':
        form = request.form
        title = form.get('title')
        subtitle = form.get('subtitle')
        content = form.get('content')
        cursor.execute('''
            UPDATE blogs SET title = %s, subtitle = %s, content = %s WHERE id=%s''', (title, subtitle, content, id))
        db.commit()
        return redirect(url_for('blogs'))
    return render_template('edit-blog.html', blog=blog)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)